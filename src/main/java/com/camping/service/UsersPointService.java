package com.camping.service;

import java.util.List;

import com.camping.domain.UsersPointVO;

public interface UsersPointService {
	
	public void register(UsersPointVO usersPoint);
	
	public UsersPointVO get(Long pno);
	
	public boolean modify(UsersPointVO usersPoint);
	
	public boolean remove(Long pno);
	
	public List<UsersPointVO> getList();

	public UsersPointVO findByUsername(String username);
}
