package com.camping.service;

import java.util.List;

import com.camping.domain.ReservationVO;

public interface ReservationService {
	
	public void register(ReservationVO reservation);
	
	public ReservationVO get(Long rno);
	
	public boolean modify(ReservationVO reservation);
	
	public boolean remove(Long rno);
	
	public List<ReservationVO> getList();
	
	public List<ReservationVO> getListForAdmin();
	
	public List<ReservationVO> findByUsername(String username);
	
	public List<ReservationVO> findByName(String name);
}
