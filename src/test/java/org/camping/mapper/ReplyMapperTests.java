package org.camping.mapper;

import static org.junit.Assert.*;

import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.camping.domain.ReplyVO;
import com.camping.mapper.ReplyMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {

	@Autowired
	private ReplyMapper mapper;
	
	private Long[] vnoArr = {7L};
	
	@Test
	public void testInsert() {
			  ReplyVO vo = new ReplyVO();
			  vo.setVno(7L);
			  vo.setTitle("댓글 테스트");
			  vo.setContent("댓글");
			  vo.setWriter("zee0541@naver.com");
			  mapper.insert(vo);
		  
	}
	
	@Test
	public void testRead() {
		   
		  ReplyVO vo = mapper.read(2L);
		  log.info(vo);
	}
	
	@Test
	public void testDelete() {
		  
		 int result = mapper.delete(5L);
		 log.info(result);
	}
	
	@Test
	public void testUpdate() {
		
		ReplyVO vo = new ReplyVO();
		
		vo.setRno(3L);
		vo.setTitle("댓글 수정");
		
		mapper.update(vo);
	}
}
