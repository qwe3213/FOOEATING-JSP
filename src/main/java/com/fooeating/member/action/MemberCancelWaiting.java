package com.fooeating.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fooeating.commons.Action;
import com.fooeating.commons.ActionForward;
import com.fooeating.commons.JSForward;
import com.fooeating.db.PublicDAO;
import com.fooeating.db.UserDTO;
import com.fooeating.db.WaitingDTO;

public class MemberCancelWaiting implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		System.out.println(" M: MemberCancelWaiting_execute() 호출 ");
		
		// 세션정보 제어
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("user_id");
		
		ActionForward forward = new ActionForward();
		
		if(id == null) {
			forward.setPath("./MemberLogin.foo");
			forward.setRedirect(true);
			return forward;
		}
		
		// 한글처리(인코딩)
		request.setCharacterEncoding("UTF-8");
		
		// 전달정보 저장(DTO)
		WaitingDTO dto = new WaitingDTO();
		dto.setUser_id(id);
		dto.setWait_num(Integer.parseInt(request.getParameter("wait_num")));
		
		// DAO - 정보수정 메서드 호출 - memberUpdate(dto)
		PublicDAO dao = new PublicDAO();
		
		int result = dao.memberCancelWaiting(dto);
		
		System.out.println(" M : 정보 수정 결과 " + result);
		
		// 수정 처리 결과에 따른 페이지 이동 (JS)
		
		if (result == -1) {
			JSForward.alertAndBack(response, "아이디 없음");
			
			return null; // 컨트롤러에서는 이동X
		}
		
		if (result == 0 ) { // 비밀번호 오류
			// JS이동 처리 객체 동작 호출
			JSForward.alertAndBack(response, "대기번호 오류!");
			
			return null; // 컨트롤러에서는 이동X
		}
		
		// result == 1
		JSForward.alertAndMove(response, "줄서기 취소 완료!","./MemberWaitingList.foo" );
		
		
		return null;
	}

}
