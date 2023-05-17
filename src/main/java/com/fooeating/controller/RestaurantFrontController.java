package com.fooeating.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.fooeating.action.ownerMainPageReviewAction;

import com.fooeating.action.OwnerMainPageRstcareAction;
import com.fooeating.action.OwnerMenuAddAction;
import com.fooeating.action.OwnerMenuDeleteAction;
import com.fooeating.action.OwnerMenuList;
import com.fooeating.action.OwnerMenuUpdate;
import com.fooeating.action.OwnerMenuUpdateAction;
import com.fooeating.action.OwnerNoticeAction;
import com.fooeating.action.OwnerReviewAction;
import com.fooeating.action.RestaurantUpdateAction;
import com.fooeating.action.RestaurantUpdateProAction;
import com.fooeating.action.OwnerWaitingListAction;
import com.fooeating.action.OwnerWaitingListPopupAction;
import com.fooeating.action.RestOnOffAction;

import com.fooeating.action.ownerRequestSuccessAction;
import com.fooeating.commons.Action;
import com.fooeating.commons.ActionForward;
import com.fooeating.member.action.ReviewWrite;

public class RestaurantFrontController extends HttpServlet {
	
	
	

	// http://localhost:8088/FOOEATING/ownerChangeForm.on
	// http://localhost:8088/FOOEATING/ownerChangeForm.on

	// http://localhost:8088/FOOEATING/ownerChangeForm4.on
	
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
		} 
		
		else if(command.equals("/ownerRequestSuccessAction.on")) {
			 System.out.println(" C : /ownerRequestSuccessAction.on 실행");
			 System.out.println(" C : DB사용o , 페이지 이동(패턴2)");
	
		  action = new ownerRequestSuccessAction();
		  try {
			forward = action.execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
			 
		} // ownerRequestSuccessAction

		// 점주의 마이페이지 - 가게 관리
		else if(command.equals("/Main.foo")) {
			System.out.println("C : /Main.foo 실행");
			System.out.println("C : DB사용o, 페이지 이동 & 출력(패턴3)");
			
			action = new OwnerWaitingListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		else if(command.equals("/ownerMainPage_review.on")) {
			System.out.println(" C : ownerMainPage_review.on 호출");
			System.out.println(" C : DB사용o , 페이지 이동, 출력(패턴3)");
			
			// ownerMainPageReviewAction() 객체
			action = new ownerMainPageReviewAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} // ownerMainPage_review
		
		
		// 점주의 마이페이지 - 대기 관리
		else if(command.equals("/OwnerWaitingList.on")) {
			System.out.println("C : /OwnerWaitingList.on 실행");
			System.out.println("C : DB사용o, 페이지 이동 & 출력(패턴3)");
			
			action = new OwnerWaitingListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 점주의 마이페이지 - 대기 관리 - 팝업
		else if(command.equals("/OwnerWaitingListPopup.on")) {
			System.out.println("C : /OwnerWaitingListPopup.on 실행");
			System.out.println("C : DB사용x, 팝업창 이동 (패턴1)");
			
			forward = new ActionForward();
			forward.setPath("./owner/ownerWaitingListPopup.jsp");
			forward.setRedirect(false);
		}
		
		
		// 점주의 마이페이지 - 대기 관리 - 팝업 처리
		else if(command.equals("/OwnerWaitingListPopupAction.on")) {
			System.out.println("C : /OwnerWaitingListPopupAction.on 실행");
			System.out.println("C : DB사용o, 페이지 이동 (패턴2)");
			
			action = new OwnerWaitingListPopupAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		else if(command.equals("/OwnerMainPageRstcareAction.on")) {
			 System.out.println(" /OwnerMainPageRstcareAction.on");
			 System.out.println(" 패턴 3 ");
             
	         action = new OwnerMainPageRstcareAction();
	         try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			   
		}
		
		else if(command.equals("/RestaurantUpdateProAction.on")) {
			System.out.println(" /RestaurantUpdateProActionPro.on");
			System.out.println(" 패턴 3 ");
			
			action = new RestaurantUpdateProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(command.equals("/RestaurantUpdateAction.on")) {
			System.out.println(" C : RestaurantUpdateAction.on 호출 ");
			System.out.println("패턴 3 ");
			
			action = new RestaurantUpdateAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		
		
		
		// 가게 on_off 설정
		else if (command.equals("/RestOnOffAction.on")) {
			System.out.println(" C : RestOnOffAction.on 호출 ");
			System.out.println("패턴 2 ");
			
			action = new RestOnOffAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		else if (command.equals("/RestOnOffResult.on")) {
			System.out.println(" C : RestOnOffResult.on 호출");
			System.out.println("패턴 1");
			
			forward = new ActionForward();
			forward.setPath("./owner/restOnOffResult.jsp");
			forward.setRedirect(false);
		}
		
		else if(command.equals("/ownerReviewPage.on")) {
			System.out.println(" C : / ownerReviewPage.on 실행");
			System.out.println(" 패턴3");
			
			action = new OwnerReviewAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		// 점주 메뉴관리 
		else if(command.equals("/OwnerMenu.on")) {
			System.out.println(" C : / OwnerMenu.on 실행");
			System.out.println(" 패턴3");
			
			action = new OwnerMenuList();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		// 점주 메뉴 수정 팝업창에 정보 가져가기
		else if (command.equals("/OwnerMenuUpdate.on")) {
			System.out.println(" C : /OwnerMenuUpdate.on 호출 ");
			System.out.println(" C : DB사용o, 페이지이동(패턴2) ");

			// OwnerMenuUpdate() 객체
			action = new OwnerMenuUpdate();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		// 점주 메뉴 수정 클릭시 정보 수정
		
		else if (command.equals("/OwnerMenuUpdateAction.on")) {
			System.out.println(" C : /OwnerMenuUpdateAction.on 호출 ");
			System.out.println(" C : DB사용o, 페이지이동(패턴2) ");

			// OwnerMenuUpdateAction() 객체
			action = new OwnerMenuUpdateAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		// 점주 메뉴 삭제
		
		else if (command.equals("/OwnerMenuDelete.on")) {
			System.out.println(" C : /OwnerMenuDelete.on 호출 ");
			System.out.println(" C : DB사용o, 페이지이동(패턴2) ");

			// OwnerMenuUpdateAction() 객체
			action = new OwnerMenuDeleteAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		// 점주 메뉴 추가 jsp로 이동
		
		else if (command.equals("/OwnerMenuAdd.on")) {
			System.out.println(" C : /OwnerMenuAdd.on 호출 ");
			System.out.println(" C : DB사용o, 페이지이동(패턴2) ");
			
			// 페이지 이동
			forward = new ActionForward();
			forward.setPath("./owner/ownerMenuAdd.jsp");
			forward.setRedirect(false);
		}
		
		// 점주 메뉴 추가
		else if (command.equals("/OwnerMenuAddAction.on")) {
			System.out.println(" C : /OwnerMenuAddAction.on 호출 ");
			System.out.println(" C : DB사용o, 페이지이동(패턴2) ");
				// OwnerMenuUpdateAction() 객체
			action = new OwnerMenuAddAction();
					
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		else if(command.equals("/OwnerNoticeAction.on")) {
			System.out.println(" C: / OwnerNoticeAction 실행");
			System.out.println(" C: / 패턴2");
        
		action = new OwnerNoticeAction();
		  
		try {
			forward = action.execute(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		}

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
