package com.camping.mapper;

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
public class UsersCampingMapperTests {

	@Autowired
	private  UsersCampingMapper mapper;
	
	@Test
	public void testGetList() {
		   mapper.getList().forEach(usersCamping -> log.info(usersCamping));
	}

	
   @Test
   public void testInsert() {
	   UsersCampingVO userCamping = new UsersCampingVO();
	   userCamping.setUsername("zee0542@naver.com");
	   userCamping.setCamping("테스트");
	   userCamping.setAddr("주소 테스트");
	   userCamping.setCampingNo(1);
	   
	   mapper.insert(userCamping);
	   log.info(userCamping);
	   
   }
   
   @Test
   public void testRead() {
	      UsersCampingVO userCamping = mapper.read(8L);
	      log.info(userCamping);
   }
   
   @Test
   public void testDelete() {
	       log.info("DELETE COUNT :" + mapper.delete(7L));
   }
   
   @Test
   public void testUpdate() {
	        UsersCampingVO usersCamping = new UsersCampingVO();
	        usersCamping.setCno(1L);
	        usersCamping.setUsername("cam@naver.com");
	        usersCamping.setCamping("test 수정");
	        usersCamping.setAddr("테스트");
	        usersCamping.setCampingNo(2);
	        
	        int count = mapper.update(usersCamping);
	        log.info("UPDATE COUNT:"+ count);
   }
}
