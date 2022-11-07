package com.example.demo.member;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

@Mapper
public interface MemberMapper {

	public MemberVO getLogin(String username) throws UsernameNotFoundException;
	
	public int setJoin(MemberVO memberVO) throws Exception;
	
	public int setRole(MemberVO memberVO) throws Exception;
	
	public Integer getIdCheck(MemberVO memberVO) throws Exception;
	
}
