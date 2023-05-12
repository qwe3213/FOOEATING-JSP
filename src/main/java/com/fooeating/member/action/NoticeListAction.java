package com.fooeating.member.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fooeating.commons.Action;
import com.fooeating.commons.ActionForward;
import com.fooeating.db.NoticeDTO;
import com.fooeating.db.PublicDAO;
import com.fooeating.db.UserDTO;

public class NoticeListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 공지사항 게시글 저장
		PublicDAO dao = new PublicDAO();
		
		// 페이징 처리
		// 1. 전체 글의 개수
		int count = dao.getBoardCount();
		
		// 2. 한 페이지에 출력할 글의 개수
		int pageSize = 5;

		// 3. 현 페이지 정보가 몇 페이지인지 체크
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null){
			pageNum = "1";
		}
		
		// 4. 각 페이지별 시작행 끝행 번호 계산
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		
		List<NoticeDTO> noticeList = dao.getNoticeList(startRow, pageSize);
		
		request.setAttribute("noticeList", noticeList);
		request.setAttribute("count", count);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("pageNum", pageNum);
		
		System.out.println(noticeList);
		
		// 페이지 이동 (출력)
		ActionForward forward = new ActionForward();
		forward.setPath("./notice/notice.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
