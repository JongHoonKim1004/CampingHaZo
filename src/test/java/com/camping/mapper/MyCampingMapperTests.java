package com.camping.mapper;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.camping.domain.MyCampingVO;
import com.camping.mapper.MyCampingMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MyCampingMapperTests {

	@Autowired
	private MyCampingMapper mapper;
	
	@Test
	public void testGetList() {
		    mapper.getList().forEach(myCamping -> log.info(myCamping));
	}
	
	@Test
	public void testInset() {
		  MyCampingVO myCamping = new MyCampingVO();
		  
		  myCamping.setName("테스트");
		  myCamping.setAddr("테스트");
		  myCamping.setPhone("010-000-000");
		  myCamping.setMember("cam@naver.com");
		  
		  mapper.insert(myCamping);
		  log.info(myCamping);
	}
	
	@Test
	public void testInsertSelectKey() {
		 MyCampingVO myCamping = new MyCampingVO();
		 myCamping.setName("등록 테스트 05/07");
		 myCamping.setAddr("주소 등록 테스트");
		 myCamping.setPhone("010-3333-3333");
		 myCamping.setMember("cam@naver.com");
		 
		 mapper.insertSelectKey(myCamping);
		 log.info(myCamping);
		 	 
		 
	}
	
	@Test
	public void testRead() {
		     MyCampingVO myCamping = mapper.read(6L);
		    		 log.info(myCamping);
	}
	
	@Test
	public void testDelete() {
		   log.info("DELETE:" + mapper.delete(5L));
	}
	
	@Test
	public void testUpdate(){
		 MyCampingVO myCamping = new MyCampingVO();
		 
		 myCamping.setCno(3L);
		 myCamping.setName("등록 수정");
		 myCamping.setAddr("주소 등록 수정");
		 myCamping.setPhone("010-000-000");
		 myCamping.setMember("cam@naver.com");
		 
		 int count = mapper.update(myCamping);
		 log.info("UPDATE COUNT" + count);
	}

}
