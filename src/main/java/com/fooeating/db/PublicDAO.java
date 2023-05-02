package com.fooeating.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.catalina.User;

public class PublicDAO {
	
	// 공통사용 변수
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	
	
	
	// 공통사용 메서드
	// 1. getCon() 메서드
	private Connection getCon() throws Exception {
		Context initCTX = new InitialContext();
		DataSource ds = (DataSource) initCTX.lookup("java:comp/env/jdbc/FOOEATING");
		con = ds.getConnection();
		System.out.println("DAO : DB 연결 성공 - " + con);
		return con;
	}
	
	// 2. closeDB() 메서드
	public void closeDB() {
		try {
			if (rs != null)		rs.close();
			if (pstmt != null)	pstmt.close();
			if (con != null)	con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/* ================== < 관리자 관련 메서드 > ======================== */
	
	// 관리자 - 회원 목록 getUserList()
	public List<UserDTO> getUserList() {
		List<UserDTO> userList = new ArrayList<UserDTO>();
		
		try {
			con = getCon();
			sql = "select * from user";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				UserDTO dto = new UserDTO();
				dto.setEmail(rs.getString("email"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone"));
				dto.setPw(rs.getString("pw"));
				dto.setRegdate(rs.getTimestamp("regdate"));
				dto.setUser_id(rs.getString("user_id"));
				userList.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return userList;
	}
	// 관리자 - 회원 목록 getUserList()
	
	// 관리자 - 입점 목록 getRestaurantList()
	public List<RestaurantDTO> getRestaurantList() {
		List<RestaurantDTO> restList = new ArrayList<RestaurantDTO>();
		
		try {
			con = getCon();
			sql = "select * from restaurant";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				RestaurantDTO dto = new RestaurantDTO();
				dto.setAddr_city(rs.getString("addr_city"));
				dto.setAddr_district(rs.getString("addr_district"));
				dto.setAddr_etc(rs.getString("addr_etc"));
				dto.setCategory(rs.getString("category"));
				dto.setConvenience(rs.getString("convenience"));
				dto.setDayoff(rs.getString("dayoff"));
				dto.setDescriptions(rs.getString("descriptions"));
				dto.setFile_in(rs.getString("file_in"));
				dto.setFile_menu(rs.getString("file_menu"));
				dto.setFile_out(rs.getString("file_out"));
				dto.setGrade(rs.getInt("grade"));
				dto.setLike_num(rs.getInt("like_num"));
				dto.setName(rs.getString("name"));
				dto.setOn_off(rs.getBoolean("on_off"));
				dto.setOwner_user_id(rs.getString("owner_user_id"));
				dto.setRead_count(rs.getInt("read_count"));
				dto.setRegdate(rs.getTimestamp("regdate"));
				dto.setRest_id(rs.getInt("rest_id"));
				dto.setRest_notice(rs.getString("rest_notice"));
				dto.setRest_tel(rs.getString("rest_tel"));
				dto.setRuntime(rs.getString("runtime"));
				dto.setStatus(rs.getInt("status"));
				
				restList.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return restList;
	}
	// 관리자 - 입점 목록 getRestaurantList()
	
	/* ================== < 관리자 관련 메서드 > ======================== */
	
}