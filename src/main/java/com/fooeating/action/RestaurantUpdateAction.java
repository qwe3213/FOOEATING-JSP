package com.fooeating.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fooeating.commons.Action;
import com.fooeating.commons.ActionForward;
import com.fooeating.commons.JSForward;
import com.fooeating.db.PublicDAO;
import com.fooeating.db.RestaurantDTO;

public class RestaurantUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, 
		   HttpServletResponse response) throws Exception {
	
	       System.out.println(" C : RestaurantUpdateAction.execute()호출");
	 
	       // 한글처리 
	       request.setCharacterEncoding("UTF-8");
	       
	       // 점주 아이디 받아오기
	       HttpSession session = request.getSession();
	       String user_id = (String) session.getAttribute("user_id");
	       
	       RestaurantDTO restal = new RestaurantDTO();
	       
	       restal.setName(request.getParameter("name"));
	       restal.setConvenience(request.getParameter("convenience"));
	       restal.setDayoff(request.getParameter("dayoff"));
	       restal.setRuntime(request.getParameter("runtime"));
	       restal.setDescriptions(request.getParameter("descriptions"));
	       restal.setOwner_user_id(user_id);
	       System.out.println(restal.getDayoff());
	       PublicDAO dao = new PublicDAO();
	       
	       dao.getRestaurantUpdate(restal);
	       
	       JSForward.alertAndMove(response, "수정 완료","./OwnerMainPageRstcareAction.on");
	      
	       return null;
	}
	
	
}
