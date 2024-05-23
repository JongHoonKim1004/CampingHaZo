package com.camping.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camping.domain.Criteria;
import com.camping.domain.PageDTO;
import com.camping.domain.ReviewVO;
import com.camping.service.ReviewService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/review/*")
@Log4j
public class AdminReviewController {
	@Autowired
	private ReviewService reviewService;
	
	@GetMapping("/list")
	public void adminReviewList(Model model, Criteria cri) {
		List<ReviewVO> reviewList = reviewService.getListWithPaging(cri);
		int total = reviewService.getTotal(cri);
		
		reviewList.forEach(review -> log.info(review));
		
		
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@GetMapping("/read")
	public void adminReviewRead(@RequestParam("rno") Long rno, Model model, @ModelAttribute("cri") Criteria cri) {
		ReviewVO review = reviewService.get(rno);
		model.addAttribute("review", review);
	}
	
	@PostMapping("/remove")
	public String postAdminReviewRemove(@RequestParam("rno") Long rno, RedirectAttributes rttr, @ModelAttribute("cri") Criteria cri) {
		reviewService.remove(rno);
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/admin/review/list";
	}
}
