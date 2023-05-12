package com.fooeating.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fooeating.commons.Action;
import com.fooeating.commons.ActionForward;
import com.fooeating.db.PublicDAO;
import com.fooeating.db.RestaurantDTO;
import com.fooeating.db.WaitingDTO;

public class RestaurantFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" RestaurantInfoAction_execute() 호출");
		
		// 세션 제어
		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("user_id");
		
		// 가게 정보 저장
		String rest_id = request.getParameter("rest_id");
		
		PublicDAO dao = new PublicDAO();
		RestaurantDTO restForm = dao.getRestaurantForm(rest_id);
		System.out.println("출력할 가게 : " + restForm.getWaitdto());
		WaitingDTO wdto = dao.getWaitingCheck(user_id, rest_id);
		System.out.println("wdto : " + wdto);
		
		request.setAttribute("restForm", restForm);
		if (wdto != null) {
			session.setAttribute("wdto", wdto);
		}
		
		ActionForward forward = new ActionForward();
		// 연결된 view에 출력
		forward.setPath("./list/restaurantForm.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
}
