package org.camping.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.camping.domain.VocVO;
import com.camping.mapper.VocMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class VocMapperTests {
   
	 @Autowired
	 private VocMapper mapper;
	 
	 @Test
	 public void testGetList() {
		   mapper.getList().forEach(voc -> log.info(voc));
	 }
	 
	 
	 @Test
	 public void testInsert() {
		    VocVO voc = new VocVO();
		    voc.setTitle("테스트 문의");
		    voc.setContent("세로운 문의");
		    voc.setWriter("zee0541@naver.com");
		    
		    mapper.insert(voc);
		    log.info(voc);
	 }
	 
	 @Test
	 public void testInsertSelectKey() {
		  VocVO voc = new VocVO();
		  voc.setTitle("테스트 문의 select");
		  voc.setContent("테스트 문의");
		  voc.setWriter("zee0541@naver.com");
		  
		  mapper.insertSelectKey(voc);
		  log.info(voc);
	 }
	 
	 @Test
	 public void testRead() {
		  VocVO voc = mapper.read(11L);
		  log.info(voc);
	 }
	 
	 @Test
	 public void testDelete() {
		    log.info("DELETE :" + mapper.delete(7L));
	 }
	 
	 @Test
		public void testUpdate() {
			VocVO voc = new VocVO();
	                      
			voc.setVno(8L);
			voc.setTitle("수정된 문의");
			voc.setContent("수정된 문의");
			voc.setWriter("zee0541@naver.com");
			
			int count = mapper.update(voc);
			log.info("UPDATE COUNT: " + count);
		}
	 
}
