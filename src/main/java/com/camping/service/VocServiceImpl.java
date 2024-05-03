package com.camping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camping.domain.VocVO;
import com.camping.mapper.VocMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class VocServiceImpl implements VocService {

	@Autowired
	private VocMapper mapper;
	
	@Override
	public void register(VocVO voc) {
		log.info("register...." + voc);
		mapper.insertSelectKey(voc);
		
	}

	@Override
	public VocVO get(Long vno) {
	      log.info("get....." + vno);
	      return mapper.read(vno);
	}

	@Override
	public boolean modify(VocVO voc) {
	     log.info("modify.... " + voc);
	     return mapper.update(voc)==1;
	}

	@Override
	public boolean remove(Long vno) {
	     log.info("remove...." + vno);
	     return mapper.delete(vno)==1;
	}

	@Override
	public List<VocVO> getList() {
		log.info("getList...");
		return mapper.getList();
	}

}
