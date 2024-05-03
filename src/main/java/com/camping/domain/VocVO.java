package com.camping.domain;

import java.util.Date;

import lombok.Data;

@Data
public class VocVO {
 
	private Long vno;
	private String title;
	private String content;
	private String writer;
	private Date regDate;
	private Date updateDate;
}
