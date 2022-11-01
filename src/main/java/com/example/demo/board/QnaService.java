package com.example.demo.board;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class QnaService {
	
	@Value("${app.upload.qna}")
	private String path;
	
	@Autowired
	private QnaMapper qnaMapper;
	
	public List<QnaVO> getList(QnaVO qnaVO) throws Exception {
		return qnaMapper.getList(qnaVO);
	}
	
	public QnaVO getDetail(QnaVO qnaVO) throws Exception{
		return qnaMapper.getDetail(qnaVO);
	}

	public int setAdd(QnaVO qnaVO) throws Exception {
		qnaMapper.setAdd(qnaVO);
		
		File file = new File(path);
		
		
		
		return 0;
		
		
	}
	

}
