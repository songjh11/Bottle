package com.example.demo.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MemberSecurityService extends DefaultOAuth2UserService implements UserDetailsService {

//	extends DefaultOAuth2UserService 
	
	@Autowired
	private MemberMapper memberMapper;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		log.info("=============================");
		MemberVO memberVO = memberMapper.getLogin(username);
		log.info("memberVO => {}", memberVO);
		return memberVO;
	}
	
	
	
	

}
