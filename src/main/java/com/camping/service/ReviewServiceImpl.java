package com.camping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camping.domain.Criteria;
import com.camping.domain.ReviewVO;
import com.camping.mapper.ReviewMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	private ReviewMapper mapper;
	
	
	@Override
	public void register(ReviewVO review) {
		log.info("register...." + review);
		mapper.insertSelectKey(review);
		
	}

	@Override
	public ReviewVO get(Long rno) {
		 log.info("get...." + rno);
		return mapper.read(rno);
	}

	@Override
	public boolean modify(ReviewVO review) {
		 log.info("modify..." + review);
		return mapper.update(review) ==1;
	}

	@Override
	public boolean remove(Long rno) {
		 log.info("remove..."+ rno);
		return mapper.delete(rno) ==1;
	}

	@Override
	public List<ReviewVO> getList() {
		log.info("getList");
		return mapper.getList();
	}

	@Override
	public void readCount(Long rno) {
		
		mapper.readCount(rno);
		
	}
	
	@Override
	public int getTotal(Criteria cri) {
		
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<ReviewVO> getListByWriter(String writer) {
		  log.info("writer");
		return mapper.getListByWriter(writer);
	}


	@Override
	public List<ReviewVO> getListWithPaging(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getListWithPaging(cri);
	}

	

	

}
