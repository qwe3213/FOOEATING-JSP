package com.fooeating.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fooeating.commons.Action;
import com.fooeating.commons.ActionForward;
import com.fooeating.db.PublicDAO;

public class idCheckAction implements Action{

    @Override
    public ActionForward execute(HttpServletRequest request, 
            HttpServletResponse response) throws Exception {
        
        // 인코딩
        request.setCharacterEncoding("UTF-8");
        
        // 아이디 저장
        String id = request.getParameter("user_id");
        PublicDAO dao = new PublicDAO();
       
        int idCheck = dao.checkId(id);
        if (idCheck==0) {
        	ActionForward forward = new ActionForward();
        	forward.setPath("./member/idCheck.jsp?userid=0");
        	forward.setRedirect(true);
        	return forward;
			
		}else {
			ActionForward forward = new ActionForward();
        	forward.setPath("./member/idCheck.jsp?userid=1");
        	forward.setRedirect(true);
        	return forward;
		}
        
    }
    
} 
