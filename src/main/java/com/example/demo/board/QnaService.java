package com.example.demo.board;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.util.FileManager;
import com.example.demo.util.Pager;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class QnaService {
	
	@Value("${app.upload.qna}")
	private String path;
	
	@Autowired
	private QnaMapper qnaMapper;
	
	@Autowired
	private FileManager fileManager;
	
	public List<QnaVO> getList(Pager pager) throws Exception {
		pager.makeRow();
		pager.getNum(qnaMapper.getTotalCount(pager));
		return qnaMapper.getList(pager);
	}
	
	public QnaVO getDetail(QnaVO qnaVO) throws Exception{
		qnaMapper.setHit(qnaVO);
		return qnaMapper.getDetail(qnaVO);
	}
	
	public QnaFileVO getFileOne(QnaFileVO qnaFileVO) throws Exception{
		return qnaMapper.getFileOne(qnaFileVO);
		
	}

	public int setAdd(QnaVO qnaVO) throws Exception {
		 int result = qnaMapper.setAdd(qnaVO);
		 
		 File file = new File(path);

		 if(!file.exists()) {
			 boolean check = file.mkdirs();
		 } 

		 for(MultipartFile f: qnaVO.getFiles()) {
			 if(!f.isEmpty()) {
				 String fileName = fileManager.saveFiles(f, path);
				 QnaFileVO qnaFileVO = new QnaFileVO();
				 qnaFileVO.setFileName(fileName);
				 qnaFileVO.setOriName(f.getOriginalFilename());
				 qnaFileVO.setNum(qnaVO.getNum());
				 qnaMapper.setFiles(qnaFileVO); 
			 }
		 }
				
		return result;
		
		
	}
	

}
