package com.fooeating.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fooeating.commons.Action;
import com.fooeating.commons.ActionForward;
import com.fooeating.db.NoticeDTO;
import com.fooeating.db.PublicDAO;
import com.fooeating.db.RestaurantDTO;
import com.fooeating.db.UserDTO;
import com.fooeating.db.WaitingDTO;

public class OwnerWaitingListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 0. 한글 처리
		request.setCharacterEncoding("UTF-8");
		
		// 1. 전달된 정보 저장
		// 1-1. user_id
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("user_id");
		// 1-2. rest_id
		PublicDAO dao = new PublicDAO();		
		String rest_id = dao.checkRestId(user_id);
		
		
		// 2. 페이징 처리
		// 2-1. 전체 대기 수
		int count = dao.getWaitingCount(rest_id);
		// 2-2. 한 페이지에 출력할 글의 개수
		int pageSize = 10;
		// 2-3. 현 페이지 정보가 몇 페이지인지 체크
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum = "1";
		}
		// 2-4. 각 페이지별 시작행 끝행 번호 계산
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		
		
		// 3. dao 메서드 사용 waitingList 정보 저장 및 페이징처리
//		List<NoticeDTO> noticeList = dao.getNoticeList(startRow, pageSize);
		List waitingList = dao.getWaitingList(user_id, startRow, pageSize);
		
		
		// 4. request 영역에 저장
		request.setAttribute("waitingList", waitingList);
		request.setAttribute("count", count);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("pageNum", pageNum);
		System.out.println(count);
		System.out.println(currentPage);
		System.out.println(pageSize);
		System.out.println(pageNum);

		
		// 5. 페이지 이동 
		ActionForward forward = new ActionForward();
		forward.setPath("./owner/ownerWaitingList.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
