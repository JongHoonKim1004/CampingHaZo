package com.camping.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MyCampingVO {
 
	 private Long cno;
	 private String name;
	 private String addr;
	 private String phone;
	 private Date regDate;
	 private String member;
	 
}
