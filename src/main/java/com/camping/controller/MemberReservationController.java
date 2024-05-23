package com.camping.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camping.domain.MyCampingVO;
import com.camping.domain.ReservationVO;
import com.camping.domain.UsersVO;
import com.camping.service.MyCampingService;
import com.camping.service.ReservationService;
import com.camping.service.UsersService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member/reservation/*")
@Log4j
public class MemberReservationController {
	@Autowired
	private ReservationService reservationService;
	@Autowired
	private MyCampingService myCampingService;
	@Autowired
	private UsersService usersService;
	
	@GetMapping("/list")
	public void memberReservationList(Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		
		List<MyCampingVO> campingList = myCampingService.findBymember(username);
		List<ReservationVO> reservationList = new ArrayList<ReservationVO>();
		for(MyCampingVO camp : campingList) {
			String name = camp.getName();
			List<ReservationVO> reservation = reservationService.findByName(name);
			for(ReservationVO res : reservation) {
				reservationList.add(res);
			}
		}
		
		model.addAttribute("reservationList", reservationList);
		
		
	}
	
	@GetMapping("/read")
	public void memberReservationRead(@RequestParam("rno") Long rno, Model model) {
		ReservationVO reservation = reservationService.get(rno);
		model.addAttribute("reservation", reservation);
		
		UsersVO users = usersService.findByUsername(reservation.getUsername());
		model.addAttribute("users", users);
	}
	
	@PostMapping("/delete")
	public String postMemberReservationDelete(@RequestParam("rno") Long rno, RedirectAttributes rttr) {
		reservationService.remove(rno);
		log.info("reservation remove success");
		
		return "redirect:/member/reservation/list";
	}
}
