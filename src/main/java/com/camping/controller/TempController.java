package com.camping.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class TempController {
	
	
	@GetMapping("/voc")
	public String voc() {
		
		return "/voc/voc";
	}
	
	@GetMapping("/camping/list")
	public String campingList() {
		
		return "/camping/list";
	}

	@GetMapping("/review/register")
	public void registerrevice() {
		
	}
	
	@GetMapping("/reservation")
	public String reservation(@RequestParam("name") String name, Model model) {
		
		model.addAttribute("name", name);
		return "/camping/reservation";
	}
	
	@GetMapping("/reservation-result")
	public String reservationResult() {
		
		return "/camping/reservation-result";
	}
	
	@GetMapping("/admin/main")
	public void adminMain() {
		
	}
}
