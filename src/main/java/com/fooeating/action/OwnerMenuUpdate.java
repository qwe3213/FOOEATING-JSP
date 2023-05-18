package com.fooeating.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fooeating.commons.Action;
import com.fooeating.commons.ActionForward;
import com.fooeating.commons.JSForward;
import com.fooeating.db.PublicDAO;
import com.fooeating.db.ReivewDTO;
import com.fooeating.db.Restaurant_menuDTO;
import com.fooeating.db.UserDTO;

public class OwnerMenuUpdate implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		
System.out.println(" M: reviewUpdate_execute() 호출 ");
		
		// 세션정보 제어
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("user_id");
		int menuNum = Integer.parseInt(request.getParameter("menuNum"));
		
		ActionForward forward = new ActionForward();
		
		if(id == null) {
			forward.setPath("./MemberLogin.foo");
			forward.setRedirect(true);
			return forward;
		}
		
		// 한글처리(인코딩)
		request.setCharacterEncoding("UTF-8");
		
		// 기존의 회원정보를 가져오기(DB)
		PublicDAO dao = new PublicDAO();
			
		Restaurant_menuDTO dto =  dao.getMenu(menuNum);
				
		// 정보저장 (request영역)
		request.setAttribute("dto", dto);
				
		// ./member/updateForm.jsp 출력
		forward.setPath("./owner/ownerMenuUpdate.jsp");
		forward.setRedirect(false);
				
		return forward;
	}
		

}
