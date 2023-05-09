package com.fooeating.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fooeating.commons.Action;
import com.fooeating.commons.ActionForward;
import com.fooeating.commons.JSForward;
import com.fooeating.db.PublicDAO;

public class ApprovalCheckProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" UserInfoListAction_execute() 호출");
		
		// 세션 제어
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("user_id");
		
		ActionForward forward = new ActionForward();
		if(user_id == null || !user_id.equals("real_admin")) {
			forward.setPath("./Main.foo");
			forward.setRedirect(true);
			return forward;
		}
		
		// 가게 정보
		int rest_id = Integer.parseInt(request.getParameter("rest_id"));
		
		// status 정보 수정
		PublicDAO dao = new PublicDAO();
		int result = dao.getRestaurantStatus(rest_id);
		
		// 완료 여부
		if(result == 0) {
			JSForward.alertAndBack(response, "해당 가게가 없습니다.");
		}
		JSForward.alertAndClose(response, "입점 승인 완료");
		
		return null;
	}

}
