package com.camping.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.camping.domain.AdminVO;
import com.camping.domain.ReservationVO;
import com.camping.domain.VocVO;
import com.camping.service.AdminService;
import com.camping.service.ReservationService;
import com.camping.service.VocService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class AdminController {
	@Autowired
	private AdminService adminService;
	@Autowired
	private ReservationService reservationService;
	@Autowired
	private VocService vocService;
	
	@Autowired
	private AdminService adminservice;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	
	
	@GetMapping("/admin/main")
	public void adminMain(Model model) {
		List<ReservationVO> reservationList = reservationService.getListForAdmin();
		List<VocVO> vocList = vocService.getListForAdmin();
		
		model.addAttribute("vocList", vocList);
		model.addAttribute("reservationList", reservationList);
	}
	
	@GetMapping("/admin/login")
	public void adminLogin() {
		
		
		
	}
	
	@PostMapping("/admin/login")
	public String PostAdminLogin(@RequestParam("username") String username, @RequestParam("password") String password) {
		boolean aucthenticated = adminservice.authenticate(username, password);
		if(aucthenticated) {
               adminService.setAuthenticationAdmin(username);
			  return "redirect:/admin/main";
		}else {
			   return "redirect:/admin/login";
		}
	}
	
	
	
	
	@GetMapping("/admin/logout")
	public void adminLogout() {
		
	}
	
	@GetMapping("/admin/admin/list")
	public void adminAdminList(Model model) {
		List<AdminVO> adminList = adminService.getList();
		adminList.forEach(admin -> log.info(admin));
		model.addAttribute("adminList", adminList);
	}
	
	@GetMapping("/admin/admin/read/{ano}")
	public String adminAdminRead(@PathVariable("ano") Long ano, Model model) {
		AdminVO admin = adminService.get(ano);
		model.addAttribute("admin", admin);
		
		return "/admin/admin/read";
	}
	
	@GetMapping("/admin/admin/register")
	public void adminAdminRegister() {
		
	}
	
	@PostMapping("/admin/admin/register")
	public String postAdminAdminRegister(@ModelAttribute AdminVO admin) {
		log.info("admin register start");
		String encodedpassword = encoder.encode(admin.getPassword());
		admin.setPassword(encodedpassword);
		adminService.register(admin);
		log.info("admin register success");
		return "redirect:/admin/main";
	}
	
}
