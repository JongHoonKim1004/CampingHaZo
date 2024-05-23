package com.camping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camping.domain.MyCampingVO;
import com.camping.mapper.MyCampingMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MyCampingServiceImpl implements MyCampingService {
	
	@Autowired
	private MyCampingMapper mapper;
	
	@Override
	public void register(MyCampingVO board) {
		log.info("register....." + board);
		mapper.insertSelectKey(board);
	}

	@Override
	public MyCampingVO get(Long cno) {
		log.info("get....." + cno);
		return mapper.read(cno);
	}

	@Override
	public boolean modify(MyCampingVO myCamping) {
		log.info("modify..." + myCamping);
		return mapper.update(myCamping)==1;
	}

	@Override
	public boolean remove(Long cno) {
		  log.info("remove..." + cno);
		return mapper.delete(cno)==1;
	}

	@Override
	public List<MyCampingVO> getList() {
		log.info("getList....");
		return mapper.getList();
	}

	@Override
	public List<MyCampingVO> findBymember(String member) {
		// TODO Auto-generated method stub
		return mapper.findBymember(member);
	}

}
