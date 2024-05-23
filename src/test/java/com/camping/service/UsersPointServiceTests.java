package com.camping.service;

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
public class UsersPointServiceTests {

	@Autowired
	private UsersPointService service;
	
   @Test
   public void testRegister() {
	     UsersPointVO usersPoint = new UsersPointVO();
	     usersPoint.setUsername("test");
	     usersPoint.setPoint(12000);
	     service.register(usersPoint);
	     log.info("생성 게시물:" + usersPoint.getPno());
	     
   }
   
   @Test
   public void testGetList() {
	    service.getList().forEach(usersPoint ->log.info(usersPoint));
   }

   
   @Test
   public void testGet() {
          
         log.info(service.get(3L));
   }
   
   @Test
   public void testDelete() {
   
   	log.info("REMOVE RESULT : " + service.remove(2L));
   }

   @Test
   public void testUpdate() {
   	// 번호가 있는지 확인
   	UsersPointVO usersPoint = service.get(7L);

   	if (usersPoint == null) {
   			return;
   	}

   	usersPoint.setPoint(90000);
   	log.info("MODIFY RESULT: " + service.modify(usersPoint));
   }
}
