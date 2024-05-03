package com.camping.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.camping.domain.ReviewVO;

public interface ReviewMapper {
  
	
	 public List<ReviewVO> getList();
	 
	 public void insert(ReviewVO review);
	 
	 public void insertSelectKey(ReviewVO review);
	 
	 public ReviewVO read(Long rno);
	 
	 public int delete(Long rno);
	 
	 public int update(ReviewVO review);
}
