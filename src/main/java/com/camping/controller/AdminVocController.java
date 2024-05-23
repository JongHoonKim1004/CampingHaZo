package com.camping.controller;

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

import com.camping.domain.AdminVO;
import com.camping.domain.Criteria;
import com.camping.domain.ReplyVO;
import com.camping.domain.VocVO;
import com.camping.service.AdminService;
import com.camping.service.ReplyService;
import com.camping.service.VocService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/voc/*")
@Log4j
public class AdminVocController {
	@Autowired
	private VocService vocService;
	@Autowired
	private ReplyService replyService;
	
	@Autowired
	private AdminService adminservice;
	
	@GetMapping("/list")
	public void adminVocList(Model model) {
		List<VocVO> vocList = vocService.getList();
		model.addAttribute("vocList", vocList);
	}
	
	@GetMapping("/read")
	public void adminVocRead(Model model, @RequestParam("vno") Long vno, Criteria cri) {
		
		 Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		 String username = authentication.getName();
		 
		 AdminVO admin = adminservice.findByUsername(username);
		
		VocVO voc = vocService.get(vno);
		List<ReplyVO> replyList = replyService.getList(vno);
		
		replyList.forEach(reply -> log.info(reply));
		
		model.addAttribute("voc", voc);
		model.addAttribute("replyList", replyList);
		model.addAttribute("admin", admin);
	}
	
	@PostMapping("/reply")
	public String postAdminVocReply(@ModelAttribute ReplyVO replyVO, RedirectAttributes rttr) {
		replyService.register(replyVO);
		log.info("Reply Register Success");
		
		return "redirect:/admin/voc/list";
	}
}
