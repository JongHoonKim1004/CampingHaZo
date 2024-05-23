package com.camping.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.camping.domain.Criteria;
import com.camping.domain.NoticeVO;

public interface NoticeMapper {
   
      public List<NoticeVO> getList();
      
      public void insert(NoticeVO notice);
      
      public void insertSelectKey(NoticeVO notice);
      
      public NoticeVO read(Long nno);
      
      public int delete(Long nno);
      
      public int update(NoticeVO votice);
      
      public void readCount(Long nno);
      
      public List<NoticeVO> getListWithPaging(Criteria cri);
      
      public int getTotalCount(Criteria cri);    // 페이징 처리
      
      public List<NoticeVO> getRecentNotices(int count); //최근 게시물 2개 보이게
      
      
}
