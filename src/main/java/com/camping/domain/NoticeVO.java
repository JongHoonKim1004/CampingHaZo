package com.camping.domain;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeVO {
 
	 private int nno;
	 private String title;
	 private String content;
	 private String writer;
	 private Date regDate;
	 private Date updateDate;
	 private int readCount; // 게시글 조회수 
	 
}
