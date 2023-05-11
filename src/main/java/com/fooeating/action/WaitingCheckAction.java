package com.fooeating.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fooeating.commons.Action;
import com.fooeating.commons.ActionForward;
import com.fooeating.db.PublicDAO;
import com.fooeating.db.WaitingDTO;

public class WaitingCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("WaitingCheckAction_execute() 호출");
		
		// 정보 저장
		String user_id = request.getParameter("user_id");
		String rest_id = request.getParameter("rest_id");
		System.out.println(user_id + ", " + rest_id);
		
		PublicDAO dao = new PublicDAO();
		// 대기번호 발급
//		WaitingDTO waiting_dto = dao.getWaitingNum(user_id, rest_id);
//		System.out.println(waiting_dto.getWait_num());
//		System.out.println(waiting_dto.getUser_id());
//		System.out.println(waiting_dto.getRest_id());
//		System.out.println(waiting_dto.getRegdate());
//		
//		request.setAttribute("waiting_dto", waiting_dto);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./list/waitingCheckPro.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
