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
	
	// 공통사용 변수
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	

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
			sql = "select user.*, if(user_id = owner_user_id, 'o', 'x') as 'owner_id' "
					+ " from user left join restaurant on user_id = owner_user_id order by regdate desc";
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
				dto.setOwner_id(rs.getString("owner_id"));
				userList.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
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
				pstmt.setString(1, dto.getUser_id());
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

	// 관리자 - 회원 목록 getUserList()
	
	// 관리자 - 입점 목록 getRestaurantList()
	public List<RestaurantDTO> getRestaurantList() {
		List<RestaurantDTO> restList = new ArrayList<RestaurantDTO>();
		
		try {
			con = getCon();
			sql = "select * from restaurant order by regdate desc";
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
		} finally {
			closeDB();
		}
		
		return restList;
	}
	// 관리자 - 입점 목록 getRestaurantList()
	
	// 관리자 - 가게 상세 목록 getRestaurantInfo()
	public RestaurantDTO getRestaurantInfo(int rest_id) {
		RestaurantDTO dto = null;
		
		try {
			con = getCon();
			sql = "select * from restaurant where rest_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rest_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new RestaurantDTO();
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
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return dto;
	}
	// 관리자 - 가게 상세 목록 getRestaurantInfo()
	
	/* ================== < 관리자 관련 메서드 > ======================== */
	
	
	
	
	
	/* ================== < 회원 관련 메서드 > ======================== */
	
	// 로그인 체크 - memberLogin(dto)
	// -1 비회원 / 0 비번오류 / 1 회원
	public int memberLogin(UserDTO dto) {
		
		// result 기본 값
		int result = -1;
		
		try {
			con = getCon();
			
			sql = "select pw from User where user_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getUser_id());
			
			rs = pstmt.executeQuery();
			
			// 데이터 처리
			if(rs.next()) {
				// 회원일 때
				if(dto.getPw().equals(rs.getString("pw"))) {
					// 본인
					result = 1;
				}else {
					// 비밀번호 오류
					result = 0;
				}
			}else {
				// 비회원
				result = -1;
			}
			
			System.out.println("DAO : 로그인처리 결과 : " + result);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return result;
	}
	// 로그인 체크 - memberLogin(dto)
	
	// 회원가입 아이디 중복체크 
	public int checkId(String id) {
		int result = 1;
		try {
			con = getCon();
			
			sql = "select * from user where user_id = ?";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			if(rs.next() || id.equals("")) {
				result = 0; // 이미 존재하는 경우, 생성 불가능
			} else {
				result = 1; // 존재하지 않는 경우, 생성 가능
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		
		return result;
		
		
	}
	// 회원가입 아이디 중복체크 
	
	/* ================== < 회원 관련 메서드 > ======================== */
	
	
	
	

}