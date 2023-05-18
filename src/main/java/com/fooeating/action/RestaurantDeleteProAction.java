package com.fooeating.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fooeating.commons.Action;
import com.fooeating.commons.ActionForward;
import com.fooeating.commons.JSForward;
import com.fooeating.db.PublicDAO;



public class RestaurantDeleteProAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	  
		System.out.println("소라누나 가지마아아아아아아앙아");
		
		
	    // 한글처리 
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        String user_id = (String) session.getAttribute("user_id");
        String pw = request.getParameter("pw");
        System.out.println("pw : "+pw);
        
        PublicDAO dao = new PublicDAO();
        
        int result = dao.deleteRestaurant(user_id, pw);
        
        if(result == -1) {
			   JSForward.alertAndBack(response, "가게 정보 없음(삭제불가)");
			   return null;
			} else if(result == 0) {
				JSForward.alertAndBack(response, "비밀번호 오류(삭제불가)");
				   return null;
				}
		   
		    JSForward.alertAndMove(response, "가게삭제완료!", "./Main.foo");

		return null;
	}

	
}
