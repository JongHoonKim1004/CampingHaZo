package com.camping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camping.domain.UsersVO;
import com.camping.mapper.UsersMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class UsersServiceImpl implements UsersService {
	
	@Autowired
	private UsersMapper mapper;
	
	


	@Override
	public UsersVO get(Long uno) {
	    log.info("get..." + uno);
		return mapper.read(uno);
	}

	@Override
	public boolean modify(UsersVO users) {
		 log.info("modify..." + users);
		return mapper.update(users)==1;
	}

	@Override
	public boolean remove(Long uno) {
		log.info("remove..." + uno);
		return mapper.delete(uno)==1;
	}

	@Override
	public List<UsersVO> getList() {
		log.info("getList");
		return mapper.getList();
	}

	@Override
	public void register(UsersVO users) {
		log.info("register..." + users);
		mapper.insertSelectKey(users);
		
	}

	@Override
	public UsersVO findByUsername(String username) {
		// TODO Auto-generated method stub
		return mapper.findByUsername(username);
	}
   
   
}
