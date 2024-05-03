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
		 voc.setContent("새로 작성하는");
		 voc.setWriter("zee0542@naver.com");
		 log.info("생성된 문의 번호 :" + voc.getVno());
	}
	
	@Test
	public void testGetList() {
		   service.getList().forEach(voc ->log.info(voc));
	}
	
	@Test
	public void testGet() {
	         
	         log.info(service.get(5L));
	}
	
	@Test
	public void testDelete() {
		
		log.info("REMOVE RESULT : " + service.remove(6L));
	}

	@Test
	public void testUpdate() {
		// 번호가 있는지 확인
		VocVO voc = service.get(5L);

		if (voc == null) {
				return;
		}

		voc.setTitle("문의 수정합니다.");
		log.info("MODIFY RESULT: " + service.modify(voc));
	}

}
