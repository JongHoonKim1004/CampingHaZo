package com.camping.domain;

import java.util.Date;

import lombok.Data;

@Data
public class UsersPoingLogVO {

	private Long lno;
	private String username;
	private int pointChange;
	private String changeReason;
	private Date changeTime;
}
