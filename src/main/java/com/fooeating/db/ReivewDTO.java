package com.fooeating.db;

import java.sql.Timestamp;

public class ReivewDTO {
	private int review_num;
	private String user_id;
	private String content;
	private String file;
	private Timestamp regdate;
	private String rest_id;
	private String name;
	private int grade;
	private int wait_num;
	public int getWait_num() {
		return wait_num;
	}
	public void setWait_num(int wait_num) {
		this.wait_num = wait_num;
	}
	private int review_check;
	

	public int getReview_check() {
		return review_check;
	}
	public void setReview_check(int review_check) {
		this.review_check = review_check;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public int getReview_num() {
		return review_num;
	}
	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public String getRest_id() {
		return rest_id;
	}
	public void setRest_id(String rest_id) {
		this.rest_id = rest_id;
	}
}
