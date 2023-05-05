package com.fooeating.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fooeating.commons.Action;
import com.fooeating.commons.ActionForward;
import com.fooeating.db.PublicDAO;
import com.fooeating.db.RestaurantDTO;

public class RestaurantInfoAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" RestaurantInfoAction_execute() 호출");
		
		// 세션 제어
		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("user_id");
		
		ActionForward forward = new ActionForward();
		if(user_id == null || !user_id.equals("real_admin")) {
			forward.setPath("./Main.foo");
			forward.setRedirect(true);
			return forward;
		}
		
		// 가게 정보 저장
		int rest_id = Integer.parseInt(request.getParameter("rest_id"));
		String pno = request.getParameter("pno");
		if(pno == null) {
			pno = "1";
		}
		
		PublicDAO dao = new PublicDAO();
		RestaurantDTO restInfo = dao.getRestaurantInfo(rest_id);
		System.out.println("출력할 가게 : " + restInfo);
		
		request.setAttribute("restInfo", restInfo);
		request.setAttribute("pno", pno);
		
		// 연결된 view에 출력
		forward.setPath("./admin/restaurantInfo.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
