package com.fooeating.db;

import java.sql.Timestamp;

public class RestaurantDTO {
	private String rest_id;
	private String name;
	private String descriptions;
	private String rest_tel;
	private String convenience;
	private String runtime;
	private String rest_notice;
	private String dayoff;
	private int status;
	private String owner_user_id;
	private boolean on_off;
	private String category;
	private String addr_city;
	private String addr_district;
	private String addr_etc;
	private Timestamp regdate;
	private int read_count;
	private int like_num;
	private int grade;
	private WaitingDTO waitdto;
	
	
	public String getRest_id() {
		return rest_id;
	}
	public void setRest_id(String rest_id) {
		this.rest_id = rest_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescriptions() {
		return descriptions;
	}
	public void setDescriptions(String descriptions) {
		this.descriptions = descriptions;
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
	public WaitingDTO getWaitdto() {
		return waitdto;
	}
	public void setWaitdto(WaitingDTO waitdto) {
		this.waitdto = waitdto;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getAddr_city() {
		return addr_city;
	}
	public void setAddr_city(String addr_city) {
		this.addr_city = addr_city;
	}
	public String getAddr_district() {
		return addr_district;
	}
	public void setAddr_district(String addr_district) {
		this.addr_district = addr_district;
	}
	public String getAddr_etc() {
		return addr_etc;
	}
	public void setAddr_etc(String addr_etc) {
		this.addr_etc = addr_etc;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public int getRead_count() {
		return read_count;
	}
	public void setRead_count(int read_count) {
		this.read_count = read_count;
	}
	public int getLike_num() {
		return like_num;
	}
	public void setLike_num(int like_num) {
		this.like_num = like_num;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	
}
