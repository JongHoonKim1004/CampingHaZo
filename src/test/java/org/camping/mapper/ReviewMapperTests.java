package org.camping.mapper;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.camping.domain.ReviewVO;
import com.camping.mapper.ReviewMapper;

import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReviewMapperTests {

	@Autowired
	private ReviewMapper mapper;
	
	@Test
	public void testGetList() {
		   mapper.getList().forEach(review -> log.info(review));
	}
	
	@Test
	public void testInsert() {
		ReviewVO review = new ReviewVO();
		review.setCno(1);
		review.setTitle("test");
		review.setContent("test");
		review.setWriter("zee0542@naver.com");
		review.setReadCount(2);
		
		mapper.insert(review);
		log.info(review);
	}
	
	@Test
	public void testInsertSelectKey() {
		 ReviewVO review = new ReviewVO();
		 review.setCno(2);
		 review.setTitle("테스트");
		 review.setContent("테스트");
		 review.setWriter("테스트");
		 review.setReadCount(2);
		 
		 mapper.insertSelectKey(review);
		 log.info(review);
	}
	
	@Test
	public void testRead() {
		   ReviewVO review = mapper.read(3L);
		   log.info(review);
	}
	
	@Test
	public void testDelete() {
		 log.info("DELETE COUNT:" + mapper.delete(3L));
	}
	
	@Test
	public void testUpdate() {
		 ReviewVO review = new ReviewVO();
		 review.setRno(7L);
		 review.setTitle("테스트 수정");
		 review.setContent("테스트 수정");
		 review.setWriter("zee0542@naver.com");
		 review.setReadCount(3);
		 
		 int count = mapper.update(review);
		 log.info("UPDATE COUNT :" + count);
		 
	}

}
