package com.camping.service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.camping.domain.VocVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class VocServiceTests {

	@Autowired
	private VocService service;
	
//	@Test
//	public void testExist() {
//		   log.info(service);
//		   assertNotNull(service);
//	}
	
	@Test
	public void testRegister() {
		 VocVO voc = new VocVO();
		 voc.setTitle("새로운 나문의");
		 voc.setContent("새로 작성하는 나문의 내영");
		 voc.setWriter("zee0541@naver.com");
		 log.info("생성된 문의 번호 :" + voc.getVno());
	}

}
