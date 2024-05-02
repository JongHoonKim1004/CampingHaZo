package com.camping.service;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.camping.domain.MemberVO;

@Service
public interface MemberService {

	public void memberJoin(MemberVO member) throws Exception;
	
	
}
