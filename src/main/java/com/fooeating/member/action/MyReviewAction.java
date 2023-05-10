package com.fooeating.member.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fooeating.commons.Action;
import com.fooeating.commons.ActionForward;
import com.fooeating.db.PublicDAO;
import com.fooeating.db.ReivewDTO;
import com.fooeating.db.RestaurantDTO;
import com.fooeating.db.UserDTO;

public class MyReviewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest reqeuest, 
			HttpServletResponse response) throws Exception {
		
		System.out.println(" M : MyReviewAction_execute() 호출 ");
		
		// 세션정보 제어
		HttpSession session = reqeuest.getSession();
		String id = (String)session.getAttribute("user_id");
		
		ActionForward forward = new ActionForward();
		
		if(id == null) {
			forward.setPath("./MemberLogin.foo");
			forward.setRedirect(true);
			return forward;
		}
		
		// 회원 리뷰 목록 가져오기(DB)
		PublicDAO dao = new PublicDAO();
	
		List<ReivewDTO> reviewList =  dao.getReviewAll(id);
		System.out.println("리뷰 값 : "+reviewList.size());
		
		// 정보저장 (request영역)
		reqeuest.setAttribute("reviewList", reviewList);
		
		// ./member/updateForm.jsp 출력
		forward.setPath("./member/reviewForm.jsp");
		forward.setRedirect(false);
		
		System.out.println(" M : 정보조회 저장, 처리 끝");
		
		return forward;
	}
	

}
