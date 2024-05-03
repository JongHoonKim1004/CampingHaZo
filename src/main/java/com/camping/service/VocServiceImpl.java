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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean modify(VocVO voc) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean remove(Long vno) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<VocVO> getList() {
		// TODO Auto-generated method stub
		return null;
	}

}
