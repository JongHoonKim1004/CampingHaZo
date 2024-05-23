package com.camping.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.camping.domain.Criteria;
import com.camping.domain.ReplyVO;

public interface ReplyMapper {

	  public void insert(ReplyVO vo);
	  
	  public ReplyVO read(Long rno);
	  
	  public int delete(Long rno);
	  
	  public int update(ReplyVO vo);
	  
	  public List<ReplyVO> getList(Long vno);
}
