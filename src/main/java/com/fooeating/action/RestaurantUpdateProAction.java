package com.fooeating.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fooeating.commons.Action;
import com.fooeating.commons.ActionForward;
import com.fooeating.db.PublicDAO;
import com.fooeating.db.RestaurantDTO;

public class RestaurantUpdateProAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
	
		    System.out.println("RestaurantUpdateProAction.execute() 호출 ");
		 
	    	ActionForward forward = new ActionForward();
		
		   
	    	
	       RestaurantDTO restal = new RestaurantDTO();
	       
	       HttpSession session = request.getSession();
	       String user_id = (String)session.getAttribute("user_id");
			
	       PublicDAO dao = new PublicDAO();
	       
	       
	       RestaurantDTO dto = new RestaurantDTO();
	       dto = dao.getRestaurantallow(user_id);
	       
	       request.setAttribute("dto", dto);
	       
	       System.out.println(dto.getName());
	       forward.setPath("./owner/ownerRestChange.jsp");
		   forward.setRedirect(false);
			
		   System.out.println(" M : 정보조회 저장, 처리 끝");
	   
	  
		return forward;
	}

}
