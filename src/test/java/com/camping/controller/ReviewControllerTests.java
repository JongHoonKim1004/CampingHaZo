package com.camping.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.patch;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
@WebAppConfiguration 
public class ReviewControllerTests {
  
	@Autowired
    private WebApplicationContext ctx; 
    
    private MockMvc mockMvc; 

   
    @Before
    public void setup() {  
          
   	 this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
    }
    
    @Test
    public void testList() throws Exception {
   	  
   	 log.info(    			      
   	 mockMvc.perform(MockMvcRequestBuilders.get("/review/list"))
   			 .andReturn() // 요청 결과를 반환
   			 .getModelAndView() // 모델과 뷰를 반환
   			 .getModelMap()); // 모델맵을 반환하여 로그 출력
    }
    
    
    @Test
    public void testResister() throws Exception{
  
   	 String resultPage = 
   			 
   			 mockMvc.perform(MockMvcRequestBuilders.post("/review/register")
                                  
   			 .param("cno", "2")
   			  .param("title", "title.....")
   			  .param("content", "content.....")
   			  .param("writer", "zee0542@naver.com")
   			  .param("readCount", "2"))
                                    
   			  .andReturn()
                                     
   			  .getModelAndView()
   			  .getViewName();
   			  
   			
   	 log.info(resultPage);
    }
    
    @Test
    public void testGet() throws Exception {
    	    log.info(mockMvc.perform(MockMvcRequestBuilders
    	    		     .get("/review/get")
    	    		     .param("rno", "8"))
    	    		     .andReturn()
    	    		     .getModelAndView().getModelMap()); 
    }
    
    @Test
    public void testModify() throws Exception{
    	  
    	String resultPage = 
     mockMvc.perform(MockMvcRequestBuilders.post("/review/modify")
    		          .param("rno", "8")
    		          .param("title", "수정된 테스트1")
    		          .param("content", "수정된 테스트1")
    		          .param("writer", "zee0541@naver.com")
    		          .param("readCount", "5")) 
                      .andReturn().getModelAndView().getViewName();
    	
    	log.info(resultPage);
    }
    
    @Test
    public void testRemove() throws Exception {
    	  String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/review/remove")
    			         .param("rno", "10"))
    			  .andReturn().getModelAndView().getViewName();
    	  
    	  log.info(resultPage);
    }
    
    
}
