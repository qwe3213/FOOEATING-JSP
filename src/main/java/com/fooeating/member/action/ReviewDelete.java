package com.fooeating.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fooeating.commons.Action;
import com.fooeating.commons.ActionForward;
import com.fooeating.commons.JSForward;
import com.fooeating.db.PublicDAO;


public class ReviewDelete implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		
		System.out.println(" M: reviewDelete_execute() 호출 ");
		
		// 세션정보 제어
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("user_id");
		int review_num = Integer.parseInt(request.getParameter("review_num"));
		
		ActionForward forward = new ActionForward();
		
		if(id == null) {
			forward.setPath("./MemberLogin.foo");
			forward.setRedirect(true);
			return forward;
		}
		
		// 한글처리(인코딩)
		request.setCharacterEncoding("UTF-8");
		
		
		// id와 review_num으로 삭제할 리뷰 특정해서 삭제
		PublicDAO dao = new PublicDAO();
			
		int result = dao.deleteReview(id, review_num);
		
		if (result == -1) {
			JSForward.alertAndBack(response, "회원정보 없음(삭제불가)");
			
			return null; // 컨트롤러에서는 이동X
		}
		
		
		// 
		JSForward.alertAndMove(response, "리뷰가 삭제 되었습니다!","./MyReview.foo");		
			
		return null;
	}
		
		
		
	
	

}
