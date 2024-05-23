package com.camping.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camping.domain.Criteria;
import com.camping.domain.NoticeVO;
import com.camping.domain.PageDTO;
import com.camping.service.AdminService;
import com.camping.service.NoticeService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/notice/*")
@Log4j
public class AdminNoticeController {
	@Autowired
	private AdminService adminService;
	@Autowired
	private NoticeService noticeService;
	
	@GetMapping("/list")
	public void adminNoticeList(Model model, Criteria cri) {
		List<NoticeVO> noticeList = noticeService.getListWithPaging(cri);
		int total = noticeService.getTotal(cri);
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@GetMapping("/read")
	public void adminNoticeRead(Model model, @RequestParam("nno") Long nno,@ModelAttribute Criteria cri) {
		noticeService.readCount(nno);
		
		NoticeVO notice = noticeService.get(nno);
		
		log.info(notice);
		
		model.addAttribute("notice", notice);
		model.addAttribute("cri", cri);
	}
	
	@GetMapping("/register")
	public void adminNoticeRegister() {
		
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/register")
	public String postAdminNoticeRegister(@ModelAttribute NoticeVO notice, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("notice register start");
		noticeService.register(notice);
		log.info("notice register end");
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/admin/notice/list";
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/remove")
	public String postAdminNoticeRemove(@RequestParam("nno") Long nno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("Notice Removing...");
		noticeService.remove(nno);
		log.info("Notice Removed Complete");
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/admin/notice/list";
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/modify")
	public void adminNoticeMofidy(@RequestParam("nno") Long nno, Model model) {
		NoticeVO notice = noticeService.get(nno);
		model.addAttribute("notice", notice);
		
	}
	
	/* @PreAuthorize("isAuthenticated()") */
	@PostMapping("/modify")
	public String postAdminNoticeModify(@ModelAttribute NoticeVO notice, RedirectAttributes rttr) {
		log.info("Notice Modify Start...");
		noticeService.modify(notice);
		log.info("Notice Modify Success");
		
		
		
		return "redirect:/admin/notice/list";
	}
}
