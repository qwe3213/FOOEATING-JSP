package com.fooeating.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fooeating.commons.Action;
import com.fooeating.commons.ActionForward;
import com.fooeating.db.PublicDAO;
import com.fooeating.db.ReivewDTO;
import com.fooeating.db.RestaurantDTO;
import com.fooeating.db.Restaurant_menuDTO;
import com.fooeating.db.UserDTO;

public class OwnerMenuList implements Action {

	@Override
	public ActionForward execute(HttpServletRequest requeest, 
			HttpServletResponse response) throws Exception {
		
		System.out.println(" M : OwnerMenuList_execute() 호출 ");
		
		// 세션정보 제어
		HttpSession session = requeest.getSession();
		String user_id = (String)session.getAttribute("user_id");
		
		ActionForward forward = new ActionForward();
		
		if(user_id == null) {
			forward.setPath("./MemberLogin.foo");
			forward.setRedirect(true);
			return forward;
		}
		
		// 점주 메뉴 리스트 가져오기
		PublicDAO dao = new PublicDAO();
	
		List<Restaurant_menuDTO> menuList =  dao.getOwnerMenuList(user_id);
		System.out.println("메뉴 리스트 수 : "+menuList.size());
		
		// 정보저장 (request영역)
		requeest.setAttribute("menuList", menuList);
		
		// ./member/updateForm.jsp 출력
		forward.setPath("./owner/ownerMenuList.jsp");
		forward.setRedirect(false);
		
		System.out.println(" M : 정보조회 저장, 처리 끝");
		
		return forward;
	}
	

}
