package com.camping.service;

import java.util.List;

import com.camping.domain.ReviewVO;

public interface ReviewService {
   
	 public void register(ReviewVO review);
	 
	 public ReviewVO get(Long rno);
	 
	 public boolean modify(ReviewVO review);
	 
	 public boolean remove(Long rno);
	 
	 public List<ReviewVO> getList();
}
