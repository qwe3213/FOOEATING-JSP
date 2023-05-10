package com.fooeating.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fooeating.commons.Action;
import com.fooeating.commons.ActionForward;
import com.fooeating.commons.JSForward;


public class MemberLogoutAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		
		System.out.println("M : MemberLogoutAction_execute()");
		
		// 세션정보 초기화
		HttpSession session = request.getSession();
		session.invalidate();
		System.out.println("M : 세션정보 초기화 완료");
		
		// Main.foo 페이지 이동
		JSForward.alertAndMove(response, "로그아웃 되었습니다.", "./Main.foo");
		return null;
	}
	
}
