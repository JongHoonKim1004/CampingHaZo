package com.camping.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.camping.domain.UsersCampingVO;

public interface UsersCampingMapper {
  
     public List<UsersCampingVO> getList();
     
     public void insert(UsersCampingVO usersCamping);
     
     public void insertSelectKey(UsersCampingVO usersCamping);
     
     public UsersCampingVO read(Long cno);
     
     public int delete(Long cno);
     
     public int update(UsersCampingVO userCamping);

     public List<UsersCampingVO> findByUsername(String username);
}
