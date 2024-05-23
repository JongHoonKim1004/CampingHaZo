package com.camping.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

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

import com.camping.domain.ReservationVO;
import com.camping.service.ReservationService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CampingController {
	@Autowired
	private ReservationService reservationService;
	
	@GetMapping("/camping/list")
	public void campingList() {
		
	}
	
	@GetMapping("/reservation")
	public String campingReservation(@RequestParam("name") String name, Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		
		model.addAttribute("username", username);
		model.addAttribute("name", name);
		log.info("name : " + name);
		
		return "/camping/reservation";
	}
	
	@PostMapping("/reservation")
    public String postCampingReservation(@ModelAttribute ReservationVO reservationVO, 
                                         @RequestParam("startdate") String startdate, 
                                         @RequestParam("enddate") String enddate, 
                                         RedirectAttributes rttr) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
        LocalDate startDate = LocalDate.parse(startdate, formatter);
        LocalDate endDate = LocalDate.parse(enddate, formatter);

        int days = endDate.compareTo(startDate);
        
        for (int i = 0; i <= days; i++) {
            log.info("reservation Starting");
            LocalDate resDate = startDate.plusDays(i);
            log.info("resDate: " + resDate);
            reservationVO.setResDate(java.sql.Date.valueOf(resDate));  // Assuming resDate is of type java.sql.Date
            log.info(reservationVO.toString());
            reservationService.register(reservationVO);
            log.info("reservation Finished");
        }

        return "redirect:/reservation-result";
    }
	
	@GetMapping("/reservation-result")
	public String reservationResult() {
		log.info("reservation-result");
		return "/camping/reservation-result"; 
	}
}
