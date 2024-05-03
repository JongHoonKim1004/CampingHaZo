package com.camping.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camping.domain.Criteria;
import com.camping.domain.NoticeVO;
import com.camping.domain.PageDTO;
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
	    public void list(Criteria cri,Model model) {
	     log.info("list...............");
	     List<NoticeVO> list = noticeservice.getList(cri);
	     
	     list.forEach(notice -> log.info(notice));
			model.addAttribute("list", list);
			
		  int total = noticeservice.getTotal(cri);
		  model.addAttribute("pageMaker", new PageDTO(cri, total));
		
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
		@GetMapping({"/get","/modify"})
		public void get(@RequestParam("nno") Long nno, @ModelAttribute("cri") Criteria cri, Model model) {
			
			model.addAttribute("notice", noticeservice.get(nno));
		}
		
	// 수정 처리
		
	  @PostMapping("/modify/")
	  public String modify(NoticeVO notice,@ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		      log.info("modify:" + notice);
		      if(noticeservice.modify(notice)) {
		    	      rttr.addFlashAttribute("result","success");
		      }
		      
		      rttr.addAttribute("pageNum", cri.getPageNum());
		      rttr.addAttribute("amount",  cri.getAmount());
		      return "redirect:/  / ";
	  }
	  
	  @PostMapping("/remove")
	  public String remove(@RequestParam("nno")Long nno,@ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		     log.info("remove...." + nno);
		     if(noticeservice.remove(nno)) {
		    	      rttr.addFlashAttribute("result","success");
		     }
		     
		     rttr.addAttribute("pageNum", cri.getPageNum());
		     rttr.addAttribute("amount", cri.getAmount());
		     
		     return "redirect:/ /";
	  }
	     

}
