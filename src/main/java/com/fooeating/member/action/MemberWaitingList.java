package com.fooeating.member.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fooeating.commons.Action;
import com.fooeating.commons.ActionForward;
import com.fooeating.db.FaqDTO;
import com.fooeating.db.NoticeDTO;
import com.fooeating.db.PublicDAO;
import com.fooeating.db.WaitingDTO;

public class MemberWaitingList implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
				
		// 세션정보 제어
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("user_id");
		
		ActionForward forward = new ActionForward();
		
		if(user_id == null) {
			forward.setPath("./MemberLogin.foo");
			forward.setRedirect(true);
			return forward;
		}

		
		// 페이징처리
		PublicDAO dao = new PublicDAO();
		// 1-1. 전체 수 (count)
		int count = dao.getWaitingListBeforeCount(user_id);
		// 1-2. 한 페이지에 출력할 글의 개수
		int pageSize = 5;
		// 1-3. 현 페이지 정보가 몇 페이지인지 체크
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {
		   pageNum = "1";
		}
		// 1-4. 각 페이지별 시작행 끝행 번호 계산
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;


		
		// 대기리스트 정보 저장
		WaitingDTO wDto = dao.getWaiting(user_id);
		WaitingDTO qDto = null;
		if(wDto != null) {
		qDto = dao.getQueue(wDto.getRest_id(), user_id);
		}
		
		List<WaitingDTO> queueHistory = dao.getMemberQueueHistory(user_id, startRow, pageSize);
		
		request.setAttribute("queueHistory", queueHistory);
		request.setAttribute("wDto", wDto);
		request.setAttribute("qDto", qDto);
		request.setAttribute("count", count);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("pageNum", pageNum);

	
		// 페이지 이동 (출력)
		forward.setPath("./member/memberWaitingList.jsp");
		forward.setRedirect(false);
				
		return forward;
	}

}
