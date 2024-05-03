package com.camping.mapper;

import com.camping.domain.ReplyVO;

public interface ReplyMapper {

	  public int insert(ReplyVO vo);
	  
	  public ReplyVO read(Long rno);
	  
	  public int delete(Long rno);
	  
	  public int update(ReplyVO vo);
}
