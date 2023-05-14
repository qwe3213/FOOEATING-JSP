package com.fooeating.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fooeating.commons.Action;
import com.fooeating.commons.ActionForward;
import com.fooeating.db.PublicDAO;
import com.fooeating.db.RestaurantDTO;
import com.fooeating.db.Restaurant_menuDTO;

public class ownerRequestSuccessAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println(" M : ownerRequestSuccessAction_execute() 호출");
		
		// 한글 처리
		request.setCharacterEncoding("UTF-8");
		
		// 세션 정보 저장
		HttpSession session = request.getSession();
		
		String user_id = (String)session.getAttribute("user_id");
		
		RestaurantDTO dto = new RestaurantDTO();
		dto.setRest_id(request.getParameter("rest_id"));
		dto.setName(request.getParameter("name"));
		dto.setCategory(request.getParameter("category"));
		dto.setAddr_city(request.getParameter("addr_city"));
		dto.setAddr_district(request.getParameter("addr_district"));
		dto.setAddr_etc(request.getParameter("addr_etc"));
		dto.setRest_tel(request.getParameter("rest_tel"));
		dto.setRuntime(request.getParameter("runtime"));
		dto.setDayoff(request.getParameter("dayoff"));
		dto.setDescriptions(request.getParameter("descriptions"));
		dto.setConvenience(request.getParameter("convenience"));
		dto.setOwner_user_id(user_id);
		
		Restaurant_menuDTO menudto = new Restaurant_menuDTO();
		
		menudto.setMenu_name(request.getParameter("menu_name"));
		menudto.setMenu_descriptions(request.getParameter("menu_descriptions"));
		menudto.setPrice(request.getParameter("price"));
		menudto.setRest_id(request.getParameter("rest_id"));
		
		PublicDAO dao = new PublicDAO();
		dao.getRestaurant(dto);
		dao.getRestaurantMenu(menudto);

		System.out.println(" M : " + dto);
        System.out.println(" M : " + menudto);
		
        ActionForward forward = new ActionForward();
		forward.setPath("./owner/ownerRequestSuccess.jsp");
		forward.setRedirect(false);


		
		
		
		return forward;
	}

}
