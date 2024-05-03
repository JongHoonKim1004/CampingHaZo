package com.camping.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.camping.domain.VocVO;

public interface VocMapper {
    
     public List<VocVO> getList();
     
     public void insert(VocVO voc);
     
     public void  insertSelectKey(VocVO voc);
     
     public VocVO read(Long vno);
     
     public int delete(Long vno);
     
     public int update(VocVO vno);
     
}
