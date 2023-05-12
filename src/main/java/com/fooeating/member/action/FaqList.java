package com.fooeating.member.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fooeating.commons.Action;
import com.fooeating.commons.ActionForward;
import com.fooeating.db.FaqDTO;
import com.fooeating.db.NoticeDTO;
import com.fooeating.db.PublicDAO;

public class FaqList implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		
		// 공지사항 게시글 저장
				PublicDAO dao = new PublicDAO();
				
				List<FaqDTO> faqList = dao.getFaqList();
				
				request.setAttribute("faqList", faqList);
			
				
				// 페이지 이동 (출력)
				ActionForward forward = new ActionForward();
				forward.setPath("./notice/faq.jsp");
				forward.setRedirect(false);
				
		return forward;
	}

}
