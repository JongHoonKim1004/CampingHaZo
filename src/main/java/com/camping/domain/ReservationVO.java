package com.camping.domain;

import lombok.Data;

@Data
public class ReservationVO {
	 
	 private Long rno;   //예약 식별번호
	 private Long cno;   // 캠핑장 식별번호
	 private String username;  //유저아이디
	 private Data resDate;   // 예약시간
	 private int money;    //  예약금액
	 private String payment;  //결제 수단
	 private Data payDate;  //결제시간
	 private int people;   // 인원수 

}
