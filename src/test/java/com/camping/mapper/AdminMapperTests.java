package com.camping.mapper;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.camping.domain.AdminVO;

import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/security-context.xml",
	"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class AdminMapperTests {

	@Autowired
	private AdminMapper mapper;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Test
	public void testGetList() {
		  mapper.getList().forEach(admin ->log.info(admin));
	}
	
	@Test
	public void testInsert() {
		 AdminVO admin = new AdminVO();
		 admin.setUsername("admin2@naver.com");
		 admin.setPassword(passwordEncoder.encode("1234"));
		 admin.setName("김동희");
		 admin.setEmployeeNo(5);
		 
		 mapper.insert(admin);
		 log.info(admin);
	}
	
	@Test
	public void testInsertSelectKey() {
		  AdminVO admin = new AdminVO();
		  admin.setUsername("admin1@naver.com");
		  admin.setPassword("1212");
		  admin.setName("테스트1");
		  admin.setEmployeeNo(5);
		  
		  mapper.insertSelectKey(admin);
		  log.info(admin);
	}
	
	@Test
	public void testRead() {
		AdminVO admin = mapper.read(1L);
		log.info(admin);
	}
	
	@Test
	public void testDelete() {
		 log.info("DELETE COUNT:" + mapper.delete(21L));
		 
	}
	
	@Test
	public void testUpdate() {
		  AdminVO admin = new AdminVO();
		  admin.setAno(22L);
		  admin.setUsername("admin1@naver.com");
		  admin.setPassword("1234");
		  admin.setName("테스트 수정");
		  admin.setEmployeeNo(6);
		  
		  int count = mapper.update(admin);
		  log.info("UPDATE COUNT :" + count);
	}
	

}
