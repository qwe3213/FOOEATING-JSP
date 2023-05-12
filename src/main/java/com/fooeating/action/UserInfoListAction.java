package com.fooeating.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fooeating.commons.Action;
import com.fooeating.commons.ActionForward;
import com.fooeating.db.PublicDAO;
import com.fooeating.db.UserDTO;

public class UserInfoListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" UserInfoListAction_execute() 호출");
		
		// 세션 제어
		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("user_id");
		
		ActionForward forward = new ActionForward();
		if(user_id == null || !user_id.equals("real_admin")) {
			forward.setPath("./Main.foo");
			forward.setRedirect(true);
			return forward;
		}
		
		// 회원정보 저장
		PublicDAO dao = new PublicDAO();


		// 페이징 처리 -----------------
		int count = dao.getUserCount(); 			// 전체 회원 수
		System.out.println("회원 수 : " + count);
		
		int pageSize = 10;							// 한 페이지에 출력할 회원 수
		
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) { pageNum = "1"; }				// 현재 페이지 정보 체크
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;	// 시작행 번호 계산
		int endRow = currentPage * pageSize;				// 끝행 번호 계산
		// 페이징 처리 -----------------
		
		List<UserDTO> userList = dao.getUserList(startRow, pageSize);
		
		request.setAttribute("userList", userList);
		request.setAttribute("count", count);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("pageNum", pageNum);

		
		// 연결된 view에 출력
		forward.setPath("./admin/userList.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
