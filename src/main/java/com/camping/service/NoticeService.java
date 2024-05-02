package com.camping.service;

import java.util.List;

import com.camping.domain.NoticeVO;

public interface NoticeService {
  
	  public void register(NoticeVO notice);
	  
	  public NoticeVO get(Long nno);
	  
	  public boolean modify(NoticeVO notice);
	  
	  public boolean remove(Long nno);
	  
	  public List<NoticeVO> getList();
	  
	  
}
