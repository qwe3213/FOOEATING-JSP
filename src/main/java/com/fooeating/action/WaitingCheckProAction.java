package com.fooeating.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fooeating.commons.Action;
import com.fooeating.commons.ActionForward;
import com.fooeating.db.PublicDAO;
import com.fooeating.db.WaitingDTO;

public class WaitingCheckProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("WaitingCheckProAction_execute() 호출");
		
		ActionForward forward = new ActionForward();
		
		// 정보 저장
		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("user_id");
		String rest_id = request.getParameter("rest_id");
		System.out.println(user_id + ", " + rest_id);
		
		PublicDAO dao = new PublicDAO();
		
		// DB에 user_id와 rest_id, status가 1인 모든 조건을 만족하는 wait_num이 있는지 확인 -> 없으면 null 리턴하게
		WaitingDTO wdto = dao.getWaitingCheck(user_id, rest_id);
		
		if (wdto != null) {
			System.out.printf("(이미 있을 때)user_id : %s, rest_id : %s, wait_num : %d\n", wdto.getUser_id(), wdto.getRest_id(), wdto.getWait_num());
		} else {
			// 대기번호 발급
			dao.getWaitingNum(user_id, rest_id);
			wdto = dao.getWaitingCheck(user_id, rest_id);
			System.out.printf("(신규 발급 후)user_id : %s, rest_id : %s, wait_num : %d\n", wdto.getUser_id(), wdto.getRest_id(), wdto.getWait_num());
		}
		
		session.setAttribute("wdto", wdto);
		
		forward.setPath("./list/waitingCheckResult.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
