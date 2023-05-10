package com.fooeating.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fooeating.commons.Action;
import com.fooeating.commons.ActionForward;
import com.fooeating.db.PublicDAO;
import com.fooeating.db.UserDTO;

public class MemberUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest reqeuest, 
			HttpServletResponse response) throws Exception {
		
		System.out.println(" M : MemberUpdateAction_execute() 호출 ");
		
		// 세션정보 제어
		HttpSession session = reqeuest.getSession();
		String id = (String)session.getAttribute("user_id");
		
		ActionForward forward = new ActionForward();
		
		if(id == null) {
			forward.setPath("./MemberLogin.foo");
			forward.setRedirect(true);
			return forward;
		}
		
		// 기존의 회원정보를 가져오기(DB)
		PublicDAO dao = new PublicDAO();
	
		UserDTO dto =  dao.getMember(id);
		// System.out.println(dto);
		
		// 정보저장 (request영역)
		reqeuest.setAttribute("dto", dto);
		
		// ./member/updateForm.jsp 출력
		forward.setPath("./member/updateForm.jsp");
		forward.setRedirect(false);
		
		System.out.println(" M : 정보조회 저장, 처리 끝");
		
		return forward;
	}
	

}
