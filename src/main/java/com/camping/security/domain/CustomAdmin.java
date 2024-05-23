package com.camping.security.domain;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;

import com.camping.domain.AdminVO;
import com.camping.domain.UsersVO;

import lombok.Getter;

@Getter
public class CustomAdmin extends User {

	private static final long serialVersionUID = 1L;
	private AdminVO admin;
	
	
	public CustomAdmin(String username, String password, 
			Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}
	

	public CustomAdmin(AdminVO vo) {
        
		super(vo.getUsername(), vo.getPassword(),AuthorityUtils.createAuthorityList("ROLE_ADMIN"));
		this.admin = vo;   
	}
	
       

}
