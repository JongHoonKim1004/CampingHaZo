package com.camping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camping.domain.NoticeVO;
import com.camping.mapper.NoticeMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class NoticeServiceImpl implements NoticeService {
   
	   @Autowired
	   private NoticeMapper mapper;

	   @Override
	   public void register(NoticeVO board) {
	   	log.info("register....." + board);
	   	mapper.insertSelectKey(board);
	   }

	@Override
	public NoticeVO get(Long nno) {
		 log.info("get..." + nno);
		return mapper.read(nno);
	}

	@Override
	public boolean modify(NoticeVO notice) {
		log.info("modift..." + notice);
		return mapper.update(notice)==1;
	}

	@Override
	public boolean remove(Long nno) {
		 log.info("remove..." + nno);
		return mapper.delete(nno)==1;
	}

	@Override
	public List<NoticeVO> getList() {
		 log.info("getList....");
		return mapper.getList();
	}
	   
	   
}
