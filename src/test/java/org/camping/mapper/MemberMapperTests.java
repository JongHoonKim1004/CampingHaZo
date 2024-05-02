package org.camping.mapper;

import static org.junit.Assert.*;



import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.camping.domain.MemberVO;
import com.camping.mapper.MemberMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberMapperTests {

	@Autowired
	private MemberMapper membermapper;
	
	
	
	@Test
	public void memberMapperJoin() throws Exception{
		MemberVO member = new MemberVO();
		log.info("test start");
		
		member.setUsername("test");
		log.info("test start");
		member.setName("test");
		log.info("test start");
		member.setPassword("test");
		log.info("test start");
		member.setPhone("test");
		log.info("test start");
		member.setAddr("test");
		log.info("test start");
		member.setAddrDetail("test");
		log.info("test start");
		member.setZipCode(1);
		log.info("test start");
		
		membermapper.memberJoin(member);
		
		log.info("test end");
		
		 
		
	}

}
