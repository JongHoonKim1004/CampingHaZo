package com.camping.service;

import java.util.List;

import com.camping.domain.MemberVO;

public interface MemberService {
	
	  public void register(MemberVO member); 
   
	  public MemberVO get(Long mno);
	  
	  public boolean modify(MemberVO member);
	  
	  public boolean remove(Long mno);
	  
	  public List<MemberVO> getList();
	  
	  public MemberVO findByUsername(String username);
	  
	  public boolean authenticate(String username, String passoerd);
	  
	  public void setAuthenticationMember(String id);
}
