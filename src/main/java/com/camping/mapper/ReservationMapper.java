package com.camping.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.camping.domain.Criteria;
import com.camping.domain.ReservationVO;

public interface ReservationMapper {
 
	
	 public List<ReservationVO> getList();
	 
	 public void insert(ReservationVO reservation);
	 
	 public void insertSelectKey(ReservationVO reservation);
	 
	 public ReservationVO read(Long rno);
	 
	 public int delete(Long rno);
	 
	 public int update(ReservationVO reservation);
	 
	 public List<ReservationVO> getListForAdmin();
	 
	 public List<ReservationVO> findByUsername(String username);
	 
	 public List<ReservationVO> findByName(String name);
}
