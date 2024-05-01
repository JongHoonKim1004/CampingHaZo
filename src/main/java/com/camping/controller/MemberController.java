package com.camping.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camping.domain.MemberVO;
import com.camping.domain.NoticeVO;
import com.camping.service.MemberService;
import com.camping.service.NoticeService;

import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@RequestMapping("/member/*")
@Log4j
@RequiredArgsConstructor
public class MemberController {

	@Autowired
	private MemberService memberservice;
		

 // 회원가입 컨트롤 	
	@PostMapping(value="/join")
	public String joinPOST(MemberVO member) throws Exception {
		
		log.info("join 진입");
		
		//회원가입 서비스 실행
		memberservice.memberJoin(member);
		
		log.info("join Service 성공");
		
		return "redirect:/main";
	}

}
