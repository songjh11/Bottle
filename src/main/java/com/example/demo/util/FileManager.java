package com.example.demo.util;

import java.io.File;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileManager {
	
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
