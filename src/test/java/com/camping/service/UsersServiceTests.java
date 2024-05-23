package com.camping.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.camping.domain.UsersVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class UsersServiceTests {
   
	
	 @Autowired
	 private UsersService service;
	 
	@Test
	public void testGetList() {
		   service.getList().forEach(users ->log.info(users));
	}
	
	@Test
	public void testRegister() {
		 UsersVO users = new UsersVO();
		 users.setUsername("test1");
		 users.setName("test이름");
		 users.setPassword("1212");
		 users.setPhone("010-0808-0180");
		 users.setAddr("서울");
		 users.setAddrDetail("서월0808");
		 users.setZipCode(0);
		 
		 service.register(users);
		 log.info("생성" + users.getUno());
		 
	}
	
	@Test
	public void testGet() {
		   log.info(service.get(1L));
	}
	
	@Test
	public void testDelete() {
		  log.info("REMOVE RESULT:" + service.remove(4L));
	}
	
	@Test
	public void testUpdate() {
		    UsersVO users = service.get(2L);
		    
		    if(users == null) {
		    	       return;
		    }
		    
		    users.setPassword("2222");
		    log.info("MODIFY:" + service.modify(users));
	}
	 
}
