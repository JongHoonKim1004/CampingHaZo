package com.camping.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camping.domain.MemberVO;
import com.camping.domain.MyCampingVO;
import com.camping.service.MemberService;
import com.camping.service.MyCampingService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member/newCamping/*")
@Log4j
public class MemberNewCampingController {
	@Autowired
	private MyCampingService myCampingService;
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/register")
	public void memberNewCampingRegister(Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		
		MemberVO member = memberService.findByUsername(username);
		model.addAttribute("member", member);
	}
	
	@PostMapping("/register")
	public String postMemberNewCampingRegister(@ModelAttribute MyCampingVO camping, RedirectAttributes rttr) {
		myCampingService.register(camping);
		log.info("register Completed");
		
		return "redirect:/member/mycamping/list";
	}
}
