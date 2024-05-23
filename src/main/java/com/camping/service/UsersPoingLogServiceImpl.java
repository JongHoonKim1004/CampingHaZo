package com.camping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camping.domain.UsersPoingLogVO;
import com.camping.mapper.UsersPoingLogMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class UsersPoingLogServiceImpl implements UsersPoingLogService {
	
	@Autowired
	private UsersPoingLogMapper mapper;
	
	@Override
	public void register(UsersPoingLogVO usresPointLog) {
		log.info(usresPointLog);
		mapper.insertSelectKey(usresPointLog);
		
	}

	@Override
	public UsersPoingLogVO get(Long lno) {
	      log.info("get....." + lno);
	      return mapper.read(lno);
	}

	@Override
	public boolean modify(UsersPoingLogVO usresPointLog) {
		log.info("modify...." + usresPointLog);
		return mapper.update(usresPointLog)==1;
	}

	@Override
	public boolean remove(Long lno) {
		 log.info("remove.." + lno);
		return mapper.delete(lno)==1;
	}

	@Override
	public List<UsersPoingLogVO> getList() {
		log.info(log);
		return mapper.getList();
	}

	@Override
	public List<UsersPoingLogVO> findByUsername(String username) {
		// TODO Auto-generated method stub
		return mapper.findByUsername(username);
	}

}
