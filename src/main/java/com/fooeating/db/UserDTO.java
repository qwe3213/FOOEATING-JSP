package com.fooeating.db;

import java.sql.Timestamp;

public class UserDTO {
	private String user_id;
	private String pw;
	private String name;
	private String email;
	private String phone;
	private Timestamp regdate;
	private String owner_id;

	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String use_id) {
		this.user_id = use_id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public String getOwner_id() {
		return owner_id;
	}
	public void setOwner_id(String owner_id) {
		this.owner_id = owner_id;
	}

}