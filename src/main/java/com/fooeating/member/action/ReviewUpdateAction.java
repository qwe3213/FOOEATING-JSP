package com.fooeating.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fooeating.commons.Action;
import com.fooeating.commons.ActionForward;
import com.fooeating.commons.JSForward;
import com.fooeating.db.PublicDAO;

public class ReviewUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		
		System.out.println(" M: ReviewUpdateAction_execute() 호출 ");
		
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
		
		// 전달정보 저장(변수)
		int review_num = Integer.parseInt(request.getParameter("review_num"));
		String newContent = request.getParameter("newContent");
		
		
		
		// DAO - 정보수정 메서드 호출 -changePw(id, pw, newPw)
		PublicDAO dao = new PublicDAO();
		
		int result = dao.changeReview(id, review_num, newContent);
		
		System.out.println(" M : 정보 수정 결과 " + result);
		
		// 수정 처리 결과에 따른 페이지 이동 (JS)
		
		if (result == -1) {
			JSForward.alertAndBack(response, "아이디 없음");
			
			return null; // 컨트롤러에서는 이동X
		}
		
		
		session.removeAttribute("dto");
		// result == 1
		JSForward.alertAndCloseAndMove(response, "리뷰 수정 완료!","./MyReview.foo");
		
		return null;
	}
		

}
