package com.fooeating.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fooeating.action.ownerRequestSuccessAction;
import com.fooeating.commons.Action;
import com.fooeating.commons.ActionForward;

public class RestaurantFrontController extends HttpServlet {
	
	
	
	// http://localhost:8088/FOOEATING/ownerChangeForm.on
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("doProcess() 호출");

		/* ===================== 1. 가상 주소 계산 ====================== */
		
		System.out.println("1. 가상주소 계산 시작");

		String requestURI = request.getRequestURI();
		System.out.println("  requestURI : " + requestURI);
		String ctxPath = request.getContextPath();
		System.out.println("  ctxPath : " + ctxPath);
		String command = requestURI.substring(ctxPath.length());
		System.out.println("  command : " + command);

		System.out.println("1. 가상주소 계산 끝");
		
		/* ===================== 1. 가상 주소 계산 ====================== */


		
		
		
		/* ===================== 2. 가상 주소 매핑 ====================== */
		
		System.out.println("\n2. 가상주소 매핑 시작");

		Action action = null;
		ActionForward forward = null;
		
		/* 패턴1 : 처리작업 x (DB사용x), view 페이지(.me와 연결된) 이동
		 * 패턴2 : 처리작업 o (DB사용o), 페이지(전혀 다른 페이지) 이동
		 * 패턴3 : 처리작업 o (DB사용o), view 페이지(.me와 연결된) 이동 + 출력 */

		
		
		// ----- 여기 아래에 else if로 각자 command 가상주소 코드 작성 -----
		if(command.equals("/ownerChangeForm.on")) {
			System.out.println("  C : /RestaurantJoin.on 실행");
			System.out.println("  C : DB사용x, view 페이지 이동");
			
			// 페이지 이동
			forward = new ActionForward();
			forward.setPath("./owner/ownerChangeForm.jsp");
			forward.setRedirect(false);	
		} // ownerChangeForm.jsp
		
		else if(command.equals("/ownerChangeForm2.on")) {
			System.out.println("  C : /ownerChangeForm2.on 실행");
			System.out.println("  C : DB사용x, view 페이지 이동");
			
			// 페이지 이동
			forward = new ActionForward();
			forward.setPath("./owner/ownerChangeForm2.jsp");
			forward.setRedirect(false);	
		} // ownerChangeForm2.jsp
		
		else if(command.equals("/ownerChangeForm3.on")) {
			System.out.println("  C : /ownerChangeForm3.on 실행");
			System.out.println("  C : DB사용x, view 페이지 이동");
			
			// 페이지 이동
			forward = new ActionForward();
			forward.setPath("./owner/ownerChangeForm3.jsp");
			forward.setRedirect(false);	
		} // ownerChangeForm3.jsp
		
		else if(command.equals("/ownerChangeForm4.on")) {
			System.out.println("  C : /ownerChangeForm4.on 실행");
			System.out.println("  C : DB사용x, view 페이지 이동");
			
			// 페이지 이동
			forward = new ActionForward();
			forward.setPath("./owner/ownerChangeForm4.jsp");
			forward.setRedirect(false);	
		} // ownerChangeForm4.jsp
		
		else if(command.equals("/ownerRequestSuccessAction.on")) {
			 System.out.println(" C : /ownerRequestSuccessAction.on 실행");
			 System.out.println(" C : DB사용o , 페이지 이동(패턴2)");
	
		  action = new ownerRequestSuccessAction();
		  try {
			forward = action.execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
			 
		}
		
	
		
		// ----- 여기 아래에 else if로 각자 command 가상주소 코드 작성 -----

		System.out.println("2. 가상주소 매핑 끝\n");
		
		/* ===================== 2. 가상 주소 매핑 ====================== */


		
		
		
		/* ===================== 3. 가상 주소 이동 ====================== */
		
		System.out.println("3. 가상주소 이동 시작");
		
		if(forward != null) {	 //이동정보가 있을때
			if(forward.isRedirect()) {		// 페이지 이동방식 - true
				System.out.println("  C : sendRedirect방식 - " + forward.getPath() + "이동");
				response.sendRedirect(forward.getPath());
			} else {						// 페이지 이동방식 - false
				System.out.println("  C : forward방식 - " + forward.getPath() + "이동");
				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}
		}
		System.out.println("3. 가상주소 이동 끝");
		
		/* ===================== 3. 가상 주소 이동 ====================== */
		
		
		
		
		
		System.out.println("doProcess 끝(컨트롤러 종료)");
	}	// doProcess()

	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet() 호출");
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost() 호출");
		doProcess(request, response);
	}

}
