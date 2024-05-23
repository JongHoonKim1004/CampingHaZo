package com.camping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camping.domain.UsersPointVO;
import com.camping.mapper.UsersPointMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor
public class UsersPointServiceImpl implements UsersPointService {

	@Autowired
	private UsersPointMapper mapper;
	
	@Override
	public void register(UsersPointVO usersPoint) {
		log.info("register :"+usersPoint);
		mapper.insertSelectKey(usersPoint);
		
		
	}

	@Override
	public UsersPointVO get(Long pno) {
	      log.info("get....." + pno);
	      return mapper.read(pno);
	}

	@Override
	public boolean modify(UsersPointVO usersPoint) {
	     log.info("modify.... " + usersPoint);
	     return mapper.update(usersPoint)==1;
	}

	@Override
	public boolean remove(Long pno) {
	     log.info("remove...." + pno);
	     return mapper.delete(pno)==1;
	}

	@Override
	public List<UsersPointVO> getList() {
		log.info("getList...");
		return mapper.getList();
	}

	@Override
	public UsersPointVO findByUsername(String username) {
		// TODO Auto-generated method stub
		return mapper.findByUsername(username);
	}

}
