package com.fooeating.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fooeating.commons.Action;
import com.fooeating.commons.ActionForward;
import com.fooeating.db.PublicDAO;
import com.fooeating.db.RestaurantDTO;

public class ListFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		System.out.println(" M : listFormAction_execute() 호출");
		
		// 한글 처리
		request.setCharacterEncoding("UTF-8");
		
		PublicDAO dao = new PublicDAO();
		List<RestaurantDTO> listForm = dao.getlistForm();
		System.out.println("회원 수 : " + listForm.size());
		
		request.setAttribute("listForm", listForm);
		
		ActionForward forward = new ActionForward();
		// 연결된 view에 출력
		forward.setPath("./list/listForm.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
}
