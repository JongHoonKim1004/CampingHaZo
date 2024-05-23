package com.camping.mapper;

import static org.junit.Assert.*;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.camping.domain.Criteria;
import com.camping.domain.ReplyVO;
import com.camping.mapper.ReplyMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {

	@Autowired
	private ReplyMapper mapper;
	
	private Long[] vnoArr = {24L,23L,22L,21L,11L};
	
	@Test
	public void testInsert() {
			  IntStream.rangeClosed(1, 10).forEach(i ->{
				    ReplyVO vo = new ReplyVO();
				    vo.setVno(vnoArr[i %5]);
				    vo.setTitle("tesdt");
				    vo.setContent("test");
				    vo.setWriter("zee0541@naver.com");
				    mapper.insert(vo);
			  });
		  
	}
	
	@Test
	public void testList() {
		   Criteria cri = new Criteria(1,5);
		   List<ReplyVO> replies = mapper.getListWithPaging(cri, vnoArr[0]);
		   
		   replies.forEach(reply ->log.info(reply));
	}
	
	@Test
	public void testRead() {
		   
		  ReplyVO vo = mapper.read(2L);
		  log.info(vo);
	}
	
	@Test
	public void testDelete() {
		  
		 int result = mapper.delete(2L);
		 log.info(result);
	}
	
	@Test
	public void testUpdate() {
		
		ReplyVO vo = new ReplyVO();
		
		vo.setRno(3L);
		vo.setTitle("댓글 수정");
		
		mapper.update(vo);
	}
	
	@Test
	public void testInsert2() {
		 IntStream.rangeClosed(1, 20).forEach(i -> {
			   ReplyVO vo = new ReplyVO();
			   vo.setVno(vnoArr[0]);
			   vo.setTitle("테이징test"+i);
			   vo.setContent("페이징");
			   vo.setWriter("zee0541@naver.com");
			   mapper.insert(vo);
		 });
	}
}
