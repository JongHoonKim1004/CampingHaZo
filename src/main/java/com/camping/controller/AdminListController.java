package com.camping.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.camping.domain.MyCampingVO;
import com.camping.domain.ReservationVO;
import com.camping.service.MyCampingService;
import com.camping.service.ReservationService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/*")
@Log4j
public class AdminListController {
	@Autowired
	private ReservationService reservationService;
	@Autowired
	private MyCampingService myCampingService;
	
	@GetMapping("/camping/list")
	public void adminCampingList(Model model) {
		List<MyCampingVO> campingList = myCampingService.getList();
		model.addAttribute("campingList", campingList);
	}
	
	@GetMapping("/camping/read")
	public void adminCampingRead(@RequestParam("cno") Long cno, Model model) {
		MyCampingVO camping = myCampingService.get(cno);
		model.addAttribute("camping", camping);
	}
	
	@GetMapping("/reservation/list")
	public void adminReservationList(Model model) {
		List<ReservationVO> reservationList = reservationService.getList();
		model.addAttribute("reservationList", reservationList);
		
	}
	
	@GetMapping("/reservation/read")
	public void adminReservationRead(@RequestParam("rno") Long rno, Model model) {
		ReservationVO reservation = reservationService.get(rno);
		model.addAttribute("reservation", reservation);
	}
	
}
