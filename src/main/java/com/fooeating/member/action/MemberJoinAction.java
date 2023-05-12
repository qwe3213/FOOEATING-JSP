package com.fooeating.member.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fooeating.commons.Action;
import com.fooeating.commons.ActionForward;
import com.fooeating.db.PublicDAO;
import com.fooeating.db.UserDTO;

// 회원가입 처리(인코딩, 정보저장, 디비연결, 페이지이동)
public class MemberJoinAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest reqeuest,
								 HttpServletResponse response) throws Exception {
		
		System.out.println(" M : MemberJoinAction_execute() 실행");

		// 한글처리
		reqeuest.setCharacterEncoding("UTF-8");
		
		// MemberDTO 객체
		UserDTO dto = new UserDTO();
		
		// 전달된 정보 저장
		
		dto.setUser_id(reqeuest.getParameter("user_id"));
		dto.setPw(reqeuest.getParameter("pw"));
		dto.setName(reqeuest.getParameter("name"));
		dto.setEmail(reqeuest.getParameter("email"));
		dto.setPhone(reqeuest.getParameter("phone"));
		dto.setRegdate(new Timestamp(System.currentTimeMillis()));
		
		System.out.println(" M : " + dto);
		
		// MemberDAO 객체 생성
		PublicDAO dao = new PublicDAO();
		
		// 회원가입 메서드
		dao.MemberJoin(dto);
		
		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./MemberLogin.foo");
		forward.setRedirect(true);
		
//		response.getWriter().append("결과");
//		return null;
		
		System.out.println(" M : 데이터 처리완료! ");
		
		return forward;
	}
	
	
	
	

}
