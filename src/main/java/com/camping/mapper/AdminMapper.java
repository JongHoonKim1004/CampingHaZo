package com.camping.mapper;

import java.util.List;

import com.camping.domain.AdminVO;
import org.apache.ibatis.annotations.Select;

public interface AdminMapper {
	
	public List<AdminVO> getList();
 
	public void insert(AdminVO admin);

	public void insertSelectKey(AdminVO admin);
	
	public AdminVO read(Long ano);
	
	public int delete(Long ano);
	
	public int update(AdminVO admin);
	
	public AdminVO findByUsername(String username);
}
