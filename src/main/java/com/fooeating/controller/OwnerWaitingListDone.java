package com.fooeating.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fooeating.commons.Action;
import com.fooeating.commons.ActionForward;
import com.fooeating.db.PublicDAO;

public class OwnerWaitingListDone implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("OwnerWaitingListDone_execute 실행");
		
		// 1. 전달된 정보 저장
		int wait_num = Integer.parseInt(request.getParameter("wait_num"));
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum = "1";
		}

		// 2. request 영역에 저장
		request.setAttribute("wait_num", wait_num);
		request.setAttribute("pageNum", pageNum);
		
		// 3. dao의 메서드 사용
		// -> wait_num에 해당하는 데이터 삭제
		PublicDAO dao = new PublicDAO();
		dao.waitingDone(wait_num);
		
		// 3. 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./OwnerWaitingList.on?pageNum=" + pageNum);
		forward.setRedirect(true);
		return forward;
	}

}
