package com.fooeating.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fooeating.commons.Action;
import com.fooeating.commons.ActionForward;
import com.fooeating.db.PublicDAO;
import com.fooeating.db.RestaurantDTO;
import com.fooeating.db.UserDTO;
import com.fooeating.db.WaitingDTO;

public class OwnerWaitingListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 0. 한글 처리
		request.setCharacterEncoding("UTF-8");
		
		// 1. 전달된 정보 저장
		// 1-1. user_id
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("user_id");
		// 1-2. owner_user_id
		PublicDAO dao = new PublicDAO();		
		String owner_user_id = dao.checkOwnerId(user_id);
		
		
		// 2. dao 메서드 사용 waitingList 정보 저장
		List waitingList = dao.getWaitingList(owner_user_id);
		
		// 2-1. request 영역에 저장
		request.setAttribute("waitingList", waitingList);
		System.out.println("DAO : waitingList 저장 완료.");
		
		// 3. 페이징처리

		
		// 4. 페이지 이동 
		ActionForward forward = new ActionForward();
		forward.setPath("./owner/ownerWaitingList.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
