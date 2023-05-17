package com.fooeating.member.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fooeating.commons.Action;
import com.fooeating.commons.ActionForward;
import com.fooeating.db.PublicDAO;
import com.fooeating.db.ReivewDTO;
import com.fooeating.db.RestaurantDTO;
import com.fooeating.db.UserDTO;

public class MemberLikeList implements Action {

	@Override
	public ActionForward execute(HttpServletRequest requeest, 
			HttpServletResponse response) throws Exception {
		
		System.out.println(" M : MemberLikeList_execute() 호출 ");
		
		// 세션정보 제어
		HttpSession session = requeest.getSession();
		String id = (String)session.getAttribute("user_id");
		
		ActionForward forward = new ActionForward();
		
		if(id == null) {
			forward.setPath("./MemberLogin.foo");
			forward.setRedirect(true);
			return forward;
		}
		
		// 회원 찜한 매장 리스트 가져오기
		PublicDAO dao = new PublicDAO();
	
		List<RestaurantDTO> likeList =  dao.getMemberLikeList(id);
		System.out.println("찜한 매장 개수 : "+likeList.size());
		
		// 정보저장 (request영역)
		requeest.setAttribute("likeList", likeList);
		
		// ./member/updateForm.jsp 출력
		forward.setPath("./member/MemberLikeFrom.jsp");
		forward.setRedirect(false);
		
		System.out.println(" M : 정보조회 저장, 처리 끝");
		
		return forward;
	}
	

}
