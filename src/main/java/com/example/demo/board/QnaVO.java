package com.example.demo.board;

import java.sql.Date;
import java.util.List;

import javax.validation.constraints.NotBlank;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class QnaVO {
	
	private Long num;
	@NotBlank(message="작성자를 입력해주세요")
	private String writer;
	@NotBlank
	private String title;
	private String contents;
	private Long hit;
	private Date regDate;
	private Long ref;
	private Long step;
	private Long depth;
	
	private MultipartFile [] files;
	
	private List<QnaFileVO> fileVOs;

}
