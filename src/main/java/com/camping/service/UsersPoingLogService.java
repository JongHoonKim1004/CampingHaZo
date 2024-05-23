package com.camping.service;

import java.util.List;

import com.camping.domain.UsersPoingLogVO;

public interface UsersPoingLogService {
 
	   public void register(UsersPoingLogVO usresPointLog);
	   
	   public UsersPoingLogVO get(Long lno);
	   
	   public boolean modify(UsersPoingLogVO usresPointLog);
	   
	   public boolean remove(Long lno);
	   
	   public List<UsersPoingLogVO> getList();

	   public List<UsersPoingLogVO> findByUsername(String username);

	   
}
