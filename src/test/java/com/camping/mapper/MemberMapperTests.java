package com.camping.mapper;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.camping.domain.MemberVO;
import com.camping.mapper.MemberMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/security-context.xml",
"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class MemberMapperTests {

	@Autowired
	private MemberMapper mapper;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Test
	public void testGetList() {
		   mapper.getList().forEach(member -> log.info(member));
	}

	 @Test
	 public void testInsert() {
		 MemberVO member = new MemberVO();
		 
		 member.setUsername("member@naver.com");
		 member.setName("홍길동");
		 member.setPassword(passwordEncoder.encode("1313"));
		 member.setAddr("서울시");
		 member.setZipCode(23);
		 member.setPhone("01098749856");
		 member.setCompNo(2);
		 
		 mapper.insert(member);
		 log.info(member);
		 
	 }
	 
	 @Test
	 public void testRead() {
		   MemberVO member = mapper.read(1L);
		   log.info(member);
	 }
	 
	 @Test
	 public void testDelete() {
		      log.info("DELETE COUNT:"+ mapper.delete(1L));
	 }
	 
	 @Test
	 public void testUpdate() {
		     MemberVO member = new MemberVO();
		     member.setMno(2L);
		     member.setUsername("cam@naver.com");
		     member.setName("사업자 수정");
		     member.setPassword("0000");
		     member.setAddr("수원");
		     member.setZipCode(12);
		     member.setPhone("010-0000-0000");
		     member.setCompNo(1);
		     
		     int count = mapper.update(member);
		     log.info("UPDATE COUNT:" + count);
	 }
}
