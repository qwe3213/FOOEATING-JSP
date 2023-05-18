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
		   
		   // rest_id 정보 저장
		   
		   
		   
		   //페이징처리
		   PublicDAO dao = new PublicDAO();
		   // 1-1. 전체 리뷰 개수 (count)
		   String rest_id = dao.getRest_id(user_id);
		   int count = dao.getOwnerReviewCount(rest_id);
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
		   
		   List<ReivewDTO> reviewList = new ArrayList<ReivewDTO>();
		   reviewList = dao.OwnergetReview(user_id, startRow, pageSize);
		   
		   //request 영역에 저장
		   request.setAttribute("reviewList", reviewList);
		   request.setAttribute("count", count);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("pageSize", pageSize);
			request.setAttribute("pageNum", pageNum);
		   
		   System.out.println("reviewList : "+reviewList);
		   
		   
		   //페이지이동
		   ActionForward forward = new ActionForward();
		   forward.setPath("./owner/ownerReviewPage.jsp");
		   forward.setRedirect(false);
		   return forward;
	}

}
