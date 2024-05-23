package com.camping.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.camping.domain.UsersPoingLogVO;
import com.camping.domain.UsersPointVO;
import com.camping.domain.UsersVO;
import com.camping.service.UsersPoingLogService;
import com.camping.service.UsersPointService;
import com.camping.service.UsersService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/users/*")
@Log4j
public class UsersController {
	@Autowired
	private UsersService usersService;
	@Autowired
	private UsersPointService usersPointService;
	@Autowired
	private UsersPoingLogService usersPointLogService;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@Transactional
	@PostMapping("/join")
	public String postUsersJoin(@ModelAttribute UsersVO user) {
		// 유저 정보 등록
		log.info("Users Register Start...");
		String encodedpassword = encoder.encode(user.getPassword());
		user.setPassword(encodedpassword);
		usersService.register(user);
		
		log.info("Users Register Success");
		
		
		// 유저 포인트 테이블 생성
		log.info("Users Point table Register Start...");
		UsersPointVO pointVO = new UsersPointVO();
		pointVO.setUsername(user.getUsername());
		pointVO.setPoint(100);
		usersPointService.register(pointVO);
		log.info("Users Point table Register Success");
		
		// 유저 포인트 적립 기록 생성
		log.info("Users Point Log Register Start...");
		UsersPoingLogVO logVO = new UsersPoingLogVO();
		logVO.setUsername(user.getUsername());
		logVO.setPointChange(100);
		logVO.setChangeReason("신규 가입");
		usersPointLogService.register(logVO);
		log.info("Users Point Log Register Success...");
		
		log.info("All Job Complete");
		
		return "redirect:/";
	}
	
	@GetMapping("/index")
	public String kakaoLogout(HttpSession session) {
		 session.invalidate();
		 log.info("kakao logout");
		 return "redirect:/";
	} 
	
}
