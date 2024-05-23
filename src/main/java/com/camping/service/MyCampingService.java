package com.camping.service;

import java.util.List;

import com.camping.domain.MyCampingVO;

public interface MyCampingService {
 
	 public void register(MyCampingVO myCamping);
	 
	 public MyCampingVO get(Long cno);
	 
	 public boolean modify(MyCampingVO myCamping);
	 
	 public boolean remove(Long cno);
	 
	 public List<MyCampingVO> getList();
	 
	 public List<MyCampingVO> findBymember(String member);
}
