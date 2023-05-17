package com.fooeating.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fooeating.commons.Action;
import com.fooeating.commons.ActionForward;
import com.fooeating.db.PublicDAO;
import com.fooeating.db.ReivewDTO;

public class OwnerReviewAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
           
		   System.out.println("리뷰액션페이지 넘어가보자"); 
		   
		   HttpSession session = request.getSession();
		   
		   String user_id = (String)session.getAttribute("user_id");
		   System.out.println(user_id);
		   
		   //한글처리
		   request.setCharacterEncoding("UTF-8");
		   
		   ReivewDTO dto = new ReivewDTO();
		   
		   PublicDAO dao = new PublicDAO();
		   List<ReivewDTO> reviewList = new ArrayList<ReivewDTO>();
		   reviewList = dao.OwnergetReview(user_id);
		   
		   request.setAttribute("reviewList", reviewList);
		   System.out.println("reviewList : "+reviewList);
		   
		   ActionForward forward = new ActionForward();
		   
		   forward.setPath("./owner/ownerReviewPage.jsp");
		   forward.setRedirect(false);
		   
		return forward;
	}

}
