package com.camping.service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.camping.domain.UsersCampingVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class UsersCampingServiceTests {

	    @Autowired
	    private UsersCampingService service;
		
	    // DB확인 하고 화요일에 수정하자!
	   @Test
	   public void testRegister() {
		   UsersCampingVO usersCamping = new UsersCampingVO();
		   usersCamping.setUsername("test1");
		   usersCamping.setCamping("test캠핑");
		   usersCamping.setAddr("test주소");
		   usersCamping.setCampingNo(5);
		   service.register(usersCamping);
		   log.info("생성된 게시물:"+ usersCamping.getCno());
		   
	   }
	   
	   @Test
	   public void testGetList() {
		    service.getList().forEach(usersCamping ->log.info(usersCamping));
	   }
	   
	   @Test
	   public void testGet() {
	           
	            log.info(service.get(8L));
	   }
	   
	   @Test
	   public void testDelete() {
	   
	   	log.info("REMOVE RESULT : " + service.remove(8L));
	   }

	   @Test
	   public void testUpdate() {
	   	
	   	UsersCampingVO usersCamping = service.get(1L);

	   	if (usersCamping == null) {
	   			return;
	   	}

	   	usersCamping.setCampingNo(5);
	   	log.info("MODIFY RESULT: " + service.modify(usersCamping));
	   }

}
