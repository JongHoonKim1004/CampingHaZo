package com.camping.service;

import java.util.List;

import com.camping.domain.Criteria;
import com.camping.domain.NoticeVO;

public interface NoticeService {
  
	  public void register(NoticeVO notice);
	  
	  public NoticeVO get(Long nno);
	  
	  public boolean modify(NoticeVO notice);
	  
	  public boolean remove(Long nno);
	  
	  public List<NoticeVO> getList();
	  
	  public void readCount(Long nno);
	  
	  public  int getTotal(Criteria cri);
	  
	  public List<NoticeVO> getRecentNotices(int count); // 최근게시물 2개 보이기
	  
	 
	  public List<NoticeVO> getListWithPaging(Criteria cri);
	  
}
