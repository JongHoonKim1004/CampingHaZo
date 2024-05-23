package com.camping.service;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.camping.domain.Criteria;
import com.camping.domain.VocVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class VocServiceTests {

	@Autowired
	private VocService service;
	
	
	@Test
	public void testRegister() {
		 VocVO voc = new VocVO();
		 voc.setTitle("5/07 test");
		 voc.setContent("5/07 test");
		 voc.setWriter("zee0542@naver.com");
		 service.register(voc);
		 log.info("생성된 게시물:" + voc.getVno());
	}
	
	@Test
	public void testGetList() {
		  List<VocVO> list = service.getList();
		  list.forEach(voc -> log.info(voc));
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
