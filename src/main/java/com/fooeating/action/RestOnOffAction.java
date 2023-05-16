package com.fooeating.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fooeating.commons.Action;
import com.fooeating.commons.ActionForward;
import com.fooeating.db.PublicDAO;
import com.fooeating.db.RestaurantDTO;

public class RestOnOffAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : RestOnOffAction_execute() 호출 ");
		
		// 정보 받기
		String on_off = request.getParameter("on_off");
		String rest_id = request.getParameter("rest_id");
		System.out.println("on_off : " + on_off + ", rest_id : " + rest_id);
		
		// DAO - updateRestOnOff();
		PublicDAO dao = new PublicDAO();
		dao.updateRestOnOff(rest_id, on_off);
		
		request.setAttribute("rest_id", rest_id);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./RestOnOffResult.on");
		forward.setRedirect(true);
		
		return forward;
	}

}
