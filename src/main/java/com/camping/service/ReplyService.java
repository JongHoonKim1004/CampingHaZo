package com.camping.service;

import java.util.List;

import com.camping.domain.Criteria;
import com.camping.domain.ReplyVO;

public interface ReplyService {
	
	public void register(ReplyVO vo);
	
	public ReplyVO get(Long rno);
	
	public int modify(ReplyVO vo);
	
	public int remove(Long rno);
	
	 public List<ReplyVO> getList(Long vno);

}
