package com.camping.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {
    
	private Long rno;
	private int cno;
	private String title;
	private String content;
	private String writer;
	private Date regDate;
	private Date updateDate;
	private int readCount;
}
