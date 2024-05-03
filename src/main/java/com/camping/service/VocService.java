package com.camping.service;

import java.util.List;

import com.camping.domain.VocVO;

public interface VocService {
	
	 public void register(VocVO voc);
	   
	   public VocVO get(Long vno);
	   
	   public boolean modify(VocVO voc);
	   
	   public boolean remove(Long vno);
	   
	   public List<VocVO> getList();

}
