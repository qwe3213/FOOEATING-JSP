package com.fooeating.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fooeating.commons.Action;
import com.fooeating.commons.ActionForward;
import com.fooeating.db.PublicDAO;
import com.fooeating.db.RestaurantDTO;

public class MapFormAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" RestaurantInfoAction_execute() 호출");
		
		// 세션 제어
		
		// 가게 정보 저장
		int rest_id = Integer.parseInt(request.getParameter("rest_id"));
		
		PublicDAO dao = new PublicDAO();
		RestaurantDTO MapForm = dao.getRestaurantInfo(rest_id);
		System.out.println("출력할 가게 : " + MapForm);
		
		request.setAttribute("restInfo", MapForm);
		
		ActionForward forward = new ActionForward();
		// 연결된 view에 출력
		forward.setPath("./list/MapForm.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
