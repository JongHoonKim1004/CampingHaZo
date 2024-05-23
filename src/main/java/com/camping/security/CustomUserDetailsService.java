package com.camping.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.camping.security.domain.CustomUser;
import com.camping.domain.UsersVO;
import com.camping.mapper.MemberMapper;
import com.camping.mapper.UsersMapper;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	private UsersMapper usersMapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		UsersVO users = usersMapper.findByUsername(username);
		
		log.info("Lond User By Username :"+  username);
		
		return users == null ? null : new CustomUser(users);
	}

}
