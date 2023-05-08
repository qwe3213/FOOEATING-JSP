package com.fooeating.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fooeating.commons.Action;
import com.fooeating.commons.ActionForward;
import com.fooeating.db.PublicDAO;
import com.fooeating.db.UserDTO;

public class UserInfoListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" UserInfoListAction_execute() 호출");
		
		// 세션 제어
		
		// 회원정보 저장
		PublicDAO dao = new PublicDAO();
//		List<UserDTO> userList = dao.getUserList();
//		System.out.println("회원 수 : " + userList.size());
		
//		request.setAttribute("userList", userList);
		
		ActionForward forward = new ActionForward();
		// 연결된 view에 출력
		forward.setPath("./admin/userList.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
