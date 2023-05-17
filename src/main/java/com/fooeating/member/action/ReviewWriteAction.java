package com.fooeating.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fooeating.commons.Action;
import com.fooeating.commons.ActionForward;
import com.fooeating.commons.JSForward;
import com.fooeating.db.PublicDAO;
import com.fooeating.db.ReivewDTO;

public class ReviewWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		
		System.out.println(" M: ReviewWriteAction_execute() 호출 ");
		
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
		ReivewDTO dto = new ReivewDTO();
		
		dto.setWait_num(Integer.parseInt(request.getParameter("wait_num")));
		dto.setRest_id(request.getParameter("rest_id"));
		dto.setGrade(Integer.parseInt(request.getParameter("grade")));
		dto.setContent(request.getParameter("content"));
		dto.setUser_id(id);
		
		
		
		// DAO - 정보수정 메서드 호출 -changePw(id, pw, newPw)
		PublicDAO dao = new PublicDAO();
		
		dao.reviewWriteAction(dto);
		
		JSForward.alertAndCloseAndMove(response, "리뷰 작성 완료!", "./MyReview.foo");
		
		
		return null;
	}
		

}
