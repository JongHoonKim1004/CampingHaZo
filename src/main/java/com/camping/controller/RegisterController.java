package com.camping.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.camping.domain.AdminVO;
import com.camping.domain.MemberVO;
import com.camping.domain.UsersVO;
import com.camping.service.AdminService;
import com.camping.service.MemberService;
import com.camping.service.UsersService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/register/*")
@Log4j
public class RegisterController {
	@Autowired
	private AdminService adminService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private UsersService usersService;
	
	@GetMapping("/usernameCheck")
	public void registerUserNameCheck(@RequestParam("username") String username, Model model) {
		log.info("finding username");
		AdminVO admin = adminService.findByUsername(username);
		MemberVO member = memberService.findByUsername(username);
		UsersVO user = usersService.findByUsername(username);
		
		if(admin == null && member == null && user == null) {
			model.addAttribute("canUse", true);
			model.addAttribute("message", "사용 가능한 아이디입니다.");
		} else {
			model.addAttribute("canUse", false);
			model.addAttribute("message", "사용이 불가한 아이디입니다.");
		}
		
		model.addAttribute("username", username);
	}
	
}
