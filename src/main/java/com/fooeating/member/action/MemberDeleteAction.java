package com.fooeating.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fooeating.commons.Action;
import com.fooeating.commons.ActionForward;
import com.fooeating.commons.JSForward;
import com.fooeating.db.PublicDAO;
import com.fooeating.db.UserDTO;


public class MemberDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		
		System.out.println(" M : MemberDeleteAction_execute() 호출");
		
		// 세션정보 제어(로그인)
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("user_id");
		
		ActionForward forward = new ActionForward();
		
		if(id == null) {
			forward.setPath("./MemberLogin.foo");
			forward.setRedirect(true);
			return forward;
		}

		// 전달정보 저장(id,pw)
		UserDTO dto = new UserDTO();
		dto.setUser_id(request.getParameter("id"));
		dto.setPw(request.getParameter("pw"));
		
		// 회원 탈퇴 = DAO 객체 - deleteMember()
		PublicDAO dao = new PublicDAO();
		
		int result = dao.deleteMember(dto);
		
		System.out.println(" M : 정보 삭제 결과 " + result);
		
		// 수정 처리 결과에 따른 페이지 이동 (JS)
		
		if (result == -1) {
			JSForward.alertAndBack(response, "회원정보 없음(삭제불가)");
			
			return null; // 컨트롤러에서는 이동X
		}
		
		if (result == 0 ) { // 비밀번호 오류
			// JS이동 처리 객체 동작 호출
			JSForward.alertAndBack(response, "비밀번호 오류(삭제불가)");
			
			return null; // 컨트롤러에서는 이동X
		}
		
		// result == 1
		// 세션정보 초기화
		session.invalidate();
		
		JSForward.alertAndClose(response, "회원정보 탈퇴 성공!");
		
		return null;
		}
		
		
		
	
	

}
