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

	public List<UserDTO> getUserList(int startRow, int pageSize) {
		List<UserDTO> userList = new ArrayList<UserDTO>();
		
		try {
			con = getCon();
			sql = "select user.*, if(user_id = owner_user_id, 'o', 'x') as 'owner_id' "
					+ " from user left join restaurant on user_id = owner_user_id order by regdate desc "
					+ " limit ?, ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow - 1);
			pstmt.setInt(2, pageSize);
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
	// 관리자 - 회원 목록 getUserList()
	
	
	
	// 관리자 - 회원수 카운트 getUserCount()
	public int getUserCount() {
		int result = 0;
		
		try {
			con = getCon();
			sql = "select count(*) from user";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		
		return result;
	}
	// 관리자 - 회원수 카운트 getUserCount()
	
	
	
	// 관리자 - 입점 목록 getRestaurantList()
	public List<RestaurantDTO> getRestaurantList(int startRow, int pageSize) {
		List<RestaurantDTO> restList = new ArrayList<RestaurantDTO>();
		
		try {
			con = getCon();
			sql = "select * from restaurant where status = 1 order by regdate desc limit ?, ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow - 1);
			pstmt.setInt(2, pageSize);
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
				dto.setGrade(rs.getInt("grade"));
				dto.setLike_num(rs.getInt("like_num"));
				dto.setName(rs.getString("name"));
				dto.setOn_off(rs.getBoolean("on_off"));
				dto.setOwner_user_id(rs.getString("owner_user_id"));
				dto.setRead_count(rs.getInt("read_count"));
				dto.setRegdate(rs.getTimestamp("regdate"));
				dto.setRest_id(rs.getString("rest_id"));
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
	
	
	
	// 관리자 - 입점 가게수 getRestaurantCount()
	public int getRestaurantCount() {
		int result = 0;
		
		try {
			con = getCon();
			sql = "select count(*) from restaurant where status = 1";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		
		return result;
	}
	// 관리자 - 입점 가게수 getRestaurantCount() 
	
	
	
	// 관리자 - 가게 상세 목록 getRestaurantInfo()
	public RestaurantDTO getRestaurantInfo(String rest_id) {
		RestaurantDTO dto = null;
		
		try {
			con = getCon();
			sql = "select * from restaurant where rest_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, rest_id);
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
				dto.setGrade(rs.getInt("grade"));
				dto.setLike_num(rs.getInt("like_num"));
				dto.setName(rs.getString("name"));
				dto.setOn_off(rs.getBoolean("on_off"));
				dto.setOwner_user_id(rs.getString("owner_user_id"));
				dto.setRead_count(rs.getInt("read_count"));
				dto.setRegdate(rs.getTimestamp("regdate"));
				dto.setRest_id(rs.getString("rest_id"));
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
	
	
	
	// 관리자 - 대기 가게수 getRestaurantWaitCount()
	public int getRestaurantWaitCount() {
		int result = 0;
		
		try {
			con = getCon();
			sql = "select count(*) from restaurant where status = 0";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		
		return result;
	}
	// 관리자 - 대기 가게수 getRestaurantWaitCount()
	
	
	
	// 관리자 - 입점 목록 getRestaurantWaitList()
	public List<RestaurantDTO> getRestaurantWaitList(int startRow, int pageSize) {
		List<RestaurantDTO> restWaitList = new ArrayList<RestaurantDTO>();
		
		try {
			con = getCon();
			sql = "select * from restaurant where status = 0 order by regdate desc limit ?, ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow - 1);
			pstmt.setInt(2, pageSize);
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
				dto.setGrade(rs.getInt("grade"));
				dto.setLike_num(rs.getInt("like_num"));
				dto.setName(rs.getString("name"));
				dto.setOn_off(rs.getBoolean("on_off"));
				dto.setOwner_user_id(rs.getString("owner_user_id"));
				dto.setRead_count(rs.getInt("read_count"));
				dto.setRegdate(rs.getTimestamp("regdate"));
				dto.setRest_id(rs.getString("rest_id"));
				dto.setRest_notice(rs.getString("rest_notice"));
				dto.setRest_tel(rs.getString("rest_tel"));
				dto.setRuntime(rs.getString("runtime"));
				dto.setStatus(rs.getInt("status"));
				
				restWaitList.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return restWaitList;
	}
	// 관리자 - 입점 목록 getRestaurantWaitList()
	
	
	// 관리자 - 입점 대기 전환 getRestaurantStatus()
	public int getRestaurantStatus(String rest_id) {
		int result = 0;
		
		try {
			con = getCon();
			sql = "update restaurant set status = 1 where rest_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, rest_id);
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		
		return result;
	}
	// 관리자 - 입점 대기 전환 getRestaurantStatus()
		
		
		
	
	/* ================== < 관리자 관련 메서드 > ======================== */
	
	
	
	
	
	/* ================== < 회원 관련 메서드 > ======================== */
	
	// 1. 회원가입 - MemberJoin()
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
	
	
	
	// 1-1. 회원가입 아이디 중복체크 
		public int checkId(String id) {
			int result = 0;
			try {
				con = getCon();
				
				sql = "select * from user where user_id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				if(rs.next()) {
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
	
	
	
	// 2. 로그인 체크 - memberLogin(dto)
	// -1 비회원 / 0 비번오류 / 1 회원
	public int memberLogin(UserDTO dto) {
		
		// result 기본 값
		int result = -1;
		
		try {
			con = getCon();
			
			sql = "select pw from user where user_id=?";
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
	
	// 2-1. 회원이 점주인지 체크
	public String checkOwnerId(String user_id) {
		
		String owner_user_id = null;
		
		try {
			con = getCon();
			
			sql = "select owner_user_id from restaurant where owner_user_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				owner_user_id = rs.getString(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return owner_user_id;
	}
	
	
	// 2-2. 점주의 rest_id 체크
		public String checkRestId(String user_id) {
			
			String rest_id = null;
			
			try {
				con = getCon();
				
				sql = "select rest_id from restaurant where owner_user_id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, user_id);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					rest_id = rs.getString("rest_id");
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			
			System.out.println(rest_id);
			return rest_id;
		}


		
	// 3. 회원정보 불러오기
	public UserDTO getMember(String id) {
		UserDTO dto = null;
		try {
			// 1.2. 디비연결
			con = getCon();
			// 3. sql & pstmt
			sql = "select * from user where user_id=?";
			pstmt = con.prepareStatement(sql);
			// ??
			pstmt.setString(1, id);
			// 4. sql 실행
			rs = pstmt.executeQuery();
			// 5. 데이터처리
			
			if(rs.next()) {
				dto = new UserDTO();
				dto.setEmail(rs.getString("email"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setName(rs.getString("name"));
				dto.setPw(rs.getString("pw"));
				dto.setPhone(rs.getString("phone"));
				dto.setRegdate(rs.getTimestamp("regdate"));
			}
			
			System.out.println(" DAO : 회원정보 저장완료! ");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return dto;
	}
	

	
	// 4. 회원 정보 수정
	public int memberUpdate(UserDTO dto) {
		int result = -1; // -1	0	1
		
		try {
			// 1.2. 디비연결
			con = getCon();
			
			// 3. sql작성 & pstmt 객체
			sql = "select pw from user where user_id=?";
			pstmt = con.prepareStatement(sql);
			// ??
			pstmt.setString(1, dto.getUser_id());
			
			// 4. sql 실행(select)
			rs = pstmt.executeQuery();
			
			// 데이터 처리
			if(rs.next()){
				// 회원
				if(dto.getPw().equals(rs.getString("pw"))){
					// 본인(아이디, 비밀번호 동일)
					
					// 3. sql 작성(update) & pstmt 객체
					sql = "update user set name=?, phone=? where user_id=?" ;
					pstmt = con.prepareStatement(sql);
					// ???
					pstmt.setString(1, dto.getName());
					pstmt.setString(2, dto.getPhone());
					pstmt.setString(3, dto.getUser_id());
					
					// 4. sql 실행
					result = pstmt.executeUpdate();
					
				} else {
					// 비밀번호 오류
					result = 0;
					
				}
			}else {
				// 비회원
				result = -1;
			}
				
			System.out.println(" DAO : 회원 정보 수정 완료(" +result +")");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		
		return result;
	}
	
	// 4-1. 회원 비밀번호 수정
	public int changePw(String id, String pw, String newPw) {
		int result = -1; // -1	0	1
		
		try {
			// 1.2. 디비연결
			con = getCon();
			
			// 3. sql작성 & pstmt 객체
			sql = "select pw from user where user_id=?";
			pstmt = con.prepareStatement(sql);
			// ??
			pstmt.setString(1, id);
			
			// 4. sql 실행(select)
			rs = pstmt.executeQuery();
			
			// 데이터 처리
			if(rs.next()){
				// 회원
				if(pw.equals(rs.getString("pw"))){
					// 본인(아이디, 비밀번호 동일)
					
					// 3. sql 작성(update) & pstmt 객체
					sql = "update user set pw=? where user_id=?" ;
					pstmt = con.prepareStatement(sql);
					// ???
					pstmt.setString(1, newPw);
					pstmt.setString(2, id);
					
					// 4. sql 실행
					result = pstmt.executeUpdate();
					
				} else {
					// 비밀번호 오류
					result = 0;
					
				}
			}else {
				// 비회원
				result = -1;
			}
				
			System.out.println(" DAO : 회원 비밀번호 수정 완료(" +result +")");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return result;
	}
	


	// 5. 회원 탈퇴
	public int deleteMember(UserDTO dto) {
		System.out.println(dto.getUser_id());
		System.out.println(dto.getPw());
		int result = -1; // -1	0	1
		try {
			con = getCon();
			
			// 3. sql 작성 & pstmt 객체
			sql = "select pw from user where user_id=?";
			pstmt = con.prepareStatement(sql);
						
			// ???
			pstmt.setString(1, dto.getUser_id());
			
			// 4. sql 실행
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				
				if(dto.getPw().equals(rs.getString("pw"))){
					
					sql = "delete from user where user_id=?";
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, dto.getUser_id());
					
				result = pstmt.executeUpdate(); // 1
				} else {
					// 비밀번호 오류
					result = 0;
					
				}
			}else {
				// 비회원
				result = -1;
		
			}	
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		System.out.println(result);
		return result;
		
	} // 회원 탈퇴
	
	
	
	// 6. 회원 리뷰 정보 모두 가져가기
	public List<ReivewDTO> getReviewAll(String user_id, int startRow, int pageSize) {
		
		List<ReivewDTO> reviewList = new ArrayList<ReivewDTO>();
		
		try {
			con = getCon();
			sql = "select re.review_num, r.name, re.grade, re.regdate, re.content from restaurant r "
					+ " join review re on r.rest_id  = re.rest_id where re.user_id = ?"
					+ " order by owner_user_id limit ?,?" ;
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setInt(2, startRow-1);
			pstmt.setInt(3, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReivewDTO dto = new ReivewDTO();
				
				dto.setReview_num(rs.getInt("review_num"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getTimestamp("regdate"));
				dto.setName(rs.getString("name"));
				dto.setGrade(rs.getInt("grade"));
				
				reviewList.add(dto);
			} // while
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return reviewList;
	}
	
	//
	public List<ReivewDTO> getReviewAll(String id) {
		List<ReivewDTO> reviewList = new ArrayList<ReivewDTO>();
		try {
			con = getCon();
			sql = "select re.review_num, r.name, r.grade, re.regdate, re.content from restaurant r "
					+ " join review re on r.rest_id  = re.rest_id where re.user_id = ?" ;
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReivewDTO dto = new ReivewDTO();
				
				dto.setReview_num(rs.getInt("review_num"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getTimestamp("regdate"));
				dto.setName(rs.getString("name"));
				dto.setGrade(rs.getInt("grade"));
				
				reviewList.add(dto);
			} // while
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return reviewList;
	}
	
	// 6-1. 회원의 리뷰 정보 총 개수
	public int getReviewCount(String user_id) {
		
		int result = 0;
		
		try {
			con = getCon();
			
			sql = "SELECT count(*) FROM review WHERE user_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
			
			System.out.println("내가 작성한 리뷰의 총 개수 : " + result);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return result;
	}
	
	// 6-2. 리뷰 수정버튼 클릭시 해당 리뷰정보 가져가기
	public ReivewDTO getReview(String id, int review_num) {
		ReivewDTO dto = null;
		try {
			// 1.2. 디비연결
			con = getCon();
			// 3. sql & pstmt
			sql = "select re.review_num, r.name, re.grade, re.user_id, re.content "
					+ "from restaurant r " 
					+ "join review re on r.rest_id  = re.rest_id where re.user_id = ? and re.review_num =?";
			pstmt = con.prepareStatement(sql);
			// ??
			pstmt.setString(1, id);
			pstmt.setInt(2, review_num);
			// 4. sql 실행
			rs = pstmt.executeQuery();
			// 5. 데이터처리
			
			if(rs.next()) {
				dto = new ReivewDTO();
				dto.setReview_num(rs.getInt("review_num"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setName(rs.getString("name"));
				dto.setContent(rs.getString("content"));
				dto.setGrade(rs.getInt("grade"));
			}
			
			System.out.println(" DAO : 회원정보 저장완료! ");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return dto;
		
	}
	
	// 6-3. 리뷰 수정 완료버튼 클릭시 리뷰수정 및 부모창 새로고침
	public int changeReview(String id, int review_num, String newContent, int grade) {
		int result = -1; // -1	0	1
		
		try {
			// 1.2. 디비연결
			con = getCon();
			
			// 3. sql작성 & pstmt 객체
			sql = "select * from review where user_id=?";
			pstmt = con.prepareStatement(sql);
			// ??
			pstmt.setString(1, id);
			
			
			// 4. sql 실행(select)
			rs = pstmt.executeQuery();
			
			// 데이터 처리
			if(rs.next()){
				// 회원
				
					// 3. sql 작성(update) & pstmt 객체
					sql = "update review set content=?, grade=? where review_num =?" ;
					pstmt = con.prepareStatement(sql);
					// ???
					pstmt.setString(1, newContent);
					pstmt.setInt(2, grade);
					pstmt.setInt(3, review_num);
					// 4. sql 실행
					result = pstmt.executeUpdate();
				
			}else {
				// 비회원
				result = -1;
			}
		
				
			System.out.println(" DAO : 회원 비밀번호 수정 완료(" +result +")");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return result;
	
	}
	
	// 6-4. 리뷰 삭제 
	public int deleteReview(String id, int review_num) {
		int result = -1; // -1	0	1
		
		try {
			// 1.2. 디비연결
			con = getCon();
			
			// 3. sql작성 & pstmt 객체
			sql = "select * from review where user_id=?";
			pstmt = con.prepareStatement(sql);
			// ??
			pstmt.setString(1, id);
			
			
			// 4. sql 실행(select)
			rs = pstmt.executeQuery();
			
			// 데이터 처리
			if(rs.next()){
				// 회원
				
					// 3. sql 작성(update) & pstmt 객체
					sql = "delete from review where review_num =?" ;
					pstmt = con.prepareStatement(sql);
					// ???
					pstmt.setInt(1, review_num);
					// 4. sql 실행
					result = pstmt.executeUpdate();
				
			}else {
				// 비회원
				result = -1;
			}
		
			System.out.println(" DAO : 회원 리뷰 삭제 완료(" +result +")");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return result;
	
	}
	
	// 6-5. 내가 찜한 가게의 수
	public int getLikeRestCount(String user_id) {
			
		int result = 0;
		
		try {
			con = getCon();
			
			// sql작성 & pstmt객체
			sql = "SELECT count(*) FROM heart WHERE heart_check=1 and user_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			
			// sql실행
			rs = pstmt.executeQuery();
			
		    // 데이터처리
			if(rs.next()) {
				result = rs.getInt(1);
			}
			System.out.println("DAO : 전체 좋아요 한 가게의 수 - " + result);
				
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}

		return result;
	}
	
	// 6-6. 점주의 rest_id 알아내기
	public String getRest_id(String user_id) {
		
		String rest_id = null;
		
		try {
			con = getCon();
			
			sql = "select rest_id from restaurant where owner_user_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				rest_id = rs.getString("rest_id");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return rest_id;
	}
	
	
	
	// 7-1. 멤버 현재 대기중인 가게 대기번호
	public WaitingDTO getWaiting(String id) {
		WaitingDTO dto = null;
		try {
			// 1.2. 디비연결
			con = getCon();
			// 3. sql & pstmt
			sql ="select w.wait_num, w.rest_id, r.name from waiting w "
					+ " join restaurant r on w.rest_id = r.rest_id where w.user_id = ? "
					+ " and w.status ='1'";
			pstmt = con.prepareStatement(sql);
			// ??
			pstmt.setString(1, id);
			// 4. sql 실행
			rs = pstmt.executeQuery();
			// 5. 데이터처리
			
			if(rs.next()) {
				dto = new WaitingDTO();
				dto.setWait_num(rs.getInt("wait_num"));
				dto.setRest_id(rs.getString("w.rest_id"));
				dto.setRest_name(rs.getString("r.name"));
			}
//			
//			sql = "select count(wait_num) from waiting where rest_id =? "
//					+ " and wait_num <=(select wait_num from waiting where "
//					+ " user_id = ? and status = '1')";
//			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, dto.getRest_id());
//			pstmt.setString(2, id);
//			rs = pstmt.executeQuery();
//			if (rs.next()) {
//				dto.setWait_num(rs.getInt(1));
//			}
//			
			System.out.println(" DAO : 회원정보 저장완료! ");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return dto;
		
	}
	
	// 7-1. 멤버 현재 대기중인 가게 대기팀 수
		public WaitingDTO getQueue(String rest_id, String user_id) {
			WaitingDTO dto = null;
			try {
				// 1.2. 디비연결
				con = getCon();
				// 3. sql & pstmt
				sql = "select count(wait_num) from waiting where "
						+ " rest_id = ? and status ='1' and wait_num < "
						+ " (select wait_num from waiting where user_id = ? and status = '1')";
				pstmt = con.prepareStatement(sql);
				// ??
				pstmt.setString(1, rest_id);
				pstmt.setString(2, user_id);
				// 4. sql 실행
				rs = pstmt.executeQuery();
				// 5. 데이터처리
				
				if(rs.next()) {
					dto = new WaitingDTO();
					dto.setWait_team(rs.getInt(1));
				}
				
				System.out.println(" DAO : 회원정보 저장완료! ");
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			
			return dto;
			
		}
	
	// 7-2. 멤버 대기내역
	public List<WaitingDTO> getMemberQueueHistory(String user_id, int startRow, int pageSize) {
		
		List<WaitingDTO> queueHistory = new ArrayList<WaitingDTO>();
		
		try {
			// 1.2. 디비연결
			con = getCon();
			// 3. sql & pstmt
			sql = "select w.user_id,r.name, w.regdate, w.wait_num, w.review_check from waiting w join restaurant r on w.rest_id = r.rest_id "
					+ " where w.user_id=? and w.status=2"
					+ " order by owner_user_id limit ?,?";
			pstmt = con.prepareStatement(sql);
			// ??
			pstmt.setString(1, user_id);
			pstmt.setInt(2, startRow-1);
			pstmt.setInt(3, pageSize);
			// 4. sql 실행
			rs = pstmt.executeQuery();
			// 5. 데이터처리
			
			
			while(rs.next()) {
				WaitingDTO dto = new WaitingDTO();
				
				dto.setRest_name(rs.getString("name"));
				dto.setRegdate(rs.getTimestamp("regdate"));
				dto.setWait_num(rs.getInt("wait_num"));
				dto.setReview_check(rs.getInt("review_check"));
				queueHistory.add(dto);
			} // while
			
			System.out.println(" DAO : 대기리스트 저장완료! ");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return queueHistory;
		
	}
	
	// 7-3. 맴버 대기 취소
	public int memberCancelWaiting(WaitingDTO dto) {
		int result = -1; // -1	0	1
		
		System.out.println(dto.getUser_id());
		System.out.println(dto.getWait_num());
		
		try {
			// 1.2. 디비연결
			con = getCon();
			
			// 3. sql작성 & pstmt 객체
			sql = "select wait_num from waiting where user_id = ? and status =1";
			pstmt = con.prepareStatement(sql);
			// ??
			pstmt.setString(1, dto.getUser_id());
			
			// 4. sql 실행(select)
			rs = pstmt.executeQuery();
			
			// 데이터 처리
			if(rs.next()){
				// 회원
				if(dto.getWait_num() == (rs.getInt("wait_num"))){
					// 본인(아이디, 대기번호 동일)
					System.out.println(rs.getInt("wait_num"));
					// 3. sql 작성(update) & pstmt 객체
					sql = "update waiting set status=3 where wait_num=?" ;
					pstmt = con.prepareStatement(sql);
					// ???
					pstmt.setInt(1, dto.getWait_num());
					
					// 4. sql 실행
					result = pstmt.executeUpdate();
					
				} else {
					// 대기번호 다름
					result = 0;
					
				}
			}else {
				// 비회원
				result = -1;
			}
				
			System.out.println(" DAO : 회원 대기번호 취소 완료!(" +result +")");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return result;
	}
	
	// 7-4. 멤버 과거 대기 내역 총 개수
	public int getWaitingListBeforeCount(String user_id) {
		
		int result = 0;
		
		try {
			con = getCon();
			
			sql = "SELECT count(*) FROM waiting WHERE status=2 AND user_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return result;
	}
	
	
	
	// 8. 회원 찜한 가게 리스트 가져가기
		public List<RestaurantDTO> getMemberLikeList(String user_id, int startRow, int pageSize) {
			
			List<RestaurantDTO> likeList = new ArrayList<RestaurantDTO>();
			
			try {
				con = getCon();
				
				sql = "select rest_id, name, rest_tel, descriptions from restaurant where rest_id "
						+ "in (select rest_id from heart where heart_check =1 and user_id =? ) "
						+ "order by owner_user_id limit ?,?";
				
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, user_id);
				pstmt.setInt(2, startRow-1);
				pstmt.setInt(3, pageSize);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					RestaurantDTO dto = new RestaurantDTO();
					dto.setRest_id(rs.getString(1));
					dto.setName(rs.getString(2));
					dto.setRest_tel(rs.getString(3));
					dto.setDescriptions(rs.getString(4));
					
					likeList.add(dto);
				} // while
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			
			return likeList;
		}
		
	// 9.회원 리뷰 작성 시 해당 가게 정보 가져가기
	public WaitingDTO getWaitRestaurant(int wait_num) {
		WaitingDTO dto = null;
		try {
			con = getCon();
			sql = "select w.rest_id, r.name from waiting w join restaurant r on "
					+ " w.rest_id = r.rest_id where wait_num =?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,wait_num);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				dto = new WaitingDTO();
				dto.setRest_name(rs.getString("name"));
				dto.setRest_id(rs.getString("rest_id"));
				dto.setWait_num(wait_num);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return dto;
		
	}
	
	// 10. 회원 리뷰 작성 정보 디비에 저장
	public void reviewWriteAction(ReivewDTO dto) {
		try {
			// 1,2 디비연결
			con = getCon();
			// 3 sql문 작성
			sql = "insert into review (user_id, content, regdate, rest_id, wait_num, grade) values "
					+ " (?,?,now(),?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getUser_id());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getRest_id());
			pstmt.setInt(4, dto.getWait_num());
			pstmt.setInt(5, dto.getGrade());
			
	  	    // 4. sql 실행
			pstmt.executeUpdate();
			System.out.println("DAO : 리뷰 작성 성공!");
			
			sql = "update waiting set review_check=2 where wait_num=?"; 
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getWait_num());
			// sql 실행
			pstmt.executeUpdate();
			
			System.out.println("DAO : 리뷰 작성 후 대기리스트 리뷰작성 버튼 없애기");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeDB();
		}
	
	}
	
	
	
	
	/* ================== < 회원 관련 메서드 > ======================== */
	
	
	
	/* ================ < 메인페이지 관련 메서드 > ===================== */
	
  
  // 1. 공지사항 게시판 글쓰기
	public void insertNotice(NoticeDTO dto){
		
		try {
			// DB연결
			con = getCon();
			
			// 정보저장 & 글쓰기
			sql = "insert into notice (subject, content, regdate)"
					+ " values(?, ?, now())";
			pstmt = con.prepareStatement(sql);
			
			// value작성
			pstmt.setString(1, dto.getSubject());
			pstmt.setString(2, dto.getContent());
			
			// sql실행
			pstmt.executeUpdate();
			System.out.println("글쓰기 완료!");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
	}
  
  
  
  // 1-1. 공지사항 전체 글 개수
	public int getBoardCount() {
		
		int result = 0;
		
		try {
			con = getCon();
			
			// sql작성 & pstmt객체
			sql = "select count(*) from notice";
			pstmt = con.prepareStatement(sql);
			
			// sql실행
			rs = pstmt.executeQuery();
			
		    // 데이터처리
			if(rs.next()) {
				result = rs.getInt(1);
			}
			System.out.println("DAO : 전체 글 개수 - " + result);
				
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}

		return result;
	}
	
	// 1-2. 점주 - 대기 예약 전체 개수
	public int getWaitingCount(String rest_id) {
		
		int result = 0;
		
		try {
			con = getCon();
			
			// sql작성 & pstmt객체
			sql = "select count(*) from waiting where rest_id=? and status=1";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, rest_id);
			
			// sql실행
			rs = pstmt.executeQuery();
			
		    // 데이터처리
			if(rs.next()) {
				result = rs.getInt(1);
			}
			System.out.println("DAO : 전체 대기 내역 수 - " + result);
				
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}

		return result;
	}
	
	
	
	// 2. 공지사항 게시글 출력 (페이징처리)
	public List<NoticeDTO> getNoticeList(int startRow, int pageSize) {
		
		List<NoticeDTO> noticeList = new ArrayList<NoticeDTO>();
		
		try {
			con = getCon();
			
			sql = "select * from notice order by notice_num desc limit ?,?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				NoticeDTO dto = new NoticeDTO();
				// while문을 한 바퀴 돌 때마다 객체 새로 생성, 아래 데이터를 저장
				
				dto.setNotice_num(rs.getInt("notice_num"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getTimestamp("regdate"));
				
				noticeList.add(dto);
			}
			
			System.out.println("게시판 글 정보 모두 저장 완료");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return noticeList;
	}
  
  
  
  // 3. 공지사항 게시글 내용 보기
	public NoticeDTO getNoticeContent(int notice_num) {
		
		NoticeDTO dto = null;
		
		try {
			con = getCon();
			
			sql = "select * from notice where notice_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, notice_num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new NoticeDTO();
				
				dto.setNotice_num(rs.getInt("notice_num"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getTimestamp("regdate"));
				
				System.out.println(notice_num + "번 글 정보 저장완료.");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			closeDB();
		}
		
		return dto;
	}
	
	
	
	// 4. 공지수항 게시글 수정
	public void updateNoticeContent(NoticeDTO dto) {
		
		try {
			con = getCon();
			
			sql = "update notice set subject=?, content=? where notice_num=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getSubject());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getNotice_num());
			
			pstmt.executeUpdate();
			
			System.out.println("글 수정 완료!");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}

	}
	
	
	
	// 5. 공지사항 게시글 삭제
	public void deleteNoticeContent(NoticeDTO dto) {
		
		try {
			con = getCon();
			
			sql = "delete from notice where notice_num=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getNotice_num());
			
			pstmt.executeUpdate();
			
			System.out.println("글 삭제 완료!");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}
  
  
  
  // 6. faq 리스트 가져가기
  public List<FaqDTO> getFaqList() {

  List<FaqDTO> faqList = new ArrayList<FaqDTO>();

  try {
    con = getCon();

    sql = "select * from faq";
    pstmt = con.prepareStatement(sql);

    rs = pstmt.executeQuery();

    while(rs.next()) {
      FaqDTO dto = new FaqDTO();
      // while문을 한 바퀴 돌 때마다 객체 새로 생성, 아래 데이터를 저장

      dto.setFaq_num(rs.getInt("faq_num"));
      dto.setCategory(rs.getString("category"));
      dto.setSubject(rs.getString("subject"));
      dto.setContent(rs.getString("content"));

      faqList.add(dto);
    }

    System.out.println("faq 글 정보 모두 저장 완료");

  } catch (Exception e) {
    e.printStackTrace();
  } finally {
    closeDB();
  }

  return faqList;
}

  
  
  
	
	
	
	
	
	/* ================ < 메인페이지 관련 메서드 > ===================== */
	
	
	
	/* ================== < 가게 리스트 > ======================== */

	
		public List<RestaurantDTO> getlistForm() {
			List<RestaurantDTO> listForm = new ArrayList<RestaurantDTO>();
			
			try {
				con = getCon();
				sql = "select * from restaurant where status = 1";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					RestaurantDTO dto = new RestaurantDTO();
					dto.setRest_tel(rs.getString("rest_tel"));
					dto.setName(rs.getString("name"));
					dto.setRest_id(rs.getString("rest_id"));
					dto.setConvenience(rs.getString("convenience"));
					dto.setRegdate(rs.getTimestamp("regdate"));
					dto.setDayoff(rs.getString("dayoff"));
					dto.setOwner_user_id(rs.getString("owner_user_id"));
					listForm.add(dto);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			
			return listForm;
		}

		
		public List<RestaurantDTO> getListInfo(int startRow, int pageSize) {
			List<RestaurantDTO> listForm = new ArrayList<RestaurantDTO>();
			
			try {
				con = getCon();
				sql = "select * from restaurant where status = 1 order by regdate desc limit ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, startRow - 1);
				pstmt.setInt(2, pageSize);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					RestaurantDTO dto = new RestaurantDTO();
					dto.setRest_tel(rs.getString("rest_tel"));
					dto.setName(rs.getString("name"));
					dto.setRest_id(rs.getString("rest_id"));
					dto.setConvenience(rs.getString("convenience"));
					dto.setRegdate(rs.getTimestamp("regdate"));
					dto.setDayoff(rs.getString("dayoff"));
					dto.setLike_num(rs.getInt("like_num"));
					
					listForm.add(dto);
					
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			
			return listForm;
		}
		
		// getListCount()
		public int getListCount() {
			int result = 0;
			
			try {
				con = getCon();
				sql = "select count(*) from restaurant where status = 1";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					result = rs.getInt(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			
			return result;
		} // getListCount()
		
		public RestaurantDTO getRestaurantForm(String rest_id) {
			RestaurantDTO dto = null;
			
			try {
				con = getCon();
				sql = "select * from restaurant where rest_id = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, rest_id);
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
					dto.setGrade(rs.getInt("grade"));
					dto.setLike_num(rs.getInt("like_num"));
					dto.setName(rs.getString("name"));
					dto.setOn_off(rs.getBoolean("on_off"));
					dto.setOwner_user_id(rs.getString("owner_user_id"));
					dto.setRead_count(rs.getInt("read_count"));
					dto.setRegdate(rs.getTimestamp("regdate"));
					dto.setRest_id(rs.getString("rest_id"));
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
		
		// 상호명 검색 + 지역 필터 - getListCount(search, addr)
		public int getListCount(String search, String addr_city, String addr_district) {
			int result = 0;
			
			try {
				con = getCon();
				sql = "select count(*) from restaurant where name like ? and addr_city = ? and addr_district = ? and status = 1";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + search + "%");
				pstmt.setString(2, addr_city);
				pstmt.setString(3, addr_district);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					result = rs.getInt(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			
			return result;
		}
		// 상호명 검색 + 지역 필터 - getListCount(search, addr)
		
		// 상호명 검색 + 지역 필터 페이징 처리
		public List<RestaurantDTO> getListInfo(int startRow, int pageSize, String search, String addr_city, String addr_district) {
			List<RestaurantDTO> listForm = new ArrayList<RestaurantDTO>();
			
			try {
				con = getCon();
				sql = "select * from restaurant where name like ? and addr_city = ? and addr_district = ? and status = 1 "
						+ "order by regdate desc limit ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + search + "%");
				pstmt.setString(2, addr_city);
				pstmt.setString(3, addr_district);
				pstmt.setInt(4, startRow - 1);
				pstmt.setInt(5, pageSize);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					RestaurantDTO dto = new RestaurantDTO();
					dto.setRest_tel(rs.getString("rest_tel"));
					dto.setName(rs.getString("name"));
					dto.setRest_id(rs.getString("rest_id"));
					dto.setConvenience(rs.getString("convenience"));
					dto.setRegdate(rs.getTimestamp("regdate"));
					dto.setDayoff(rs.getString("dayoff"));
					listForm.add(dto);
					
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			
			return listForm;
		}
		// 상호명 검색 + 지역 필터 페이징 처리
		
		public RestaurantDTO getRestrauntForm(String rest_id) {
			RestaurantDTO dto = null;
			WaitingDTO wdto = null;
			
			try {
				con = getCon();
				sql = "select * from restaurant where rest_id = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, rest_id);
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
					dto.setGrade(rs.getInt("grade"));
					dto.setLike_num(rs.getInt("like_num"));
					dto.setName(rs.getString("name"));
					dto.setOn_off(rs.getBoolean("on_off"));
					dto.setOwner_user_id(rs.getString("owner_user_id"));
					dto.setRead_count(rs.getInt("read_count"));
					dto.setRegdate(rs.getTimestamp("regdate"));
					dto.setRest_id(rs.getString("rest_id"));
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
		
		// 유저 좋아요 상태 1(꽉찬하트)로 변경
		public void userHeartAdd(String user_id, String rest_id) {
			
			try {
				con = getCon();
				sql = "select heart_check from heart where user_id =? and rest_id= ?";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, user_id);
				pstmt.setString(2, rest_id);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					// 유저 상태 변환
					sql = "update heart set heart_check=1 where user_id=? and rest_id = ?";
					pstmt = con.prepareStatement(sql);
					// ???
					pstmt.setString(1, user_id);
					pstmt.setString(2, rest_id);
					
					// 4. sql 실행
					pstmt.executeUpdate();
					
					// 가게 상태 변환
					sql = "update restaurant set like_num = like_num+1 where rest_id=?" ;
					pstmt = con.prepareStatement(sql);
					// ???
					pstmt.setString(1, rest_id);
					
					// 4. sql 실행
					pstmt.executeUpdate();
					
					System.out.println("유저 좋아요 상태 변환");
				} else {
					
					// 유저 상태 변환
					sql = "insert into heart values (1,?,?)";
					pstmt = con.prepareStatement(sql);
					// ???
					pstmt.setString(1, rest_id);
					pstmt.setString(2, user_id);
					
					// 4. sql 실행
					pstmt.executeUpdate();
					
					// 가게 상태 변환
					sql = "update restaurant set like_num = like_num+1 where rest_id=?" ;
					pstmt = con.prepareStatement(sql);
					// ???
					pstmt.setString(1, rest_id);
					
					// 4. sql 실행
					pstmt.executeUpdate();
					
					System.out.println("유저 좋아요 상태 추가");
					
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			
		}	
		// 유저 좋아요 상태 0(빈하트)로 변경
		public void userHeartRemove(String user_id, String rest_id) {
			
			try {
				con = getCon();
				sql = "select heart_check from heart where user_id =? and rest_id= ?";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, user_id);
				pstmt.setString(2, rest_id);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					// 유저 상태 변환
					sql = "update heart set heart_check=0 where user_id=? and rest_id = ?";
					pstmt = con.prepareStatement(sql);
					// ???
					pstmt.setString(1, user_id);
					pstmt.setString(2, rest_id);
					
					// 4. sql 실행
					pstmt.executeUpdate();
					
					// 가게 상태 변환
					sql = "update restaurant set like_num = like_num-1 where rest_id=?" ;
					pstmt = con.prepareStatement(sql);
					// ???
					pstmt.setString(1, rest_id);
					
					// 4. sql 실행
					pstmt.executeUpdate();
					
					System.out.println("유저 좋아요 상태 변환");
				} 
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			
		}
		
		// 유저가 해당 가게 좋아요를 가지고 있는지 확인
		public int getUserHeart(String user_id, String rest_id) {
			int heart_check = 0;
			
			try {
				con = getCon();
				sql = "select heart_check from heart where rest_id =? and user_id =? ";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, rest_id);
				pstmt.setString(2, user_id);
				
				rs = pstmt.executeQuery();
				if(rs.next()) {
					heart_check = rs.getInt(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			System.out.println("DAO : 해당 가게의 유저 좋아요 상태 : " + heart_check);		
			return heart_check;
		} 
		
		
		// 가게 좋아요 수 리턴
		public int getHeart(String rest_id) {
			int result = 0;
			
			try {
				con = getCon();
				sql = "select count(heart_check) from heart where rest_id = ? and heart_check = 1 ";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, rest_id);
				
				rs = pstmt.executeQuery();
				if(rs.next()) {
					result = rs.getInt(1);
				} else {
					result = 0;
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			System.out.println("DAO : 해당 가게의 좋아요 수 : " + result);
			
			return result;
		}


		// -----------------조회수------------------------------

        public void getUpdateReadCount (String rest_id) {


            try {
                con = getCon();
                sql="update restaurant set read_count=read_count+1 "
                        + " where rest_id =?";
                pstmt = con.prepareStatement(sql);
                pstmt.setString(1, rest_id);

                int cnt = pstmt.executeUpdate();

                if (cnt == 1) {
                    System.out.println(" DAO : 글 조회수 1 증가 완료 !");
                }
            } catch (Exception e) {

                e.printStackTrace();
            }finally {
                closeDB();
            }
        }
        
        public List<ReivewDTO> getReview (String rest_id) {
        	List<ReivewDTO> re = new ArrayList<ReivewDTO>();
        	
        	try {
				con=getCon();
				sql = "select user_id,content,file,regdate,grade from review where rest_id=? ";
				 pstmt = con.prepareStatement(sql);
	               pstmt.setString(1, rest_id);
	               rs = pstmt.executeQuery();
	                while (rs.next()) {
	                	ReivewDTO dto = new ReivewDTO();
	                	dto.setGrade(rs.getInt("grade"));
	                	dto.setContent(rs.getString("content"));
	                	dto.setFile(rs.getString("file"));
	                	dto.setUser_id(rs.getString("user_id"));
	                	dto.setRegdate(rs.getTimestamp("regdate"));
	                	re.add(dto);
	                }
	              
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
        	
        	return re ;
        }
        

        // -----------------조회수------------------------------
		
		/* ================== < 가게리스트 > ======================== */

		
		public void getRestaurant(RestaurantDTO dto) {
			try {
				// 1,2 디비연결
				con = getCon();
				// 3 sql문 작성
				sql = "insert into restaurant values(?,?,?,?,?,?,?,?,0,?,false,?,?,?,?,now(),0,0,0,?,?)";
				
				pstmt = con.prepareStatement(sql);
			
				pstmt.setString(1, dto.getRest_id());
				pstmt.setString(2, dto.getName());
				pstmt.setString(3, dto.getDescriptions());
				pstmt.setString(4, dto.getRest_tel());
				pstmt.setString(5, dto.getConvenience());
				pstmt.setString(6, dto.getRuntime());
				pstmt.setString(7, dto.getRest_notice());
				pstmt.setString(8, dto.getDayoff());
				pstmt.setString(9, dto.getOwner_user_id());
				pstmt.setString(10, dto.getCategory());
				pstmt.setString(11, dto.getAddr_city());
				pstmt.setString(12, dto.getAddr_district());
				pstmt.setString(13, dto.getAddr_etc());
				pstmt.setString(14, dto.getOutfile());
				pstmt.setString(15, dto.getInfile());
		  	    // 4. sql 실행
				pstmt.executeUpdate();
				System.out.println("DAO 레스토랑 정보 저장 성공");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeDB();
			}
		
		} //gereatlist
		
		public void getRestaurantMenu(Restaurant_menuDTO menudto) {
			Restaurant_menuDTO dto = new Restaurant_menuDTO();
			
			try {
				 //1,2 DB연결
				con = getCon();
				
				// 3. sql 작성
				sql = "insert into restaurant_menu (menufile,menu_name,menu_descriptions,price,rest_id) "
						+ " values(?,?,?,?,?)";
				
				pstmt= con.prepareStatement(sql);
				pstmt.setString(1, menudto.getMeunfile());
				pstmt.setString(2, menudto.getMenu_name());
				pstmt.setString(3, menudto.getMenu_descriptions());
				pstmt.setString(4, menudto.getPrice());
				pstmt.setString(5, menudto.getRest_id());
				//4. sql실행
				pstmt.executeUpdate();
				
				System.out.println("DAO 레스토랑 메뉴 정보 저장 성공");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				closeDB();
			}
			 
		}
		
		
		
		// 대기 번호 생성 후 번호 반환 - getWaitingNum()
		public void getWaitingNum(String user_id, String rest_id, int people) {
			try {
				con = getCon();
				
				// 대기 번호 계산
				int wait_num = 0;
				sql = "select max(wait_num) from waiting";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					wait_num = rs.getInt(1) + 1;
				}
				
				sql = "insert into waiting (wait_num, user_id, rest_id, people, status, regdate) "
						+ " values (?, ?, ?, ?, 1, now())";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, wait_num);
				pstmt.setString(2, user_id);
				pstmt.setString(3, rest_id);
				pstmt.setInt(4, people);
				
				pstmt.executeUpdate();
				
				System.out.println("DAO : 대기번호 발급 성공");
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			
		}
		// 대기 번호 생성 - getWaitingNum()
		
		
		
		// 회원id와 가게id, status가 1인 대기 번호가 있는지 확인 - getWaitingCheck()
		public WaitingDTO getWaitingCheck(String user_id, String rest_id) {
			WaitingDTO dto = null;
			
			try {
				con = getCon();
				sql = "select * from waiting where user_id = ? and rest_id = ? and status = 1";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, user_id);
				pstmt.setString(2, rest_id);
				
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					dto = new WaitingDTO();
					dto.setWait_num(rs.getInt("wait_num"));
					dto.setUser_id(rs.getString("user_id"));
					dto.setRest_id(rs.getString("rest_id"));
					dto.setStatus(rs.getInt("status"));
					dto.setRegdate(rs.getTimestamp("regdate"));
					dto.setPeople(rs.getInt("people"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			
			return dto;
		}
		// 회원id와 가게id, status가 1인 대기 번호가 있는지 확인 - getWaitingCheck()
		
		public RestaurantDTO getRestaurantallow(String user_id) {
			RestaurantDTO dto = null;
			
		    try {
		    	// 1,2 디비연결
		    	con = getCon();
		 
		     	// sql 연결
      		    sql = "select * from restaurant where owner_user_id=? " ;
      		    pstmt = con.prepareStatement(sql);
      		    pstmt.setString(1,user_id);
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
    				dto.setGrade(rs.getInt("grade"));
    				dto.setLike_num(rs.getInt("like_num"));
    				dto.setName(rs.getString("name"));
    				dto.setOn_off(rs.getBoolean("on_off"));
    				dto.setOwner_user_id(rs.getString("owner_user_id"));
    				dto.setRead_count(rs.getInt("read_count"));
    				dto.setRegdate(rs.getTimestamp("regdate"));
    				dto.setRest_id(rs.getString("rest_id"));
    				dto.setRest_notice(rs.getString("rest_notice"));
    				dto.setRest_tel(rs.getString("rest_tel"));
    				dto.setRuntime(rs.getString("runtime"));
    				dto.setStatus(rs.getInt("status"));
    				dto.setOutfile(rs.getString("outfile"));
    				dto.setInfile(rs.getString("infile"));
      		    }
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeDB();
			}
		    return dto;
		}
		
		public Restaurant_menuDTO getRestaurantmenuallow(String rest_id) {
			Restaurant_menuDTO dto = null;
			 try {
				 // 1, 2 디비연결
				con = getCon();
			    // 3. sql문 작성
				
				sql= "select * from restaurant_menu where rest_id=?";
			    pstmt = con.prepareStatement(sql);
      		    pstmt.setString(1,rest_id);
      		    rs = pstmt.executeQuery();
      		    if(rs.next()) {
      		    	dto = new Restaurant_menuDTO();
      		    	dto.setMenu_descriptions(rs.getString("menu_descriptions"));
      		    	dto.setMenu_name(rs.getString("menu_name"));
      		    	dto.setPrice(rs.getString("price"));
      		    	dto.setRest_id(rs.getString("rest_id"));
      		    	dto.setMeunfile(rs.getString("menufile"));
      		    }
			  
			} catch (Exception e) {
				
				e.printStackTrace();
			}finally {
				closeDB();
			}
			return dto;
		}
		
		public void getRestaurantUpdate(RestaurantDTO restal) {
		
			
			try {
				// 1,2 디비연결 
				con = getCon();
				// 3.sql문작성
				sql ="update restaurant set name=?, convenience=?, dayoff=?, runtime=?, descriptions=? "
						+ " where owner_user_id = ?";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, restal.getName());
				pstmt.setString(2, restal.getConvenience());
				pstmt.setString(3, restal.getDayoff());
				pstmt.setString(4, restal.getRuntime());
				pstmt.setString(5, restal.getDescriptions());
				pstmt.setString(6, restal.getOwner_user_id());
				
				pstmt.executeUpdate();
				
			} catch (Exception e) {
				
				e.printStackTrace();
			}finally {
				closeDB();
			}

		}
		//getRestaurantallow

		// 점주 - 가게 대기 내역 불러오기
		public List getWaitingList(String owner_user_id, int startRow, int pageSize) {
			
			List waitingList = new ArrayList();
			
			try {
				con = getCon();
				
				sql = "SELECT w.status, w.rest_id, w.wait_num, u.name, u.phone, w.people, w.regdate FROM waiting w "
						+ "JOIN USER u "
						+ "ON u.user_id = w.user_id "
						+ "WHERE rest_id = (SELECT rest_id "
						+ "                 FROM restaurant "
						+ "                 WHERE owner_user_id = ?) and w.status = 1 "
						+ "order by w.wait_num limit ?,?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, owner_user_id);
				pstmt.setInt(2, startRow-1);
				pstmt.setInt(3, pageSize);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					WaitingDTO dto = new WaitingDTO();
					dto.setRest_id(rs.getString("rest_id"));
					dto.setWait_num(rs.getInt("wait_num"));
					dto.setName(rs.getString("name"));
					dto.setPhone(rs.getString("phone"));
					dto.setPeople(rs.getInt("people"));
					dto.setRegdate(rs.getTimestamp("regdate"));
					dto.setStatus(rs.getInt("status"));
					waitingList.add(dto);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			
			System.out.println("M : 대기 예약 내역 저장 완료.");
			return waitingList;
			
		}
		
		

		// 점주의 마이페이지 - 대기관리 - 완료버튼 데이터처리
		public void waitingDone(int wait_num) {
			
			try {
				con = getCon();
				
				sql = "update waiting set status=2 where wait_num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, wait_num);
				
				pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
		}

		
		// 점주의 가게 on_off 업데이트 - updateRestOnOff(on_off)
		public void updateRestOnOff(String rest_id, String onoff) {
			int on_off = onoff.equals("true") ? 0 : 1;
			System.out.println(rest_id);
			try {
				con = getCon();
				sql = "update restaurant set on_off = ? where rest_id = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, on_off);
				pstmt.setString(2, rest_id);
				
				pstmt.executeUpdate();
				System.out.println(" DAO : on_off 변경 완료");
				System.out.println(" DAO : on_off 상태 = " + on_off);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			
			
		}
		
		// 점주 - 마이페이지 - 리뷰관리
		public List<ReivewDTO> OwnergetReview(String user_id, int startRow, int pageSize) {
			List<ReivewDTO> reviewList = new ArrayList<ReivewDTO>();
			try {
				System.out.println(user_id);
			    // 1,2 디비연결
				con = getCon();
				// sql 작성
				sql = "select * from review r where rest_id = (select rest_id from restaurant where owner_user_id = ?)"
						+ " order by user_id limit ?,?";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1,user_id);
				pstmt.setInt(2,startRow-1);
				pstmt.setInt(3,pageSize);
				
				rs = pstmt.executeQuery();
				
                while(rs.next()) {
                ReivewDTO dto = new ReivewDTO();
                 dto.setUser_id(rs.getString("user_id"));
                 dto.setContent(rs.getString("content"));
                 dto.setRegdate(rs.getTimestamp("regdate"));
                 dto.setGrade(rs.getInt("grade"));
                 dto.setWait_num(rs.getInt("wait_num"));
                 
                 reviewList.add(dto);
                }
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				closeDB();
			}
			return reviewList;
			
		}
		
		// 점주 -  내 가게의 총 리뷰 개수
		public int getOwnerReviewCount(String rest_id) {
			 int result = 0;
			     
			 try {
				 //1,2 디비연결
				con = getCon();
				
				// 3 sql 실행
				//sql = "SELECT count(*) FROM heart WHERE heart_check=1 and user_id=?";
				sql = "select count(*) from review where rest_id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, rest_id);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					result =rs.getInt(1);
				}
				
				
				 
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				closeDB();
			}
			
			 return  result;
			
		}
		
		public void OwnergetNotice(String rest_notice, String rest_id) {
			
			try {
				// 1,2 연결
				con = getCon();
				// 3 sql 실행
				if(rest_notice == null) {
					sql ="insert into restaurant (rest_notice)"
							+ "values(?) where rest_id=? ";
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, rest_notice);
					pstmt.setString(2, rest_id);
					pstmt.executeUpdate();
					System.out.println("공지사항쓰기 완료!");
			     }else {
			    	 sql="update restaurant set rest_notice=? where rest_id=? ";
			    	 
			    	 pstmt = con.prepareStatement(sql);
			    	 
			    	 pstmt.setString(1,rest_notice);
			    	 pstmt.setString(2, rest_id);
			    	 pstmt.executeUpdate();
			    	 System.out.println("공지사항쓰기 완료!");
			     }
				
			}catch (Exception e) {
					e.printStackTrace();
				}
			finally {
				closeDB();
			}
		}
		
		public int deleteRestaurant(String user_id,String pw) {
			 int result = -1;
			  try {
				  // 1,2 디비연결
				  con = getCon();
				  sql = "select pw from user where user_id=?";
				  
				  pstmt = con.prepareStatement(sql);
				  pstmt.setString(1, user_id);  
				  rs = pstmt.executeQuery();
				  
				  if(rs.next()) {
					//id 같음
		            	if(pw.equals(rs.getString("pw"))) {
		            		// 비밀번호도 같음
		            		sql ="delete from restaurant where owner_user_id=?";
		            		pstmt = con.prepareStatement(sql);
		            		pstmt.setString(1,user_id);
		            		result = pstmt.executeUpdate();
		            	}else {
		            		 result =0;
		            	}
		            }else {
		            	result = -1;
		            }
		            System.out.println("DAO : 삭제완료 " + result);  

				  
			     } catch (Exception e) {
				
				e.printStackTrace();
			}finally {
				closeDB();
			}
			
			return result;
		}
		// 점주의 가게 on_off 업데이트 - updateRestOnOff(on_off)
		
		// 점주 메뉴 리스트
		public List<Restaurant_menuDTO> getOwnerMenuList(String id) {
			List<Restaurant_menuDTO> menuList = new ArrayList<Restaurant_menuDTO>();
			try {
				con = getCon();
				sql = "select * from restaurant_menu where rest_id =(select rest_id from restaurant where owner_user_id = ?)";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					Restaurant_menuDTO dto = new Restaurant_menuDTO();
					dto.setRest_menu_num(rs.getInt(1));
					dto.setMenu_name(rs.getString(2));
					dto.setMenu_descriptions(rs.getString(3));
					dto.setPrice(rs.getString(4));
					dto.setRest_id(rs.getString(5));
					dto.setMeunfile(rs.getString(6));
					
					menuList.add(dto);
				} // while
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			
			return menuList;
		}
		
		// 점주 메뉴 수정 버튼 클릭 시 기존 정보 가져가기
		public Restaurant_menuDTO getMenu(int review_num) {
			Restaurant_menuDTO dto = null;
			try {
				// 1.2. 디비연결
				con = getCon();
				// 3. sql & pstmt
				sql = "select * from restaurant_menu where rest_menu_num = ?";
				pstmt = con.prepareStatement(sql);
				// ??
				pstmt.setInt(1, review_num);
				// 4. sql 실행
				rs = pstmt.executeQuery();
				// 5. 데이터처리
				
				if(rs.next()) {
					dto = new Restaurant_menuDTO();
					dto.setRest_menu_num(rs.getInt(1));
					dto.setMenu_name(rs.getString(2));
					dto.setMenu_descriptions(rs.getString(3));
					dto.setPrice(rs.getString(4));
					dto.setRest_id(rs.getString(5));
					dto.setMeunfile(rs.getString(6));				
					}
				
				System.out.println(" DAO : 해당 메뉴 저장완료! ");
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			
			return dto;
		}
		
		// 점주 메뉴 수정 
		public void OwnerMenuUpdate(Restaurant_menuDTO dto) {
			try {
				// 1.2. 디비연결
				con = getCon();
				// 3. sql & pstmt
				sql = "select * from restaurant_menu where rest_menu_num = ?";
				pstmt = con.prepareStatement(sql);
				// ??
				pstmt.setInt(1, dto.getRest_menu_num());
				// 4. sql 실행
				rs = pstmt.executeQuery();
				// 5. 데이터처리
				
				if(rs.next()) {
					sql = "update restaurant_menu set menu_name =?, menu_descriptions =?, "
							+ " price =?, menufile = ? where rest_menu_num =?";
					pstmt = con.prepareStatement(sql);
					// ??
					pstmt.setString(1, dto.getMenu_name());
					pstmt.setString(2, dto.getMenu_descriptions());
					pstmt.setString(3, dto.getPrice());
					pstmt.setString(4, dto.getMeunfile());
					pstmt.setInt(5, dto.getRest_menu_num());
					// 4. sql 실행
					pstmt.executeUpdate();
					// 5. 데이터처리
				}
				
				System.out.println(" DAO : 메뉴 수정 완료!! ");
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
		}
		
		// 점주 메뉴 삭제
		public int deleteMenu(int rest_menu_num) {
			int result = -1; // -1	0	1
			
			try {
				// 1.2. 디비연결
				con = getCon();
				
				// 3. sql작성 & pstmt 객체
				sql = "select * from restaurant_menu where rest_menu_num=?";
				pstmt = con.prepareStatement(sql);
				// ??
				pstmt.setInt(1, rest_menu_num);
				
				// 4. sql 실행(select)
				rs = pstmt.executeQuery();
				
				// 데이터 처리
				if(rs.next()){
					// 회원
					
						// 3. sql 작성(update) & pstmt 객체
						sql = "delete from restaurant_menu where rest_menu_num =?" ;
						pstmt = con.prepareStatement(sql);
						// ???
						pstmt.setInt(1, rest_menu_num);
						// 4. sql 실행
						result = pstmt.executeUpdate();
					
				}else {
					// 비회원
					result = -1;
				}
			
				System.out.println(" DAO : 점주 메뉴 삭제 완료(" +result +")");
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			return result;
		
		}

		
		/* ================== < 가게리스트 > ======================== */
		
	
	

}