package com.camping.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.camping.domain.UsersPoingLogVO;

public interface UsersPoingLogMapper {
	
	public List<UsersPoingLogVO> getList();
	
	public void insert(UsersPoingLogVO userspointLog);
	
	public void insertSelectKey(UsersPoingLogVO usersPointLog);
	
	public UsersPoingLogVO read(Long lno);
	
	public int delete(Long lno);
	
	public int update(UsersPoingLogVO usersPointLog);
	
	public List<UsersPoingLogVO> findByUsername(String username);

}
