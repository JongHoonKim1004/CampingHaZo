package com.camping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camping.domain.ReservationVO;
import com.camping.mapper.ReservationMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	private ReservationMapper mapper;
	
	@Override
	public void register(ReservationVO reservation) {
		log.info("register.."+reservation);
		mapper.insert(reservation);
		
	}

	@Override
	public ReservationVO get(Long rno) {
		log.info("get..."+ rno);
		return mapper.read(rno);
	}

	@Override
	public boolean modify(ReservationVO reservation) {
		log.info("modify :" + reservation);
		return mapper.update(reservation)==1;
	}

	@Override
	public boolean remove(Long rno) {
		log.info("remove:"+ rno);
		return mapper.delete(rno)==1;
	}

	@Override
	public List<ReservationVO> getList() {
		log.info("getList....");
		return mapper.getList();
	}

	@Override
	public List<ReservationVO> getListForAdmin() {
		// TODO Auto-generated method stub
		return mapper.getListForAdmin();
	}

	@Override
	public List<ReservationVO> findByUsername(String username) {
		// TODO Auto-generated method stub
		return mapper.findByUsername(username);
	}

	@Override
	public List<ReservationVO> findByName(String name) {
		// TODO Auto-generated method stub
		return mapper.findByName(name);
	}

	

}
