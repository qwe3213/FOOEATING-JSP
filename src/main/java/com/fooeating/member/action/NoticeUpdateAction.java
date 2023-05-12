package com.fooeating.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fooeating.commons.Action;
import com.fooeating.commons.ActionForward;
import com.fooeating.db.NoticeDTO;
import com.fooeating.db.PublicDAO;



public class NoticeUpdateAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("NoticeUpdateAction_execute 실행");
		
		// 0. 한글처리
		request.setCharacterEncoding("UTF-8");
		
		// 1. noticeContent.jsp 에서 전달된 정보 저장
		// -> 객체dto, notice_num,  pageNum
		int notice_num = Integer.parseInt(request.getParameter("notice_num")); 
		int pageNum = Integer.parseInt(request.getParameter("pageNum")); 
		
		// 2. DB에서 notice_num에 해당하는 글 정보 가져와 저장
		// 2-1. 가져오기
		PublicDAO dao = new PublicDAO();
		NoticeDTO dto = dao.getNoticeContent(notice_num);
		
		// 2-2. 저장하기
		request.setAttribute("dto", dto);
		request.setAttribute("pageNum", pageNum);
	
		// 3. 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./notice/noticeUpdate.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

	
	
}
