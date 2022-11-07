package com.example.demo.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.board.QnaFileVO;
import com.example.demo.board.QnaService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class FileController {

	@Autowired
	private QnaService qnaService;
	
	@GetMapping("/fileDown/{p}")
	public ModelAndView fileDown(@PathVariable(name="p") String path, QnaFileVO qnaFileVO) throws Exception{
		log.info("Path : {} ", path);
	ModelAndView mv = new ModelAndView();
	
	if(path.equals("qna")) {
		qnaFileVO = qnaService.getFileOne(qnaFileVO);
	} else if(path.equals("notice")) {
		
	}
	
	mv.addObject("fileVO", qnaFileVO);
	mv.addObject("path", path);
	mv.setViewName("fileManager");
	
	return mv;
	}
}
