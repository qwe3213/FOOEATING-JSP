package com.fooeating.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fooeating.commons.Action;
import com.fooeating.commons.ActionForward;
import com.fooeating.commons.JSForward;
import com.fooeating.db.NoticeDTO;
import com.fooeating.db.PublicDAO;

public class NoticeDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("NoticeDeleteAction_execute 실행");
		
		
		// 0. 한글처리
		request.setCharacterEncoding("UTF-8");
		
		// 1. 전달된 정보 저장
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		int notice_num = Integer.parseInt(request.getParameter("notice_num"));
		
		// 2. dto 객체에 위의 정보 저장
		NoticeDTO dto = new NoticeDTO();
		dto.setNotice_num(notice_num);
		
		// 3. deleteNoticeContent() 메서드 실행
		PublicDAO dao = new PublicDAO();
		dao.deleteNoticeContent(dto);
		
		// JS를 이용한 페이지 이동
		JSForward.alertAndMove(response, "게시글이 삭제되었습니다.", "./NoticeList.foo?pageNum=" + pageNum);
		return null;
	}

}
