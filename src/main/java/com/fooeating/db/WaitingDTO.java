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
	
}
