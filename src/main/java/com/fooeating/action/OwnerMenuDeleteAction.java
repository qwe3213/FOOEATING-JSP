package com.fooeating.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fooeating.commons.Action;
import com.fooeating.commons.ActionForward;
import com.fooeating.commons.JSForward;
import com.fooeating.db.PublicDAO;

public class OwnerMenuDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		System.out.println(" M: OwnerMenuDeleteAction_execute() 호출 ");
		
		// 한글처리(인코딩)
		request.setCharacterEncoding("UTF-8");
		
		// 세션정보 제어
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("user_id");
		System.out.println(id);
		// 전달 정보 저장
		int rest_menu_num = Integer.parseInt(request.getParameter("rest_menu_num"));
		
		ActionForward forward = new ActionForward();
		
		if(id == null) {
			forward.setPath("./MemberLogin.foo");
			forward.setRedirect(true);
			return forward;
		}
	
		
		// rest_menu_num 으로 삭제할 메뉴 특정해서 삭제
		PublicDAO dao = new PublicDAO();
			
		int result = dao.deleteMenu(rest_menu_num);
		
		if (result == -1) {
			JSForward.alertAndBack(response, "메뉴 정보 없음(삭제불가)");
			
			return null; // 컨트롤러에서는 이동X
		
		} 
		
		JSForward.alertAndMove(response, "메뉴가 삭제 되었습니다!","./OwnerMenu.on");
		
		return null;

	}
}
