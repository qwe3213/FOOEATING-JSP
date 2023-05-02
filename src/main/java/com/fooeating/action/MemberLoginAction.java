package com.fooeating.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fooeating.commons.Action;
import com.fooeating.commons.ActionForward;
import com.fooeating.db.PublicDAO;
import com.fooeating.db.UserDTO;


// 로그인 정보 처리

public class MemberLoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		System.out.println(" M : memberLoginAction_execute() 호출");
		
		// 한글 처리
		request.setCharacterEncoding("UTF-8");
		
		// 전달정보 (id/pw) 저장
		UserDTO dto =  new UserDTO();
		dto.setUser_id(request.getParameter("id"));
		dto.setPw(request.getParameter("pw"));
		
		// DAO의 memberLogin(dto) 메서드 호출하여 리턴값 result에 저장
		PublicDAO dao = new PublicDAO();
		int result = dao.memberLogin(dto);
		
		// result 값에 따른 페이지 이동
		if(result == -1) {
			// 비회원 -> 뒤로가기 history.back()
			
			return null;
		}
		
		if(result == 0) {
			// 비밀번호 오류
			// 경고 글씨 띄우기 -> 제이쿼리
			
			return null;
		}
		
		// result == 1 회원이자 본인
		// session에 아이디 저장
		HttpSession session = request.getSession();
		session.setAttribute("id", dto.getUser_id());
		
		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./Main.foo");
		forward.setRedirect(true);
		
		return forward;
	}
	
}
