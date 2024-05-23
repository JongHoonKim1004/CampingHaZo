package com.camping.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.camping.domain.UsersPointVO;

public interface UsersPointMapper {

       
        public List<UsersPointVO> getList();
        
        public void insert(UsersPointVO usersPoint);
        
        public void insertSelectKey(UsersPointVO usersPoint);
        
        public UsersPointVO read(Long pno);
        
        public int delete(Long pno);

        public int update(UsersPointVO usersPoint);
	
        public UsersPointVO findByUsername(String username);
}
