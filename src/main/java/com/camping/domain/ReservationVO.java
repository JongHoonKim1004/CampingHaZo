package com.camping.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReservationVO {
	 
	 private Long rno;   //예약 식별번호
	 private String name; // 캠핑장 이름
	 private String username;  //유저아이디
	 private Date resDate;   // 예약시간
	 private int money;      // 예약 금액
	 private int people;   // 인원수 

}
