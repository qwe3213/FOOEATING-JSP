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
	
	/* ================== < 관리자 관련 메서드 > ======================== */
	
}