package com.example.demo.member;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping(value = "/member/*")
@Slf4j
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@GetMapping("login")
	public void getLogin() throws Exception{
		
	}
	
	@GetMapping("join")
	public void setJoin(@ModelAttribute MemberVO memberVO) throws Exception{
		
	}
	
	@PostMapping("join")
	public ModelAndView setJoin(ModelAndView mv, @Valid MemberVO memberVO,BindingResult bindingResult) throws Exception{
		log.info("join");
		boolean check = memberService.getMemberError(memberVO, bindingResult);
		//check가 true=>에러있음
		//check가 false=>에러없음
		if(check) {
			log.info("=================회원가입검증에러=================");
			mv.setViewName("member/join");
			return mv;
		} else {
			int result = memberService.setJoin(memberVO);
			mv.addObject("result", result);
			mv.setViewName("member/login");
			return mv;
		}
	}

}
