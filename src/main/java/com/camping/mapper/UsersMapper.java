package com.camping.mapper;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.camping.domain.UsersVO;

public interface UsersMapper {

	public List<UsersVO> getList();
	
	public void insert(UsersVO users);
	
	public void insertSelectKey(UsersVO users);
	
	public UsersVO read(Long uno);
	
	public int delete(Long uno);
	
	public int update(UsersVO user);
	 
	public UsersVO findByUsername(String username);
	
	public UsersVO searchUsersByEmail(String email);
	
}
