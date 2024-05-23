package com.camping.domain;

import lombok.Data;

@Data
public class MemberVO {
     
	private Long mno;
	private String username;
	private String name;
	private String password;
	private String addr;
	private int zipCode;
	private String phone;
	private int compNo;
}
