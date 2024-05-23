package com.camping.service;

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
public class UsersPoingLogServiceTests {

	@Autowired
    private UsersPoingLogService service;
	
   @Test
   public void testRegister() {
	    UsersPoingLogVO usersPointLog = new UsersPoingLogVO();
	    usersPointLog.setUsername("test@naver.com");
	    usersPointLog.setPointChange(500);
	    usersPointLog.setChangeReason("포인트test");
	    service.register(usersPointLog);
	    log.info("생성된 게시물 :" + usersPointLog.getLno());
   }
   
   @Test
   public void testGetList() {
	    service.getList().forEach(usersPointLog ->log.info(usersPointLog));
   }
   
   @Test
   public void testGet() {
            
            log.info(service.get(3L));
   }
   
   @Test
   public void testDelete() {
   
   	log.info("REMOVE RESULT : " + service.remove(3L));
   }

   @Test
   public void testUpdate() {
   	
   	UsersPoingLogVO usersPointLog = service.get(1L);

   	if (usersPointLog == null) {
   			return;
   	}

   	usersPointLog.setPointChange(150);
   	log.info("MODIFY RESULT: " + service.modify(usersPointLog));
   }

}
