package com.example.demo.board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.util.Pager;

@Mapper
public interface QnaMapper {

	public List<QnaVO> getList(Pager pager) throws Exception;

	public QnaVO getDetail(QnaVO qnaVO) throws Exception;
	
	public int setAdd(QnaVO qnaVO) throws Exception;
	
	public int setFiles(QnaFileVO qnaFileVO) throws Exception; 
	
}
