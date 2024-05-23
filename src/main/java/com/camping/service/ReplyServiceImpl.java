package com.camping.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.camping.domain.Criteria;
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
	public void register(ReplyVO vo) {
		// TODO Auto-generated method stub
		log.info("register : " + vo);
		mapper.insert(vo);
	}

	@Override
	public ReplyVO get(Long rno) {
		// TODO Auto-generated method stub
		return mapper.read(rno);
	}

	@Override
	public int modify(ReplyVO vo) {
		// TODO Auto-generated method stub
		return mapper.update(vo);
	}

	@Override
	public int remove(Long rno) {
		// TODO Auto-generated method stub
		return mapper.delete(rno);
	}

	@Override
	public List<ReplyVO> getList(Long vno) {
		// TODO Auto-generated method stub
		return mapper.getList(vno);
	}

	

}
