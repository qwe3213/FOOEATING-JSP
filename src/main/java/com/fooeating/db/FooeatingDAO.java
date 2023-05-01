package com.fooeating.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class FooeatingDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	
	private Connection getCon() throws Exception {
		Context initCTX = new InitialContext();
		DataSource ds = (DataSource) initCTX.lookup("java:comp/env/db.itwillbs.dev/class7_230118_team4");
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
	
	
}