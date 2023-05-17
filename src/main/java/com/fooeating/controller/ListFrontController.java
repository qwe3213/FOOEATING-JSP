package com.fooeating.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fooeating.action.ListFormAction;
import com.fooeating.action.RestaurantFormAction;
import com.fooeating.action.RestaurantInfoHeartAdd;
import com.fooeating.action.RestaurantInfoHeartRemove;
import com.fooeating.action.WaitingCheckProAction;
import com.fooeating.commons.Action;
import com.fooeating.commons.ActionForward;

public class ListFrontController extends HttpServlet {
	
		// http://localhost:8088/FOOEATING/listForm.fd
		// http://localhost:8088/FOOEATING/restaurantForm.fd

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

		
		if(command.equals("/listForm.fd")) {
			System.out.println("  C : /listForm.fd 실행");
			System.out.println("  C : DB사용o, view 페이지 이동+출력(패턴3)");

			action = new ListFormAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 지도
//		else if (command.equals("/TestMap.fd")) {
//			System.out.println("  C : /TestMap.fd 실행");
//			System.out.println("  C : DB사용o, view 페이지 이동+출력(패턴3)");
//			
//			action = new MapFormAction();
//			try {
//				forward = action.execute(request, response);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}
		
		else if(command.equals("/restaurantForm.fd")) {
			System.out.println("  C : /RestaurantForm.ad 실행");
			System.out.println("  C : DB사용o, view 페이지 이동+출력(패턴3)");

			action = new RestaurantFormAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} 

		else if(command.equals("/WaitingCheck.fd")) {
			System.out.println("  C : /WaitingCheck.fd 실행");
			System.out.println("  C : DB사용x, view 페이지 이동(패턴1)");
			
			forward = new ActionForward();
			forward.setPath("./list/waitingCheck.jsp");
			forward.setRedirect(false);
		}
		
		else if(command.equals("/WaitingCheckPro.fd")) {
			System.out.println("  C : /WaitingCheckPro.fd 실행");
			System.out.println("  C : DB사용o, 페이지 이동(패턴2)");
			
			action = new WaitingCheckProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		else if(command.equals("/WaitingCheckResult.fd")) {
			System.out.println("  C : /WaitingCheckResult.fd 실행");
			System.out.println("  C : DB사용x, view 페이지 이동(패턴1)");
			
			forward = new ActionForward();
			forward.setPath("./list/waitingCheckResult.jsp");
			forward.setRedirect(false);
		}
		
		// 가게 상세페이지 유저가 빈하트 클릭 시 기능
		else if (command.equals("/RestaurantInfoHeartAdd.fd")) {
			System.out.println(" C : /RestaurantInfoHeartAdd.fd 실행");
			
			action = new RestaurantInfoHeartAdd();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		// 가게 상세페이지 유저가 꽉찬하트 클릭 시 기능
				else if (command.equals("/RestaurantInfoHeartRemove.fd")) {
					System.out.println(" C : /RestaurantInfoHeartRemove.fd 실행");
					
					action = new RestaurantInfoHeartRemove();

					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
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
		// TODO Auto-generated method stub
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}


	
}
