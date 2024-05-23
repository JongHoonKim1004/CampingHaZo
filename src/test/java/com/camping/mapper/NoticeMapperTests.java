package com.camping.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.camping.domain.Criteria;
import com.camping.domain.NoticeVO;
import com.camping.mapper.NoticeMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class NoticeMapperTests {
  
	  @Autowired
	  private NoticeMapper mapper;
	  
	  @Test
	  public void testGetList() {
		     mapper.getList().forEach(notice->log.info(notice));
	  }
	  
		
		  @Test
		  public void testInsert() { 
		  NoticeVO notice = new NoticeVO();
		  notice.setTitle("test"); 
		  notice.setContent("test");
		  notice.setWriter("zee0541@naver.com");		  
		  mapper.insert(notice); 
		  log.info(notice);
		  
		  
	  }
		  
		  
		  @Test
			public void testInsertSelectKey() {
			    NoticeVO notice = new NoticeVO();
			    notice.setTitle("새로 작성하는 글 select key");
			    notice.setContent("새로 작성하는 내용 select key");
			    notice.setWriter("zee0541@naver.com");

			    mapper.insertSelectKey(notice);
			    log.info(notice);
			  
			}
		  
		  @Test
			public void testRead() {
				NoticeVO notice = mapper.read(23L);
				log.info(notice);
			}
		  
		  
		  @Test
			public void testDelete() {
		                    
				log.info("DELETE COUNT :" + mapper.delete(26L));
			}
		  
		  @Test
			public void testUpdate() {
				NoticeVO notice = new NoticeVO();
		                      

				notice.setTitle("수정된 제목");
				notice.setContent("수정된 내용");
				notice.setWriter("zee0541@naver.com");
				
				int count = mapper.update(notice);
				log.info("UPDATE COUNT: " + count);
			}
 		  
		  @Test
		  public void testPageing() {
			   Criteria cri = new Criteria(1,10);
			   List<NoticeVO> list = mapper.getListWithPaging(cri);
			   list.forEach(notice -> log.info(notice));
		  }
		  
		  
		  
		  
		 
}
