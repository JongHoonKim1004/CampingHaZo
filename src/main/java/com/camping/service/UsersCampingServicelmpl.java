package com.camping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camping.domain.UsersCampingVO;
import com.camping.mapper.UsersCampingMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class UsersCampingServicelmpl implements UsersCampingService {

	@Autowired
	private UsersCampingMapper mapper;
	
	@Override
	public void register(UsersCampingVO usersCamping) {
		log.info("register...."+ usersCamping);
		mapper.insert(usersCamping);
		
	}

	@Override
	public UsersCampingVO get(Long bno) {
	      log.info("get....." + bno);
	      return mapper.read(bno);
	}

	@Override
	public boolean modify(UsersCampingVO usersCamping) {
	     log.info("modify.... " + usersCamping);
	     return mapper.update(usersCamping)==1;
	}

	@Override
	public boolean remove(Long cno) {
	     log.info("remove...." + cno);
	     return mapper.delete(cno)==1;
	}

	@Override
	public List<UsersCampingVO> getList() {
		log.info("getList.....");
		return mapper.getList();
	}

	@Override
	public List<UsersCampingVO> findByUsername(String username) {
		// TODO Auto-generated method stub
		return mapper.findByUsername(username);
	}

}
