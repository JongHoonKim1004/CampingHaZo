package com.camping.service;

import org.springframework.stereotype.Service;

import com.camping.domain.ReplyVO;
import com.camping.mapper.ReplyMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class ReplyServiceImpl implements ReplyService {

	private ReplyMapper mapper;
	
	@Override
	public int register(ReplyVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ReplyVO get(Long rno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int modify(ReplyVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int remove(Long rno) {
		// TODO Auto-generated method stub
		return 0;
	}

}
