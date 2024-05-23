package com.camping.mapper;

import static org.junit.Assert.*;



import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.camping.domain.UsersVO;
import com.camping.mapper.UsersMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class UsersMapperTests {

	@Autowired
	private UsersMapper mapper;
	
	
	@Test
	public void testGetList() {
		    mapper.getList().forEach(users -> log.info(users));
		    	
		    }
	
	@Test
	public void testInsert() {
		   UsersVO users = new UsersVO();
		   users.setUsername("test@naver.com");
		   users.setName("test");
		   users.setPassword("111");
		   users.setPhone("010-2222-2222");
		   users.setAddr("서울특별시");
		   users.setAddrDetail("용산구");
		   users.setZipCode(115-22);
           
		   mapper.insert(users);
		   log.info(users);
		   
	}
	
	@Test
    public void testRead() {
		  UsersVO users = mapper.read(1L);
		  log.info(users);
	}
	
	@Test
	public void testDelete() {
		     log.info("DELETE COUNT :" + mapper.delete(5L));
	}
	
	@Test
	public void testUpdate() {
		  UsersVO users = new UsersVO();
		  users.setUno(4L);
		  users.setUsername("zee0000@naver.com");
		  users.setName("홍길동");
		  users.setPassword("1515");
		  users.setPhone("010-9999-9999");
		  users.setAddr("서울시");
		  users.setAddrDetail("강남구");
		  users.setZipCode(111-11);
		  
		  int count = mapper.update(users);
		  log.info("UPDATE COUNT:"+ count);
		  
	}
	
	
	}
	  
		
		 
		
	

