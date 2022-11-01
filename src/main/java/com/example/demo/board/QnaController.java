package com.example.demo.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.util.Pager;

@Controller
@RequestMapping(value = "/qna/*")
public class QnaController {
	
	@Autowired
	private QnaService qnaService;

	@GetMapping("list")
	public ModelAndView getList(Pager pager) throws Exception {
		List<QnaVO> qList = qnaService.getList(pager);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", qList);
		mv.setViewName("board/list");
		return mv;
	}
	
	@GetMapping("detail")
	public ModelAndView getDetail(QnaVO qnaVO) throws Exception{
		qnaVO = qnaService.getDetail(qnaVO);
		ModelAndView mv = new ModelAndView();
		mv.addObject("qvo", qnaVO);
		mv.setViewName("board/detail");
		return mv;
	}
	
	@GetMapping("add")
	public String setReadyAdd(QnaVO qnaVO) throws Exception {
		return "board/add";
	}
	
	@PostMapping("add")
	@ResponseBody 
	public ModelAndView setAdd(QnaVO qnaVO) throws Exception {
		int result = qnaService.setAdd(qnaVO);
		ModelAndView mv = new ModelAndView();
		mv.addObject("result", result);
		mv.setViewName("redirect:./list");
		return mv; 
	}
	
}
