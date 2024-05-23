package com.camping.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camping.domain.UsersPoingLogVO;
import com.camping.domain.UsersPointVO;
import com.camping.domain.UsersVO;
import com.camping.service.UsersPoingLogService;
import com.camping.service.UsersPointService;
import com.camping.service.UsersService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/users/*")
@Log4j
public class AdminUserController {
	@Autowired
	private UsersService usersService;
	@Autowired
	private UsersPointService usersPointService;
	@Autowired
	private UsersPoingLogService usersPointLogService;
	
	@GetMapping("/list")
	public void adminUsersList(Model model) {
		List<UsersVO> usersList = usersService.getList();
		model.addAttribute("usersList", usersList);
	}
	
	@GetMapping("/read")
	public void adminUsersRead(@RequestParam("uno") Long uno, Model model) {
		UsersVO user = usersService.get(uno);
		String username = user.getUsername();
		model.addAttribute("user", user);
		
		UsersPointVO userpoint = usersPointService.findByUsername(username);
		model.addAttribute("userpoint", userpoint);
		
		List<UsersPoingLogVO> userpointlog = usersPointLogService.findByUsername(username);
		model.addAttribute("userspointlog", userpointlog);
	}
	
	@GetMapping("/register")
	public void adminUsersRegister() {
		
	}
	
	@Transactional
	@PostMapping("/register")
	public String postAdminUsersRegister(@ModelAttribute UsersVO user, RedirectAttributes rttr) {
		// 유저 정보 등록
				log.info("Users Register Start...");
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
			
				return "redirect:/admin/users/list";
	}
	
	
	@Transactional
	@PostMapping("/delete")
	public String postAdminUsersDelete(@RequestParam("uno") Long uno, RedirectAttributes rttr) {
		log.info("Users Delete Start");
		UsersVO user = usersService.get(uno);
		// 유저 포인트 로그 삭제
		List<UsersPoingLogVO> logList = usersPointLogService.findByUsername(user.getUsername());
		for(UsersPoingLogVO log : logList) {
			usersPointLogService.remove(log.getLno());
		}
		log.info("Point Log All deleted");
		// 유저 포인트 테이블 삭제
		UsersPointVO pointTable = usersPointService.findByUsername(user.getUsername());
		usersPointService.remove(pointTable.getPno());
		
		log.info("Point deleted");
		// 유저 개인정보 삭제
		usersService.remove(uno);
		
		log.info("All deleted");
		
		return "redirect:/admin/users/list";
	}
	
}
