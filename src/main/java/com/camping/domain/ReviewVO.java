package com.camping.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {
    
	private Long rno;
	private String camping;
	private String title;
	private String content;
	private String writer;
	private Date regDate;
	private Date updateDate;
	private int readCount; //조회수
	
	
}
