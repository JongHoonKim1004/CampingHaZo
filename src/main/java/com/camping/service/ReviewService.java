package com.camping.service;

import java.util.List;

import com.camping.domain.Criteria;
import com.camping.domain.ReviewVO;

public interface ReviewService {
		public List<ReviewVO> getList();
   
	 public void register(ReviewVO review);
	 
	 public ReviewVO get(Long rno);
	 
	 public boolean modify(ReviewVO review);
	 
	 public boolean remove(Long rno);
	 
	 public void readCount(Long rno);
	 
	 public List<ReviewVO> getListWithPaging(Criteria cri);
	 
	 public int getTotal(Criteria cri);
	 
	 public List<ReviewVO> getListByWriter(String writer);  //마이페이지 리뷰 리스트
}
