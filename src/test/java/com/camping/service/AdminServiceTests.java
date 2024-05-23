package com.camping.service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.camping.domain.AdminVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class AdminServiceTests {

	
	@Autowired
	private AdminService service;
	
	 @Test
	 public void testRegister() {
		  AdminVO admin = new AdminVO();
		  admin.setUsername("admin@naver.com");
		  admin.setPassword("1212");
		  admin.setName("test");
		  admin.setEmployeeNo(9);
		  
		  service.register(admin);
		  log.info("생성된 번호:" + admin.getAno());
	 }
	 
	 @Test
	 public void testGetLst() {
		   service.getList().forEach(admin -> log.info(admin));
	 }
	 
	 @Test
	 public void testGet() {
		  log.info(service.get(22L));
	 }
	 
	 @Test
	 public void testDelete() {
	 	
	 	log.info("REMOVE RESULT : " + service.remove(22L));
	 }

	 @Test
	 public void testUpdate() {
	 	
	 	AdminVO admin = service.get(23L);

	 	if (admin == null) {
	 			return;
	 	}

	 	admin.setPassword("3333");
	 	log.info("MODIFY RESULT: " + service.modify(admin));
	 }

}
