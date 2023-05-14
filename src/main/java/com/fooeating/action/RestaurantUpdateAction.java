package com.fooeating.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	       
	       RestaurantDTO restal = new RestaurantDTO();
	       
	       restal.setName(request.getParameter("name"));
	       restal.setConvenience(request.getParameter("convenience"));
	       restal.setDayoff(request.getParameter("dayoff"));
	       restal.setRuntime(request.getParameter("runtime"));
	       restal.setDescriptions(request.getParameter("descriptions"));
	       System.out.println(restal.getDayoff());
	       PublicDAO dao = new PublicDAO();
	       
	       dao.getRestaurantUpdate(restal);
	       
	       JSForward.alertAndMove(response, "수정 완료","./OwnerMainPageRstcareAction.on");
	      
	       return null;
	}
	
	
}
