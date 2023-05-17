package com.fooeating.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fooeating.commons.Action;
import com.fooeating.commons.ActionForward;
import com.fooeating.db.PublicDAO;
import com.fooeating.db.ReivewDTO;

public class ownerMainPageReviewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : ownerMainPageReviewAction_execute() 호출 ");
		
		// 세션 제어
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("user_id");
		
		PublicDAO dao = new PublicDAO();
		String owner_user_id = dao.checkOwnerId(user_id);
		
		
		// 로그인 제어
		ActionForward forward = new ActionForward();
		
		if(user_id == null) {
			forward.setPath("./MemberLogin.foo");
			forward.setRedirect(true);
			return forward;
		}
		
		// 가게 리뷰 목록 가져오기(DB)
		String rest_id = (String)request.getAttribute("rest_id");
	
		List<ReivewDTO> reviewList =  dao.getReviewAll(rest_id);
		System.out.println("리뷰 값 : "+reviewList.size());
		
		// 정보저장 (request영역)
		request.setAttribute("reviewList", reviewList);
		
		// ./member/updateForm.jsp 출력
		forward.setPath("./member/reviewForm.jsp");
		forward.setRedirect(false);
		
		System.out.println(" M : 정보조회 저장, 처리 끝");
		
		return forward;
		
	}
	
}
