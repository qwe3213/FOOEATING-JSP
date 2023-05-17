package com.fooeating.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fooeating.commons.Action;
import com.fooeating.commons.ActionForward;
import com.fooeating.commons.JSForward;
import com.fooeating.db.PublicDAO;
import com.fooeating.db.RestaurantDTO;

public class OwnerNoticeAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		    System.out.println("공지사항 가즈아~~~~");
		    
		    
		    //한글처리
			request.setCharacterEncoding("UTF-8");
			
			// rest_notice 정보 저장
		    String rest_notice = request.getParameter("rest_notice");
		    String rest_id = request.getParameter("rest_id");
		    
		    PublicDAO dao = new PublicDAO();
		    dao.OwnergetNotice(rest_notice,rest_id);
		
		    JSForward.alertAndMove(response, "공지사항 작성이 완료되었습니다.", "./OwnerMainPageRstcareAction.on");
		   
		    return null;
	}

	 
}
