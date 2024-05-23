package com.camping.controller;

import static org.hamcrest.CoreMatchers.instanceOf;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
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
import com.camping.service.MemberService;
import com.camping.service.MyCampingService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/member/*")
@Log4j
public class AdminMemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private MyCampingService myCampingService;
	@Autowired
	private PasswordEncoder encoder;
	
	@GetMapping("/list")
	public void adminMemberList(Model model) {
		List<MemberVO> memberList = memberService.getList();
		model.addAttribute("memberList", memberList);
	}
	
	@GetMapping("/read")
	public void adminMemberRead(@RequestParam("mno") Long mno, Model model) {
		MemberVO member = memberService.get(mno);
		model.addAttribute("member", member);
		
		List<MyCampingVO> campingList = myCampingService.findBymember(member.getUsername());
		model.addAttribute("campingList", campingList);
	}
	
	@GetMapping("/register")
	public void adminMemberRegister() {
		
	}
	
	@PostMapping("/register")
	public String postAdminMemberRegister(@ModelAttribute MemberVO memberVO, RedirectAttributes rttr) {
		String encodedPassword = encoder.encode(memberVO.getPassword());
		memberVO.setPassword(encodedPassword);
		memberService.register(memberVO);
		log.info("member registered");
		return "redirect:/admin/member/list";
	}
	
	@PostMapping("/delete")
	public String postAdminMemberDelete(@RequestParam("mno") Long mno, RedirectAttributes rttr) {
		memberService.remove(mno);
		log.info("member deleted");
		return "redirect:/admin/member/list";
	}
}
