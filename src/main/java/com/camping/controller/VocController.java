package com.camping.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camping.domain.VocVO;
import com.camping.service.VocService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class VocController {
	@Autowired
	private VocService vocService;
	
	
	@GetMapping("/voc")
	public String voc() {
		
		return "/voc/voc";
	}
    
	 @PreAuthorize("isAuthenticated()") 
	@PostMapping("/voc/register")
	public String postVocRegister(@ModelAttribute VocVO voc, RedirectAttributes rttr) {
		log.info("VOC Register Start...");
		vocService.register(voc);
		log.info("VOC Register Success");
		
		rttr.addFlashAttribute("message", "문의가 정상적으로 등록되었습니다");
		return "redirect:/voc/result";
	}
	
	@GetMapping("/voc/result")
	public String vocResult() {
		return "/voc/voc_result";
	}
}
