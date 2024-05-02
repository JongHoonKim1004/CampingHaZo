package com.camping.domain;

public class MemberVO {
  
	  private int uno;
	  private String username;
	  private String name;
	  private String password;
	  private String phone;
	  private String addr;
	  private String addrDetail;
	  private int zipCode;
	  private String regDate;
	  
	public int getUno() {
		return uno;
	}
	public void setUno(int uno) {
		this.uno = uno;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getAddrDetail() {
		return addrDetail;
	}
	public void setAddrDetail(String addrDetail) {
		this.addrDetail = addrDetail;
	}
	public int getZipCode() {
		return zipCode;
	}
	public void setZipCode(int zipCode) {
		this.zipCode = zipCode;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
	@Override
	public String toString() {
		return "MemberVO [uno=" + uno + ", username=" + username + ", name=" + name + ", password=" + password
				+ ", phone=" + phone + ", addr=" + addr + ", addrDetail=" + addrDetail + ", zipCode=" + zipCode
				+ ", regDate=" + regDate + "]";
	}
	  
	  
	
	  
	  
}
