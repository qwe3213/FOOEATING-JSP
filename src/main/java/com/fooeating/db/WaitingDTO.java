package com.fooeating.db;

import java.sql.Timestamp;

public class WaitingDTO {

	private int wait_num;
	private String user_id;
	private String rest_id;
	private String rest_name;
	private int status;
	private Timestamp regdate;
	private int wait_team;
	private int review_check;
	private String name;
	private String phone;
	private int people;
  
	public int getReview_check() {
		return review_check;
	}
	public void setReview_check(int review_check) {
		this.review_check = review_check;
	
	public int getPeople() {
		return people;
	}
	public void setPeople(int people) {
		this.people = people;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getWait_team() {
		return wait_team;
	}
	public void setWait_team(int wait_team) {
		this.wait_team = wait_team;
	}
	public String getRest_name() {
		return rest_name;
	}
	public void setRest_name(String rest_name) {
		this.rest_name = rest_name;
	}
	
	public int getWait_num() {
		return wait_num;
	}
	public void setWait_num(int wait_num) {
		this.wait_num = wait_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getRest_id() {
		return rest_id;
	}
	public void setRest_id(String rest_id) {
		this.rest_id = rest_id;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "WaitingDTO [wait_num=" + wait_num + ", user_id=" + user_id + ", rest_id=" + rest_id + ", rest_name="
				+ rest_name + ", status=" + status + ", regdate=" + regdate + ", wait_team=" + wait_team + "]";
	}
	
}
