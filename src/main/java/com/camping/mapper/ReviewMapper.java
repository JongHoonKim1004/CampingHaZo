package com.camping.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.camping.domain.Criteria;
import com.camping.domain.ReviewVO;

public interface ReviewMapper {
  
	
	 public List<ReviewVO> getList();
	 
	 public void insert(ReviewVO review);
	 
	 public void insertSelectKey(ReviewVO review);
	 
	 public ReviewVO read(Long rno);
	 
	 public void readCount(Long nno);
	 
	 public int delete(Long rno);
	 
	 public int update(ReviewVO review);
	 
	 public List<ReviewVO> getListWithPaging(Criteria cri);
	 
	 public int getTotalCount(Criteria cri);
	 
	 public List<ReviewVO> getListByWriter(String writer); // 마이페이지 리뷰 리스트
	 
	 
}
