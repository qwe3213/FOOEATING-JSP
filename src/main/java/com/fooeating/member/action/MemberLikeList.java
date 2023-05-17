package com.fooeating.member.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fooeating.commons.Action;
import com.fooeating.commons.ActionForward;
import com.fooeating.db.PublicDAO;
import com.fooeating.db.ReivewDTO;
import com.fooeating.db.RestaurantDTO;
import com.fooeating.db.UserDTO;

public class MemberLikeList implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		
		System.out.println(" M : MemberLikeList_execute() 호출 ");
		
		// 세션정보 제어
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("user_id");
		
		ActionForward forward = new ActionForward();
		
		if(user_id == null) {
			forward.setPath("./MemberLogin.foo");
			forward.setRedirect(true);
			return forward;
		}
		
		
		
		PublicDAO dao = new PublicDAO();
		
	
		// 페이징처리
		// 1-1. 전체 수 (count)
		int count = dao.getLikeRestCount(user_id);
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
		

		// 회원 찜한 매장 리스트 가져오기 (+페이징 처리)
		List<RestaurantDTO> likeList =  dao.getMemberLikeList(user_id, startRow, pageSize);
		System.out.println("찜한 매장 개수 : "+likeList.size());
		

		// 정보저장 (request영역)
		request.setAttribute("likeList", likeList);
		request.setAttribute("count", count);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("pageNum", pageNum);
		
		
		// ./member/updateForm.jsp 출력
		forward.setPath("./member/MemberLikeFrom.jsp");
		forward.setRedirect(false);
		
		System.out.println(" M : 정보조회 저장, 처리 끝");
		
		return forward;
	}
	

}
