package com.camping.security.domain;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;

import com.camping.domain.MemberVO;
import com.camping.domain.UsersVO;

import lombok.Getter;

@Getter
public class CustomKakaoUser extends User {
	
	private static final long serialVersionUID = 1L;
	private UsersVO users;

            
	public CustomKakaoUser(String username, String password, 
			Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}

           
	public CustomKakaoUser(UsersVO vo) {
                 
		super(vo.getUsername(),vo.getPassword(),AuthorityUtils.createAuthorityList("ROLE_USERS"));
		this.users = vo;   
	}
}
