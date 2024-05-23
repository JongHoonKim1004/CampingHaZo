package com.camping.mapper;

import java.util.List;

import com.camping.domain.MemberVO;

public interface MemberMapper {
  
	 public List<MemberVO> getList();
	 
	 public void insert(MemberVO member);  
	 
	 public void insertSelectKey(MemberVO member);
	 
	 public MemberVO read(Long mno);
	 
	 public int delete(Long mno);
	 
	 public int update(MemberVO member);
	 
	 public MemberVO findByUsername(String username);
}
