package com.camping.service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.camping.domain.NoticeVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class NoticeServiceTests {

	@Autowired
	private NoticeService service;
	
//	@Test
//    public void testExist() {
//          log.info(service);	
//          assertNotNull(service);
//    }	
	
	@Test
	public void testRegister() {
	     NoticeVO notice = new NoticeVO();
	     notice.setTitle("새로 시작하는 글");
	     notice.setContent("새로 작성하는 내용");
	     notice.setWriter("zee0541@naver.com");
	     service.register(notice);		
	     log.info("생성된 게시물의 번호: " +  notice.getNno());
	}
	
	@Test
	public void testGetList() {
	   service.getList().forEach(notice ->log.info(notice));
	}
	
	@Test
	public void testGet() {
	         
	         log.info(service.get(30L));
	}
	
	@Test
	public void testDelete() {
		
		log.info("REMOVE RESULT : " + service.remove(30L));
	}

	@Test
	public void testUpdate() {
		// 번호가 있는지 확인
		NoticeVO notice = service.get(31L);

		if (notice == null) {
				return;
		}

		notice.setTitle("제목 수정합니다.");
		log.info("MODIFY RESULT: " + service.modify(notice));
	}
	

}
