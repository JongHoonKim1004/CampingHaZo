package com.camping.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
 
	 private Long rno;
	 private Long vno;
	 private String title;
	 private String content;
	 private String writer;
	 private Date regDate;
}
