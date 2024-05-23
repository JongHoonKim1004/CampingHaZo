package com.camping.controller;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.camping.domain.NoticeVO;
import com.camping.domain.ReservationVO;
import com.camping.domain.ReviewVO;
import com.camping.service.NoticeService;
import com.camping.service.ReservationService;
import com.camping.service.ReviewService;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
public class AjaxController {
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private ReservationService reservationService;
	
	// send notice one
	@GetMapping(value="/notice/read/nno/{nno}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<NoticeVO> ajaxNoticeRead(@PathVariable("nno") Long nno){
		// update readcount
		noticeService.readCount(nno);
		log.info("Updated Readcount");
		
		NoticeVO notice = noticeService.get(nno);
		log.info("Read Complete : " + notice);
		
		return new ResponseEntity<NoticeVO>(notice, HttpStatus.OK);
	}
	
	// send review one
	@GetMapping(value = "/review/read/rno/{rno}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<ReviewVO> ajaxReviewRead(@PathVariable("rno") Long rno){
		// update readCount
		reviewService.readCount(rno);
		log.info("Updated ReadCount");
		
		ReviewVO review = reviewService.get(rno);
		log.info("Read Complete : " + review);
		
		return new ResponseEntity<ReviewVO>(review, HttpStatus.OK);
	}
	
	// check reservation
	@GetMapping(value="/camping/reservation/check/{name}/{startDate}/{endDate}", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> ajaxReservationCheck(@PathVariable String name, @PathVariable long startDate, @PathVariable long endDate){
        List<ReservationVO> allReservationList = reservationService.getList();
        log.info(allReservationList);
        log.info("StartDate: " + startDate + ", EndDate: " + endDate);
        
        // startDate와 endDate를 LocalDate 객체로 변환
        LocalDate start = new Date(startDate * 1000L).toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        LocalDate end = new Date(endDate * 1000L).toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        log.info("Start LocalDate: " + start + ", End LocalDate: " + end);

        // 모든 예약 데이터를 로그로 출력
        for (ReservationVO reservation : allReservationList) {
            log.info("Reservation Name: " + reservation.getName() + ", ResDate: " + reservation.getResDate());
        }

        // 기간 내 예약 필터링
        List<ReservationVO> reservationList = allReservationList.stream()
                .filter(reservation -> {
                    log.info("Filtering reservation: " + reservation);
                    return reservation.getName().equals(name) && 
                           reservation.getResDate() != null && 
                           isWithinRange(reservation.getResDate(), start, end);
                })
                .collect(Collectors.toList());
        
        // 필터링된 예약 데이터를 로그로 출력
        log.info("Filtered reservations: " + reservationList.size());
        for (ReservationVO reservation : reservationList) {
            log.info("Filtered Reservation Name: " + reservation.getName() + ", ResDate: " + reservation.getResDate());
        }

        // 결과 반환
        if (reservationList.isEmpty()) {
            return new ResponseEntity<>("예약이 없습니다", HttpStatus.NO_CONTENT);
        } else {
            return ResponseEntity.ok(reservationList);
        }
    }
    
    // 예약 날짜가 주어진 범위 내에 있는지 확인하는 메서드
    private boolean isWithinRange(Date testDate, LocalDate startDate, LocalDate endDate) {
        LocalDate date = testDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        log.info("Comparing ResDate: " + date + " with StartDate: " + startDate + " and EndDate: " + endDate);
        return (date.isEqual(startDate) || date.isAfter(startDate)) && 
               (date.isEqual(endDate) || date.isBefore(endDate));
    }
}
