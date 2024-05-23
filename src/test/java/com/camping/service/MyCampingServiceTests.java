package com.camping.service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.camping.domain.MyCampingVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MyCampingServiceTests {

	@Autowired
	private MyCampingService service;
	
	@Test
	public void testRegister() {
	MyCampingVO myCamping = new MyCampingVO();
	myCamping.setName("캠핑장 test");
	myCamping.setAddr("테스트 주소");
	myCamping.setPhone("010-3333-3333");
	myCamping.setMember("cam@naver.com");
	service.register(myCamping);
	log.info("생성된 번호 :" + myCamping.getCno());
	
	}
	
	@Test
	public void testGetList() {
		  service.getList().forEach(myCamping ->log.info(myCamping));
	}
	
	@Test
	public void testGet() {
		 log.info(service.get(8L));
		
	}
	@Test
	public void testDelete() {
		   log.info("REMOVE RESULT :" + service.remove(8L));
	}

	@Test
	public void testUpdate() {
		 MyCampingVO myCamping = service.get(6L);
		 
		 if(myCamping == null) {
			     return;
		 }
		 
		 myCamping.setName("캠핑장 변경");
		 log.info("MODIFY RESULT" + service.modify(myCamping));
	}
	
}
