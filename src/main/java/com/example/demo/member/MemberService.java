package com.example.demo.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MemberService {
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	public boolean getMemberError(MemberVO memberVO, BindingResult bindingResult) throws Exception {
		boolean check = false;
		
		check = bindingResult.hasErrors();
		
		if(!memberVO.getPw().equals(memberVO.getPw2())) {
			check=true;
			bindingResult.rejectValue("pw2", "member.password.notEqual");
		}
		
		int result = memberMapper.getIdCheck(memberVO);
		
		if(result>0) {
			check=true;
			bindingResult.rejectValue("id", "member.id.notUse");
		}
		log.info("check => {}", check);
		return check;
	}
	
	public int setJoin(MemberVO memberVO) throws Exception {
		memberVO.setPw(passwordEncoder.encode(memberVO.getPw()));
		int result = memberMapper.setJoin(memberVO);
		if(result>0) {
			result = memberMapper.setRole(memberVO);
		}
		
		return result;
	}

}
