package com.fooeating.db;

import java.sql.Timestamp;

public class RestaurantDTO {
	private int id;
	private String name;
	private String profile;
	private String rest_tel;
	private String convenience;
	private String file_out;
	private String file_in;
	private String file_menu;
	private String runtime;
	private String rest_notice;
	private String dayoff;
	private int status;
	private String owner_user_id;
	private boolean on_off;
	private String category;
	private String addr;
	private Timestamp regdate;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getRest_tel() {
		return rest_tel;
	}
	public void setRest_tel(String rest_tel) {
		this.rest_tel = rest_tel;
	}
	public String getConvenience() {
		return convenience;
	}
	public void setConvenience(String convenience) {
		this.convenience = convenience;
	}
	public String getFile_out() {
		return file_out;
	}
	public void setFile_out(String file_out) {
		this.file_out = file_out;
	}
	public String getFile_in() {
		return file_in;
	}
	public void setFile_in(String file_in) {
		this.file_in = file_in;
	}
	public String getFile_menu() {
		return file_menu;
	}
	public void setFile_menu(String file_menu) {
		this.file_menu = file_menu;
	}
	public String getRuntime() {
		return runtime;
	}
	public void setRuntime(String runtime) {
		this.runtime = runtime;
	}
	public String getRest_notice() {
		return rest_notice;
	}
	public void setRest_notice(String rest_notice) {
		this.rest_notice = rest_notice;
	}
	public String getDayoff() {
		return dayoff;
	}
	public void setDayoff(String dayoff) {
		this.dayoff = dayoff;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getOwner_user_id() {
		return owner_user_id;
	}
	public void setOwner_user_id(String owner_user_id) {
		this.owner_user_id = owner_user_id;
	}
	public boolean isOn_off() {
		return on_off;
	}
	public void setOn_off(boolean on_off) {
		this.on_off = on_off;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
}
