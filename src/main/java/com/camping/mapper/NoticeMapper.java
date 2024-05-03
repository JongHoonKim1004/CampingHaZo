package com.camping.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.camping.domain.Criteria;
import com.camping.domain.NoticeVO;

public interface NoticeMapper {
   
      public List<NoticeVO> getList();
      
      public void insert(NoticeVO notice);
      
      public void insertSelectKey(NoticeVO notice);
      
      public NoticeVO read(Long bno);
      
      public int delete(Long nno);
      
      public int update(NoticeVO votice);
      
      public List<NoticeVO> getListWithPaging(Criteria cri);
      
      public int getTotal(Criteria cri);
}
