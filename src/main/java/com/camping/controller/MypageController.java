package com.camping.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
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
import com.camping.domain.ReviewVO;
import com.camping.domain.UsersCampingVO;
import com.camping.domain.UsersPoingLogVO;
import com.camping.domain.UsersPointVO;
import com.camping.domain.UsersVO;
import com.camping.service.ReplyService;
import com.camping.service.ReservationService;
import com.camping.service.ReviewService;
import com.camping.service.UsersCampingService;
import com.camping.service.UsersPoingLogService;
import com.camping.service.UsersPointService;
import com.camping.service.UsersService;
import com.camping.service.VocService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/mypage/*")
@Log4j
public class MypageController {
	@Autowired
	private UsersService usersService;
	@Autowired
	private UsersPointService usersPointService;
	@Autowired
	private UsersPoingLogService usersPointLogService;
	@Autowired
	private ReservationService reservationService;
	@Autowired
	private VocService vocService;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private ReplyService replyService;
	@Autowired
	private UsersCampingService usersCampingService;
	
	
	
	@GetMapping("/main")
	public void mypageMain(Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String USERNAME = authentication.getName();
		
		UsersVO user = usersService.findByUsername(USERNAME);
		log.info(user.toString());
		model.addAttribute("user", user);
		
		List<ReservationVO> reservationList = reservationService.findByUsername(USERNAME);
		model.addAttribute("reservationList", reservationList);
		
		List<ReviewVO> reviewList = reviewService.getListByWriter(USERNAME);
		model.addAttribute("reviewList", reviewList);
		
		List<UsersCampingVO> usersCampingList = usersCampingService.findByUsername(USERNAME);
		model.addAttribute("usersCampingList", usersCampingList);
		
		UsersPointVO point = usersPointService.findByUsername(USERNAME);
		model.addAttribute("point", point);
	}
	
	
	/*									정보수정														*/
	@GetMapping("/infoModify")
	public void mypageInfoModify(Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String USERNAME = authentication.getName();
		UsersVO user = usersService.findByUsername(USERNAME);
		model.addAttribute("user", user);
		
		UsersPointVO point = usersPointService.findByUsername(USERNAME);
		model.addAttribute("point", point);
	}
	
	@PostMapping("/infoModify")
	public String postMypageInfoModify(@ModelAttribute UsersVO usersVO, RedirectAttributes rttr) {
		usersService.modify(usersVO);
		rttr.addFlashAttribute("infoModify", "정보 수정이 완료되었습니다");
		
		return "redirect:/mypage/main";
	}
	
	/*									예약														*/
	@GetMapping("/reservation/list")
	public void mypageReservationList(Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String USERNAME = authentication.getName();
		
		UsersVO user = usersService.findByUsername(USERNAME);
		
		model.addAttribute("user", user);
		List<ReservationVO> reservationList = reservationService.findByUsername(USERNAME);
		model.addAttribute("reservationList", reservationList);
		
		UsersPointVO point = usersPointService.findByUsername(USERNAME);
		model.addAttribute("point", point);
		
	}
	
	@GetMapping("/reservation/read")
	public void mypageReservationRead(@RequestParam("rno") Long rno, Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String USERNAME = authentication.getName();
		
		UsersVO user = usersService.findByUsername(USERNAME);
		log.info(user.toString());
		model.addAttribute("user", user);
		ReservationVO reservation = reservationService.get(rno);
		model.addAttribute("reservation", reservation);
		
		UsersPointVO point = usersPointService.findByUsername(USERNAME);
		model.addAttribute("point", point);
	}
	
	
	/*									리뷰														*/
	@GetMapping("/review/list")
	public void mypageReviewList(Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String USERNAME = authentication.getName();
		
		UsersVO user = usersService.findByUsername(USERNAME);
		log.info(user.toString());
		model.addAttribute("user", user);
		List<ReviewVO> reviewList = reviewService.getListByWriter(USERNAME);
		model.addAttribute("reviewList", reviewList);
		
		UsersPointVO point = usersPointService.findByUsername(USERNAME);
		model.addAttribute("point", point);
	}
	
	@GetMapping({"/review/read", "/review/modify"})
	public void mypageReviewRead(@RequestParam("rno") Long rno, Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String USERNAME = authentication.getName();
		
		UsersVO user = usersService.findByUsername(USERNAME);
		log.info(user.toString());
		model.addAttribute("user", user);
		ReviewVO review = reviewService.get(rno);
		model.addAttribute("review", review);
		
		UsersPointVO point = usersPointService.findByUsername(USERNAME);
		model.addAttribute("point", point);
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/review/delete")
	public String postMypageReviewDelete(@RequestParam("rno") Long rno, RedirectAttributes rttr) {
		reviewService.remove(rno);
		
		rttr.addFlashAttribute("deleteMessage", rno + " 번 리뷰 삭제가 완료되었습니다");
		
		return "redirect:/mypage/review/list";
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/review/modify")
	public String postMypageReviewModify(@ModelAttribute ReviewVO reviewVO, RedirectAttributes rttr) {
		reviewService.modify(reviewVO);
		rttr.addFlashAttribute("modifyMessage", reviewVO.getRno() + " 번 리뷰 수정이 완료되었습니다");
		
		return "redirect:/mypage/review/list";
	}
	
	/*									포인트														*/
	@GetMapping("/point")
	public String mypagePoint(Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String USERNAME = authentication.getName();
		
		UsersVO user = usersService.findByUsername(USERNAME);
		log.info(user.toString());
		model.addAttribute("user", user);
		UsersPointVO pointVO = usersPointService.findByUsername(USERNAME);
		List<UsersPoingLogVO> pointLogList = usersPointLogService.findByUsername(USERNAME);
		
		UsersPointVO point = usersPointService.findByUsername(USERNAME);
		model.addAttribute("point", point);
		
		model.addAttribute("pointLogList", pointLogList);
		model.addAttribute("pointVO", pointVO);
		
		return "/mypage/point/point";
	}
	
	
	/*									회원탈퇴														*/
	@GetMapping("/out")
	public void mypageOut(Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String USERNAME = authentication.getName();
		
		UsersVO user = usersService.findByUsername(USERNAME);
		log.info(user.toString());
		model.addAttribute("user", user);
		
		UsersPointVO point = usersPointService.findByUsername(USERNAME);
		model.addAttribute("point", point);
		
	}
	
	@PostMapping("/out")
	public String postMypageOut(@RequestParam String password, RedirectAttributes rttr) {
		// 시큐리티 도입 후 유저VO 불러오기
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String USERNAME = authentication.getName();
		
		// 사용자 정보 삭제
		
		
		// 로그아웃 처리
		return "redirect:/";
	}
	
}
