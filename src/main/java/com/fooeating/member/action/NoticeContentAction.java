package com.fooeating.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fooeating.commons.Action;
import com.fooeating.commons.ActionForward;
import com.fooeating.db.NoticeDTO;
import com.fooeating.db.PublicDAO;

public class NoticeContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("M : NoticeContentAction_execute 실행");
		
		
		// 1. href 주소줄로 전달받은 정보 저장
		// 1-1. notice_num 정보 저장
		int notice_num = Integer.parseInt(request.getParameter("notice_num"));
		System.out.println(notice_num);
		// 1-2. pageNum 정보 저장
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null){
			pageNum = "1";
		}
		System.out.println(pageNum);
		
		
		// 2. DAO 객체의 getBoard(notice_num) 메서드 실행
		PublicDAO dao = new PublicDAO();
		NoticeDTO dto = dao.getNoticeContent(notice_num);
		
		// 2-1. request 영역에 dto 정보 저장
		request.setAttribute("dto", dto);
		request.setAttribute("pageNum", pageNum);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./notice/noticeContent.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
