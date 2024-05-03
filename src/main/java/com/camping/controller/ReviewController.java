package com.camping.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camping.domain.ReviewVO;
import com.camping.service.ReviewService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/review/*")
@RequiredArgsConstructor
public class ReviewController {
 
	  private final ReviewService reviewservice;
	  
	  @GetMapping("/list")
	  public void list(Model model) {
		    log.info("list......");
		    model.addAttribute("list", reviewservice.getList());
	  }
	  
	  @PostMapping("/register")
	  public String register(ReviewVO vo, RedirectAttributes rttr) {
		     log.info("register...." + vo);
		     
		     reviewservice.register(vo);
		     
		     rttr.addFlashAttribute("result", vo.getRno());
		     return "redirect/review/list";
	  }
	  
	  
	  @GetMapping({"/get", "modify"})
	  public void get(@RequestParam("rno") Long rno, Model model) {
		      model.addAttribute("review", reviewservice.get(rno));
	  }
	  
	  @PostMapping("/modify")
	  public String modify(ReviewVO review, RedirectAttributes rttr) {
		     log.info("modify:" + review);
		     if(reviewservice.modify(review)) {
		    	      rttr.addFlashAttribute("result", "success");
		     }
		     return "redirect:/review/list";
	  }
	  
	  @PostMapping("/remove")
	  public String remove(@RequestParam("rno") Long rno, RedirectAttributes rttr) {
		    log.info("remove..." +rno);
		    if(reviewservice.remove(rno)) {
		    	    rttr.addFlashAttribute("result", "success");
		    }
		    
		    return "redirect:/review/list";
	  }
	  
	  
	  
}
