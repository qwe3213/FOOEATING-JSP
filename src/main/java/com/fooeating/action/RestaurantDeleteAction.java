package com.fooeating.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fooeating.commons.Action;
import com.fooeating.commons.ActionForward;
import com.fooeating.db.PublicDAO;
import com.fooeating.db.RestaurantDTO;
import com.fooeating.db.UserDTO;

public class RestaurantDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("가게 정보 삭제 가즈아~");
		
		// 세션정보 제어(로그인)
		HttpSession session = request.getSession();
		ActionForward forward = new ActionForward();
		
		String user_id = (String)session.getAttribute("user_id");
				
		if(user_id == null) {
			forward.setPath("./Main.foo");
			forward.setRedirect(true);
			return forward;
		}
		PublicDAO dao = new PublicDAO();
		
		UserDTO dto = dao.getMember(user_id);
		
		
		request.setAttribute("dto", dto);
		
		System.out.println("dto의 비밀번호"+dto.getPw());
	    
		forward.setPath("./owner/restDelete.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
