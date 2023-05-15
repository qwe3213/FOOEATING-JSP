package com.fooeating.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fooeating.commons.Action;
import com.fooeating.commons.ActionForward;
import com.fooeating.commons.JSForward;
import com.fooeating.db.PublicDAO;
import com.fooeating.db.ReivewDTO;
import com.fooeating.db.UserDTO;
import com.fooeating.db.WaitingDTO;

public class ReviewWrite implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		
System.out.println(" M: ReviewWrite_execute() 호출 ");
		
		// 세션정보 제어
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("user_id");
		
		
		ActionForward forward = new ActionForward();
		
		if(id == null) {
			forward.setPath("./MemberLogin.foo");
			forward.setRedirect(true);
			return forward;
		}
		
		// 한글처리(인코딩)
		request.setCharacterEncoding("UTF-8");
		
		// 전달 정보 저장
		int wait_num =Integer.parseInt(request.getParameter("wait_num"));
		
		// 기존의 회원정보를 가져오기(DB)
		PublicDAO dao = new PublicDAO();
			
		WaitingDTO dto =  dao.getWaitRestaurant(wait_num);
				
		// 정보저장 (request영역)
		request.setAttribute("dto", dto);
				
		// ./member/updateForm.jsp 출력
		forward.setPath("./member/reviewWrite.jsp");
		forward.setRedirect(false);
				
		return forward;
	}
		

}
