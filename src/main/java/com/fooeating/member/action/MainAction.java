package com.fooeating.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fooeating.commons.Action;
import com.fooeating.commons.ActionForward;
import com.fooeating.db.PublicDAO;
import com.fooeating.db.WaitingDTO;

public class MainAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		
		
		// 세션정보 제어
				HttpSession session = request.getSession();
				String user_id = (String)session.getAttribute("user_id");
				
				ActionForward forward = new ActionForward();
				
				// 페이징처리
				PublicDAO dao = new PublicDAO();
				
				// 대기리스트 정보 저장
				WaitingDTO wDto = dao.getWaiting(user_id);
				WaitingDTO qDto = null;
				
				if(wDto != null) {
				qDto = dao.getQueue(wDto.getRest_id(), user_id);
				request.setAttribute("wDto", wDto);
				}
				
				request.setAttribute("qDto", qDto);
				
				// 페이지 이동 (출력)
				forward.setPath("./main/main.jsp");
				forward.setRedirect(false);
						
				return forward;
		
	}

}
