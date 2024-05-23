package com.camping.mapper;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.camping.domain.UsersPoingLogVO;

import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class UsersPoingLogMapperTests {

	@Autowired
	private UsersPoingLogMapper mapper;
	
	@Test
	public void testGetList() {
		  mapper.getList().forEach(usersPointLog ->log.info(usersPointLog));
	}
	
	@Test
	public void testInsert() {
		  UsersPoingLogVO usersPointLog = new UsersPoingLogVO();
		  usersPointLog.setUsername("test@naver.com");
		  usersPointLog.setPointChange(1500);
		  usersPointLog.setChangeReason("포인트 사용");
		  
		  mapper.insert(usersPointLog);
		  log.info(usersPointLog);
	}
	
	
	
	@Test
	public void testDelete() {
		 log.info("DELETE COUNT :" + mapper.delete(2L));
	}
	
	@Test
	public void testRead() {
		UsersPoingLogVO usersPointLogVO = mapper.read(1L);
				log.info(usersPointLogVO);
	}
	
	@Test
	public void testUpdate() {
		  UsersPoingLogVO usersPointLog = new UsersPoingLogVO();
		  usersPointLog.setLno(1L);
		  usersPointLog.setUsername("test@naver.com");
		  usersPointLog.setPointChange(5000);
		  usersPointLog.setChangeReason("출석체크");
		  
		  int count = mapper.update(usersPointLog);
		  log.info("UPDATE COUNT :" + count);
		  
	}

}
