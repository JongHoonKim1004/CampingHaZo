package com.camping.service;

import java.util.List;

import com.camping.domain.UsersVO;

public interface UsersService {
 
	 public void register(UsersVO users);
	 
	 public UsersVO get(Long uno);
	 
	 public boolean modify(UsersVO users);
	 
	 public boolean remove(Long uno);
	 
	 public List<UsersVO> getList();
	 
	 public UsersVO findByUsername(String username);
}
