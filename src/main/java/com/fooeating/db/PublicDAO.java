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
		}
		
		return result;
	}
	// 관리자 - 입점 가게수 getRestaurantCount() 
	
	
	
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
		public int getRestaurantStatus(int rest_id) {
			int result = 0;
			
			try {
				con = getCon();
				sql = "update restaurant set status = 1 where rest_id = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, rest_id);
				
				result = pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
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
	


	// 회원 탈퇴
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
	
	// 회원 리뷰 정보 모두 가져가기
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
	
	// 리뷰 수정버튼 클릭시 해당 리뷰정보 가져가기
	public ReivewDTO getReview(String id, int review_num) {
		ReivewDTO dto = null;
		try {
			// 1.2. 디비연결
			con = getCon();
			// 3. sql & pstmt
			sql = "select re.review_num, r.name, r.grade, re.user_id, re.content "
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
	
	// 리뷰 수정 완료버튼 클릭시 리뷰수정 및 부모창 새로고침
	public int changeReview(String id, int review_num, String newContent) {
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
					sql = "update review set content=? where review_num =?" ;
					pstmt = con.prepareStatement(sql);
					// ???
					pstmt.setString(1, newContent);
					pstmt.setInt(2, review_num);
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
	
	// 리뷰 삭제 
	
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
  
  
  
  // 1-1. 전체 글 개수
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
				sql = "select * from restaurant";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					RestaurantDTO dto = new RestaurantDTO();
					dto.setRest_tel(rs.getString("rest_tel"));
					dto.setName(rs.getString("name"));
					dto.setRest_id(rs.getInt("rest_id"));
					dto.setConvenience(rs.getString("convenience"));
					dto.setRegdate(rs.getTimestamp("regdate"));
					dto.setDayoff(rs.getString("dayoff"));
					listForm.add(dto);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return listForm;
		}

		
		public List<RestaurantDTO> getListInfo(int startRow, int pageSize) {
			List<RestaurantDTO> listForm = new ArrayList<RestaurantDTO>();
			
			try {
				con = getCon();
				sql = "select * from restaurant order by regdate desc limit ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, startRow - 1);
				pstmt.setInt(2, pageSize);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					RestaurantDTO dto = new RestaurantDTO();
					dto.setRest_tel(rs.getString("rest_tel"));
					dto.setName(rs.getString("name"));
					dto.setRest_id(rs.getInt("rest_id"));
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
		
		
		public int getListCount() {
			int result = 0;
			
			try {
				con = getCon();
				sql = "select count(*) from restaurant";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					result = rs.getInt(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return result;
		}
		
		public RestaurantDTO getRestaurantForm(int rest_id) {
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
		
		

	/* ================== < 가게리스트 > ======================== */
		
		
		
	/* ================== < 가게리스트 > ======================== */
		
		public RestaurantDTO getRestrauntForm(int rest_id) {
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
	/* ================== < 가게리스트 > ======================== */
		
		
	
	

}