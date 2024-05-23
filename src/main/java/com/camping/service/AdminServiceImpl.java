package com.camping.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.camping.domain.AdminVO;
import com.camping.mapper.AdminMapper;
import com.camping.security.domain.CustomAdmin;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class AdminServiceImpl implements AdminService {

	
	@Autowired
	private AdminMapper mapper;
	@Autowired
	private PasswordEncoder encoder;
	
	@Override
	public void register(AdminVO admin) {
		log.info("register..." + admin);
		mapper.insertSelectKey(admin);
		
	}

	@Override
	public AdminVO get(Long ano) {
		log.info("get...." + ano);
		return mapper.read(ano);
	}

	@Override
	public boolean modify(AdminVO admin) {
		log.info("modify.." + admin);
		return mapper.update(admin)==1;
	}

	@Override
	public boolean remove(Long ano) {
		  log.info("remove..."+ ano);
		return mapper.delete(ano)==1;
	}

	@Override
	public List<AdminVO> getList() {
		log.info("getList");
		return mapper.getList();
	}

	@Override
	public AdminVO findByUsername(String username) {
		// TODO Auto-generated method stub
		return mapper.findByUsername(username);
	}

	@Override
	public boolean authenticate(String username, String password) {
		 AdminVO admin = findByUsername(username);
		 String originalPassword = admin.getPassword();
		 if(encoder.matches(password, originalPassword)) {
			  return true;
		 }else {
		return false;
		 }
		 
	}
	@Override
	public void setAuthenticationAdmin(String id) {
		
		
		// 비밀번호가 일치하면 권한을 포함한 정보를 가져온다
		AdminVO admin = mapper.findByUsername(id);

		// 가져온 정보를 인증 처리를 할 수 있도록 담고 인증 처리를 한다
		UserDetails userDetails = new CustomAdmin(admin);
		
		Authentication authentication = new UsernamePasswordAuthenticationToken(userDetails, "",AuthorityUtils.createAuthorityList("ROLE_ADMIN"));
		
		SecurityContextHolder.getContext().setAuthentication(authentication);
		
		
	}

}
