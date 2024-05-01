package com.camping.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class TempController {
	@GetMapping("/review/list")
	public String reviewList() {
		
		return "/review/list";
	}
	
	@GetMapping("/voc")
	public String voc() {
		
		return "/voc/voc";
	}
	
	@GetMapping("/camping/list")
	public String campingList() {
		
		return "/camping/list";
	}
	
}
