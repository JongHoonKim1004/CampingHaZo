package com.camping.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.camping.domain.Criteria;
import com.camping.domain.NoticeVO;
import com.camping.domain.PageDTO;
import com.camping.service.NoticeService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/notice/*")
@Log4j
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	
	@GetMapping("/list")
	public void noticeList(Model model, Criteria cri, Long nno) {
		List<NoticeVO> noticeList = noticeService.getList();
		noticeList.forEach(notice -> log.info(notice));
		
		model.addAttribute("noticeList", noticeList);
		
		int total = noticeService.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		
	}
}
