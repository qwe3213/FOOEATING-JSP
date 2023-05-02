package com.fooeating.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fooeating.commons.Action;
import com.fooeating.commons.ActionForward;
import com.fooeating.db.PublicDAO;
import com.fooeating.db.RestaurantDTO;

public class RestaurantListAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" UserInfoListAction_execute() 호출");
		
		// 세션 제어
		
		// 가게 정보 저장
		PublicDAO dao = new PublicDAO();
		List<RestaurantDTO> restList = dao.getRestaurantList();
		System.out.println("가게 수 : " + restList.size());
		
		request.setAttribute("restList", restList);
		
		ActionForward forward = new ActionForward();
		// 연결된 view에 출력
		forward.setPath("./admin/restaurantList.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
}
