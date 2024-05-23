package com.camping.service;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.camping.domain.Criteria;
import com.camping.domain.ReviewVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReviewServiceTests {

	@Autowired
	private ReviewService service;
	
//	@Test
//	public void testExist() {
//		    log.info(service);
//		    assertNotNull(service);
//	}

	 
	@Test
	public void testRegister() {
		 ReviewVO review = new ReviewVO();
		 review.setCno(3);
		 review.setTitle("새로운 테스트");
		 review.setContent("새로운 테스트");
		 review.setWriter("zee0542@naver.com");
		 review.setReadCount(3);
		 service.register(review);
		 log.info("생선된 게시물" + review.getRno());
	}
	
	@Test
	public void testGetList() {
		  List<ReviewVO> list = service.getListWithPaging(new Criteria(1,5));
		  list.forEach(review -> log.info(review));
	}
	
	@Test
	public void testGet() {
		   log.info(service.get(7L));
	}
	
	@Test
	public void testDelete() {
		   log.info("REMOVE RESULT :" + service.remove(7L));
	}
	
	@Test
	public void testUpdate() {
		   ReviewVO review = service.get(8L);
		   
		   if(review == null) {
			       return;
		   }
		   review.setTitle("테스트 제목 수정");
		  log.info("MODIFY RESULT :" + service.modify(review));
	}

}
