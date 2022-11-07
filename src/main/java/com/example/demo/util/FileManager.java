package com.example.demo.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.AbstractView;

import com.example.demo.board.QnaFileVO;

import lombok.val;
import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class FileManager extends AbstractView  {
	
	@Value("${app.download.base}")
	private String base;
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		QnaFileVO qnaFileVO = (QnaFileVO)model.get("fileVO");
		String path = (String)model.get("path");
		log.info("base+path : {} ", base+path);
		log.info("qnaFileVO.getFileName() : {} ", qnaFileVO.getFileName());
		
		File file = new File(base+path, qnaFileVO.getFileName());
		
		//한글 처리
		 response.setCharacterEncoding("UTF-8");
		 
		 //총 파일의 크기
		 response.setContentLengthLong(file.length());
		 
		 //다운로드시 파일의 이름을 인코딩
		 String oriName = URLEncoder.encode(qnaFileVO.getOriName(), "UTF-8");
		 
		 //header 설정
		 response.setHeader("Content-Disposition", "attachment;filename=\""+oriName+"\"");
		 response.setHeader("Content-Transfer-Encoding", "binary");
		 
		 //HDD에서 파일을 읽고
		 FileInputStream fi = new FileInputStream(file);
		 //Client 로 전송 준비
		 OutputStream os = response.getOutputStream();
		 
		 //전송
		 FileCopyUtils.copy(fi, os);
		 
		 //자원 해제
		 os.close();
		 fi.close();
		
	}
	
	
	public String saveFiles(MultipartFile multipartFile, String path) throws Exception {
			
		//1. 중복되지 않은 파일명 만들기
		String fileName = UUID.randomUUID().toString();
		
		//2. 확장자 위해서 _ 달기
		StringBuffer bf = new StringBuffer();
		bf.append(fileName);
		bf.append("_");
		
		//3. 파일 확장자 분리하기
		String ex = multipartFile.getOriginalFilename();
		ex = ex.substring(ex.lastIndexOf("."));
		bf.append(ex);
		
		//4. 저장된 파일명
		fileName = bf.toString();
		
		//5. 파일 저장하기
		File file = new File(path, fileName);
		
		multipartFile.transferTo(file);
		
		//6. 파일명 리턴		
		return fileName;
	}

}
