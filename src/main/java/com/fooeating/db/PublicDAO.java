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

public class PublicDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	
	private Connection getCon() throws Exception {
		Context initCTX = new InitialContext();
		DataSource ds = (DataSource) initCTX.lookup("java:comp/env/jdbc/FOOEATING");
		con = ds.getConnection();
		System.out.println("DAO : DB 연결 성공 - " + con);
		return con;
	}
	
	public void closeDB() {
		try {
			if (rs != null)		rs.close();
			if (pstmt != null)	pstmt.close();
			if (con != null)	con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void test() {
		try {
			con = getCon();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
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
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone"));
				dto.setPw(rs.getString("pw"));
				dto.setRegdate(rs.getTimestamp("regdate"));
				userList.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return userList;
	}
	
	// 회원가입 - MemberJoin()
		public void MemberJoin(UserDTO dto) {
			try {
				// 1.2. 디비연결
				con = getCon();
				// 3. sql작성&pstmt 객체
				sql = "insert into user(user_id,pw,name,email,phone,regdate) "
						+ " values(?,?,?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, dto.getId());
				pstmt.setString(2, dto.getPw());
				pstmt.setString(3, dto.getName());
				pstmt.setString(4, dto.getEmail());
				pstmt.setString(5, dto.getPhone());
				pstmt.setTimestamp(6, dto.getRegdate());
				
				// 4. sql 실행
				pstmt.executeUpdate();
				System.out.println(" DAO : 회원가입 성공!");
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				closeDB();
			}
			
			
		}// 회원가입 - MemberJoin()
	
}