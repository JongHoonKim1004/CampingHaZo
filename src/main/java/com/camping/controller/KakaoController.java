package com.camping.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camping.domain.KakaoVO;
import com.camping.domain.UsersVO;
import com.camping.service.KakaoService;
import com.camping.service.UsersService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class KakaoController {
 
	@Autowired
	private KakaoService kakaoservice;
	
	@Autowired
	private UsersService usersService;
	
	@GetMapping("/login/oauth2/code/kakao")
	public String login(@RequestParam("code") String code,HttpSession session,HttpServletRequest request ,RedirectAttributes rttr,Model model) throws IOException{
		 log.info("code:" + code);
		 String url="";
		   
		 //코튼 발급
		 
		 String access_token = kakaoservice.getToken(code); 
		 
		 log.info("access_token:" + access_token);
		 
		 KakaoVO userInfo = kakaoservice.userInfo(access_token);
		 model.addAttribute("code", code);
		 model.addAttribute("access_token", access_token);
		 model.addAttribute("userInfo", userInfo);
		 
		 UsersVO users = usersService.findByUsername(userInfo.getKakaoEmail());
		 
		 String email = userInfo.getKakaoEmail();
		 String nickname = userInfo.getNickname();
		 
		 if(users != null) {
			    session = request.getSession();
				log.info("session:" + session);
				if(userInfo.getNickname() != null) {
					session.setAttribute("nickname", userInfo.getNickname());
					session.setAttribute("access_token", access_token);
					session.setAttribute("KakaoId", userInfo.getKakaoId());
					session.setAttribute("email", userInfo.getKakaoEmail());
		 }
					log.info("nickname:"+ userInfo.getNickname());
					log.info("access_Token:"+ access_token);
					log.info("KakaoId:"+ userInfo.getKakaoId());
					log.info("KakaoEmail:"+ userInfo.getKakaoEmail());
					
					
					
					kakaoservice.setAuthentication(email);
					
					url = "redirect:/../../../";
		 }else {
		    
			   rttr.addAttribute("userEmail", email);
			   rttr.addAttribute("nickname", nickname);
			   
			   url = "redirect:/../";
			    
		 }
		 
		 return url;
      }
			    
   }

