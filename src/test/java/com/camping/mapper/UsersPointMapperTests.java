package com.camping.mapper;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.camping.domain.UsersPointVO;

import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class UsersPointMapperTests {

	@Autowired
	private UsersPointMapper mapper;
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(usersPint ->log.info(usersPint));
	}
	@Test
	public void testInsert() { //내일 해결
		  UsersPointVO usersPoint = new UsersPointVO();
		  usersPoint.setUsername("test@naver.com");
		  usersPoint.setPoint(2000);
		  
		  mapper.insert(usersPoint);
		  log.info(usersPoint);
		  
	}
	
	@Test
	public void testRead() {
		 UsersPointVO usersPoint = mapper.read(2L);
		 log.info(usersPoint);
	}
	
	@Test
	public void testDelete() {
		  log.info("DELETE :" + mapper.delete(2L));
	}
	@Test
	public void testUpdate() {
		    UsersPointVO usersPoint = new UsersPointVO();
		    usersPoint.setPno(3L);
		    usersPoint.setUsername("test@naver.com");
		    usersPoint.setPoint(5000);
		  
		    int count = mapper.update(usersPoint);
		    log.info("UPDATE COUNT:" + count);
	}

}
