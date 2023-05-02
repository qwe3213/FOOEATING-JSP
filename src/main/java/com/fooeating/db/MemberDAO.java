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

// DB에 연결해서 처리하는 모든 동작 수행 
public class MemberDAO {
	// 공통변수 선언
	
	private Connection con = null; 			// 디비 연결정보 저장(관리)
	private PreparedStatement pstmt = null; // SQL 작성, 실행
	private ResultSet rs = null;			// select 결과 데이터 저장
	private String sql = "";				// SQL구문 저장
	
	// 디비 연결 메서드
	private Connection getCon() throws Exception {
		// 0 - 디비 연결정보 
		// 1 드라이버로드 2 디비연결
		Context initCTX = new InitialContext();
		DataSource ds 
		       = (DataSource) initCTX.lookup("java:comp/env/jdbc/FOOEATING");
		con = ds.getConnection();
		System.out.println(" DAO : 디비 연결 성공! " + con);
		return con;
	}//getCon()
	
	//  디비 자원해제 
	public void closeDB() {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(con != null) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}		
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
	
	
	