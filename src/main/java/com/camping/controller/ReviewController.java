package com.camping.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camping.domain.ReviewVO;
import com.camping.service.ReviewService;
import com.camping.service.UsersService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/review/*")
@Log4j
public class ReviewController {
	@Autowired
	private UsersService usersService;
	@Autowired
	private ReviewService reviewService;
	
	@GetMapping("/list")
	public void reviewList(Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		
		model.addAttribute("username", username);
		
		List<ReviewVO> reviewList = reviewService.getList();
		reviewList.forEach(review -> log.info(review));
		
		model.addAttribute("reviewList", reviewList);
	}
	
	@GetMapping("/register")
	public void reviewRegister(Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		
		model.addAttribute("username", username);
		
		List<ReviewVO> reviewList = reviewService.getList();
		reviewList.forEach(review -> log.info(review));
		
		model.addAttribute("reviewList", reviewList);
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/register")
	public String postReviewRegister(@ModelAttribute ReviewVO review) {
		
		
		log.info("Review Register Start...");
		reviewService.register(review);
		log.info("Review Register Success..");
		
		return "redirect:/review/list";
	}
	
	
	 @GetMapping("/modify") public void reviewModify(@RequestParam("rno") Long
	  rno, Model model) { ReviewVO review = reviewService.get(rno);
	  log.info("Review Read Complete : " + review); model.addAttribute("review",
	  review); List<ReviewVO> reviewList = reviewService.getList();
	  model.addAttribute("reviewList", reviewList);
	  
	  }

	
	
	@PostMapping("/modify")
	public String postReviewModify( @ModelAttribute ReviewVO review) {
		log.info("Review Modify Start...");
		reviewService.modify(review);
		log.info("Review Modify End");
		
		return "redirect:/review/list";
	}
	
	
	@PostMapping("/remove")
	public String postReviewRemove(@RequestParam("rno") Long rno) {
		log.info("Review Remove Start...");
		reviewService.remove(rno);
		log.info("Review Remove End");
		
		return "redirect:/review/list";
	}
}
