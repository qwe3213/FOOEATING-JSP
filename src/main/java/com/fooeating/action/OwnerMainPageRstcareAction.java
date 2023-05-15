package com.fooeating.action;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fooeating.commons.Action;
import com.fooeating.commons.ActionForward;
import com.fooeating.db.PublicDAO;
import com.fooeating.db.RestaurantDTO;
import com.fooeating.db.Restaurant_menuDTO;

public class OwnerMainPageRstcareAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println(" O : OwnerMainpage_rstcareAction_execute() 호출 ");
		
		// 세션 제어
		HttpSession session = request.getSession();
	    session.setAttribute("status", 0);
		ActionForward forward = new ActionForward();
		String user_id = (String)session.getAttribute("user_id");
		
		String st =  String.valueOf(session.getAttribute("status"));
		int status = Integer.parseInt(st);
		// Integer.parseInt()
		if(user_id == null) {
			forward.setPath("./Main.foo");
			forward.setRedirect(true);
			return forward;
		}
		
		 
		PublicDAO dao = new PublicDAO();
		RestaurantDTO restal = dao.getRestaurantallow(user_id);
		Restaurant_menuDTO menudto = dao.getRestaurantmenuallow(restal.getRest_id());
		System.out.println("출력할 가게의 정보" + restal);
		System.out.println("출력할 가게의 메뉴 정보 :" + menudto);
	    request.setAttribute("restal",restal);
	    request.setAttribute("menudto", menudto);
		
		
		forward.setPath("./owner/ownerMainPage_rstcare.jsp");
		forward.setRedirect(false);		

		return forward;
	}

	  
}

