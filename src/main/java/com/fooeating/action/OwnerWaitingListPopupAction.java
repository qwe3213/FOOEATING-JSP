package com.fooeating.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.fooeating.commons.Action;
import com.fooeating.commons.ActionForward;
import com.fooeating.commons.JSForward;
import com.fooeating.db.PublicDAO;



public class OwnerWaitingListPopupAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("M : OwnerWaitingListPopupAction_execute 실행");
		
		 
		// 1. 전달된 정보 저장
		int wait_num = Integer.parseInt(request.getParameter("wait_num"));
		request.setAttribute("wait_num", wait_num);
		
		// 2. DAO의 메서드 사용
		// -> status를 2로 변경함으로써 대기완료 상태로 만듬.
		PublicDAO dao = new PublicDAO();
		dao.waitingDone(wait_num);
		
		// 3. 페이지 이동
		JSForward.alertAndClose(response, "고객 입장 완료!");
		return null;
	}

}
