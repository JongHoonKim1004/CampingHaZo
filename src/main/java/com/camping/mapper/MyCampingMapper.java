package com.camping.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.camping.domain.MyCampingVO;

public interface MyCampingMapper {
	
	
	 public List<MyCampingVO> getList();
	 
	 public void insert(MyCampingVO myCamping);
	 
	 public void insertSelectKey(MyCampingVO myCamping);
	 
	 public MyCampingVO read(Long cno);
	 
	 public int delete(Long  cno);
	 
	 public int update(MyCampingVO myCamping);
	 
	 public List<MyCampingVO> findBymember(String member);
}