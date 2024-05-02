package com.camping.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camping.domain.NoticeVO;
import com.camping.service.NoticeService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;


@Controller
@Log4j
//@AllArgsConstructor
@RequestMapping("/notice/*")
@RequiredArgsConstructor
public class NoticeController {
 
	 private final NoticeService noticeservice;
		
		@GetMapping("/list")
	    public void list(Model model) {
	     log.info("list...............");
	     noticeservice.getList().forEach(list -> log.info(list));
	     model.addAttribute("list", noticeservice.getList());
	     }
		
	// 등록 처리	
		
		@GetMapping("/register")
		public void resister() {
			 
		}
		
		
		@PostMapping("/register")
		public String register(NoticeVO vo, RedirectAttributes rttr) {
			  log.info("register....." + vo);
			  
			  noticeservice.register(vo);
			  
			  rttr.addFlashAttribute("result", vo.getNno());
			  return "redirect:/notice/list";
		}
		
		
		
		
	 // 조회처리	
		@GetMapping("/get")
		public void testget(@RequestParam("nno") Long nno, Model model) {
			  log.info("/get :" + nno);
			  NoticeVO vo = noticeservice.get(nno);
			  log.info(vo);
			  model.addAttribute("notice", noticeservice.get(nno));
		}
		
	// 수정 처리
		
	  @PostMapping("/modify/")
	  public String modify(NoticeVO notice, RedirectAttributes rttr) {
		      log.info("modify:" + notice);
		      if(noticeservice.modify(notice)) {
		    	      rttr.addFlashAttribute("result","success");
		      }
		      return "redirect:/  / ";
	  }
	  
	  @PostMapping("/remove")
	  public String remove(@RequestParam("nno")Long nno, RedirectAttributes rttr) {
		     log.info("remove...." + nno);
		     if(noticeservice.remove(nno)) {
		    	      rttr.addFlashAttribute("result","success");
		     }
		     
		     return "redirect:/ /";
	  }
	     

}
