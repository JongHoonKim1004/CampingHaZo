package com.camping.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camping.domain.MyCampingVO;
import com.camping.service.MyCampingService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member/mycamping/*")
@Log4j
public class MemberMyCampingController {
	@Autowired
	private MyCampingService myCampingService;
	
	@GetMapping("/list")
	public void memberMyCampingList(Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		
		List<MyCampingVO> campingList =  myCampingService.findBymember(username);
		model.addAttribute("campingList", campingList);
	}
	
	@GetMapping("/read")
	public void memberMyCampingRead(@RequestParam("cno") Long cno, Model model) {
		MyCampingVO camping = myCampingService.get(cno);
		model.addAttribute("camping", camping);
	}
	
	@PostMapping("/delete")
	public String postMemberMyCampingDelete(@RequestParam("cno") Long cno, RedirectAttributes rttr) {
		myCampingService.remove(cno);
		log.info("Remove Complete");
		
		return "redirect:/member/mycamping/list";
	}
}
