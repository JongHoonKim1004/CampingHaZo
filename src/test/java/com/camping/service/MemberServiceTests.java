package com.camping.service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.camping.domain.MemberVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberServiceTests {

	@Autowired
	private MemberService service;
	
	@Test
	public void testGetList() {
		   service.getList().forEach(member -> log.info(member));
	}
	
	
	@Test
	public void testRegister() {
		 MemberVO member = new MemberVO();
		 member.setUsername("member@naver.com");
		 member.setName("리동희");
		 member.setPassword("1313");
		 member.setAddr("수원시");
		 member.setZipCode(15);
		 member.setPhone("01033333333");
		 member.setCompNo(3);
		 service.register(member);
		 log.info("생성괸 번호:"+ member.getMno());
	}
	
	@Test
	public void testGet() {
		   log.info(service.get(2L));
	}
	
	@Test 
	public void Delete() {
		  log.info("REMOVE RESULT:"+ service.remove(3L));
	}
	
	@Test
	public void testUpdate(){
	   
		 MemberVO member = service.get(2L);
		 
		 if(member == null) {
			        return;
		 }
		 
		 member.setAddr("서울시");
		 log.info("MODIFY RESULT:"+ service.modify(member));
	}
}
