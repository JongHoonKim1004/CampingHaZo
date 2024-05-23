package com.camping.service;

import java.util.List;

import com.camping.domain.UsersCampingVO;

public interface UsersCampingService { 
	  
	 public void register(UsersCampingVO usersCamping);
	 
	 public UsersCampingVO get(Long cno);
	 
	 public boolean modify(UsersCampingVO usersCamping);
	 
	 public boolean remove(Long cno);
	 
	 public List<UsersCampingVO> getList();

	 public List<UsersCampingVO> findByUsername(String username);
}
