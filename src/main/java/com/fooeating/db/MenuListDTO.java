package com.fooeating.db;

public class MenuListDTO {
	private int list_no;
	private int read_count;
	private int like_num;
	private int grade;
	private int rest_id;
	private String loc_city;
	private String loc_district;
	
	public int getList_no() {
		return list_no;
	}
	public void setList_no(int list_no) {
		this.list_no = list_no;
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
	public int getRest_id() {
		return rest_id;
	}
	public void setRest_id(int rest_id) {
		this.rest_id = rest_id;
	}
	public String getLoc_city() {
		return loc_city;
	}
	public void setLoc_city(String loc_city) {
		this.loc_city = loc_city;
	}
	public String getLoc_district() {
		return loc_district;
	}
	public void setLoc_district(String loc_district) {
		this.loc_district = loc_district;
	}
}
