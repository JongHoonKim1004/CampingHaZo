package com.camping.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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

import com.camping.domain.MemberVO;
import com.camping.domain.MyCampingVO;
import com.camping.domain.ReservationVO;
import com.camping.service.MemberService;
import com.camping.service.MyCampingService;
import com.camping.service.ReservationService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member/*")
@Log4j
public class MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private ReservationService reservationService;
	@Autowired
	private MyCampingService myCampingService;
	
	
	@GetMapping("/login")
	public void memberLogin() {
		
	}
	
	@PostMapping("/login")
	public String postMemberLogin(@RequestParam("username") String username, @RequestParam("password") String password) {
		log.info("username: " + username + " ,password: " + password);
		boolean authenticated = memberService.authenticate(username, password);
		log.info("auth : " + authenticated);
		if(authenticated) {
			 memberService.setAuthenticationMember(username);
			 log.info("member login succcess for username:" + username);
			 
			 return "redirect:/member/main";
		}
		
		return "redirect:/member/login";
	}
	
	@GetMapping("/main")
	public void memberMain(Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		
		MemberVO member = memberService.findByUsername(username);
		model.addAttribute("member", member);
		
		List<MyCampingVO> campingList = myCampingService.findBymember(username);
		List<ReservationVO> reservationList = new ArrayList<ReservationVO>();
		for(MyCampingVO camp : campingList) {
			String name = camp.getName();
			List<ReservationVO> reservation = reservationService.findByName(name);
			for(ReservationVO res : reservation) {
				reservationList.add(res);
			}
		}
		
		model.addAttribute("reservationList", reservationList);
		model.addAttribute("campingList", campingList);
		
	}
	
	@GetMapping("/infoModify")
	public void memberInfoModify(Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		
		MemberVO member = memberService.findByUsername(username);
		model.addAttribute("member", member);
	}
	
	@PostMapping("/infoModify")
	public String postMemberInfomodify(@ModelAttribute MemberVO memberVO, RedirectAttributes rttr) {
		memberService.modify(memberVO);
		
		
		return "redirect:/member/main";
	}
	
	@GetMapping("/logout")
	public void memberlogout() {
		
	}
	
	@PostMapping("/logout")
	public String postMemberLogout() {
		
		
		return "redirect:/";
	}
}
