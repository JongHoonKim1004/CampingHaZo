package com.camping.service;

import java.util.List;

import com.camping.domain.AdminVO;

public interface AdminService {

	public void register(AdminVO admin);
	
	public AdminVO get(Long ano);
	
	public boolean modify(AdminVO admin);
	
	public boolean remove(Long ano);
	
	public List<AdminVO> getList();
	
	public AdminVO findByUsername(String username);
	
	public boolean authenticate(String username, String password);

	public void setAuthenticationAdmin(String id); 
}
