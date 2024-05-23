package com.camping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.camping.domain.AdminVO;
import com.camping.domain.MemberVO;
import com.camping.mapper.MemberMapper;
import com.camping.security.domain.CustomMember;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MemberServicelmpl implements MemberService {

	@Autowired
	private MemberMapper mapper;
	@Autowired
	private PasswordEncoder encoder;
	
	
	@Override
	public MemberVO get(Long mno) {
		log.info("get,,,,,"+ mno);
		return mapper.read(mno);
	}

	@Override
	public boolean modify(MemberVO member) {
		log.info("modify.." + member);
		return mapper.update(member)==1;
	}

	@Override
	public boolean remove(Long mno) {
		 log.info("remove.." + mno);
		return mapper.delete(mno)==1;
	}

	@Override
	public List<MemberVO> getList() {
		log.info("getList........");
		return mapper.getList();
	}

	@Override
	public void register(MemberVO member) {
		 log.info("register..." + member);
		 mapper.insertSelectKey(member);
		
	}

	@Override
	public MemberVO findByUsername(String username) {
		// TODO Auto-generated method stub
		return mapper.findByUsername(username);
	}

	@Override
	public boolean authenticate(String username, String password) {
		MemberVO member = findByUsername(username);
		log.info(member);
		String originalPassword = member.getPassword();
		log.info(originalPassword);
		if(encoder.matches(password, originalPassword)) {
		return true;
	}else {
		return false;
    	}
    }

	@Override
	public void setAuthenticationMember(String id) {
		
		MemberVO member = mapper.findByUsername(id);
		
		UserDetails userDetails = new CustomMember(member);
		
		Authentication authentication = new UsernamePasswordAuthenticationToken(userDetails,"",AuthorityUtils.createAuthorityList("ROLE_MEMBER"));
		
		SecurityContextHolder.getContext().setAuthentication(authentication);
		
		
	}

}
