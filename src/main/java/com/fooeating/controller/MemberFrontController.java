package com.fooeating.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.fooeating.commons.Action;
import com.fooeating.commons.ActionForward;
import com.fooeating.member.action.ChangePwAction;
import com.fooeating.member.action.FaqList;
import com.fooeating.member.action.IdCheckAction;
import com.fooeating.member.action.MemberDeleteAction;
import com.fooeating.member.action.MemberJoinAction;
import com.fooeating.member.action.MemberLoginAction;
import com.fooeating.member.action.MemberLogoutAction;
import com.fooeating.member.action.MemberUpdateAction;
import com.fooeating.member.action.MemberUpdateProAction;
import com.fooeating.member.action.MyReviewAction;
import com.fooeating.member.action.NoticeContentAction;
import com.fooeating.member.action.NoticeContentActionPro;
import com.fooeating.member.action.NoticeDeleteAction;
import com.fooeating.member.action.NoticeListAction;
import com.fooeating.member.action.NoticeUpdateAction;
import com.fooeating.member.action.NoticeWriteAction;
import com.fooeating.member.action.ReviewDelete;
import com.fooeating.member.action.ReviewUpdate;
import com.fooeating.member.action.ReviewUpdateAction;

public class MemberFrontController extends HttpServlet {
	
	
		
	// http://localhost:8088/FOOEATING/MemberJoin.foo
	// http://localhost:8088/FOOEATING/MemberLogin.foo
	// http://localhost:8088/FOOEATING/Main.foo
	
	
	
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

		
		
		/* 패턴1 : 처리작업 x (DB사용x), view 페이지(.foo와 연결된) 이동
		   패턴2 : 처리작업 o (DB사용o), 페이지(전혀 다른 페이지) 이동
		           처리작업 o (DB사용x), 페이지(전혀 다른 페이지) 이동
		   패턴3 : 처리작업 o (DB사용o), view 페이지(.foo와 연결된) 이동 + 출력  */
		
		
		
		// 1. 회원가입
		if(command.equals("/MemberJoin.foo")) {
			System.out.println("C : /MemberJoin.foo 실행");
			System.out.println("C : DB사용x, view 페이지 이동 (패턴1");
			
			forward = new ActionForward();
			forward.setPath("./member/insertForm.jsp");
			forward.setRedirect(false);
		}

		
		// 1-1. 회원가입 데이터 처리
		
		else if(command.equals("/MemberJoinAction.foo")) {
			System.out.println("C : /MemberJoinAction.foo 실행");
			System.out.println("C : DB사용o, 페이지 이동 (패턴2)");
			
			// 액션객체의 execute() 메서드 사용
			action = new MemberJoinAction();
			try {
                forward = action.execute(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
      
		}
		
		// 1-2 회원가입 아이디중복 데이터 처리
		else if(command.equals("/IdCheckAction.foo")) {
			System.out.println("C : /IdCheckAction.foo 실행");
			
			action = new IdCheckAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
		// 2. 로그인
		if(command.equals("/MemberLogin.foo")) {
			System.out.println(" C : /MemberLogin.foo 실행");
			System.out.println(" C : DB사용x, view 페이지 이동 (패턴1)");
			
			forward = new ActionForward();
			forward.setPath("./member/loginForm.jsp");
			forward.setRedirect(false);
		}
		
		// 2-1. 로그인 데이터 처리
		else if(command.equals("/MemberLoginAction.foo")) {
			System.out.println(" C : /MemberLoginAction.foo 실행");
			System.out.println(" C : DB사용o, 페이지 이동 (패턴2)");
			
			action = new MemberLoginAction();
      
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		
		
		
		// 3. 메인 페이지
		else if(command.equals("/Main.foo")) {
			System.out.println(" C : /Main.foo 실행");
			System.out.println(" C : DB사용x, view 페이지 이동 (패턴1)");
			
			forward = new ActionForward();
			forward.setPath("./main/main.jsp");
			forward.setRedirect(false);
		}
		
		
		
		// 4. 로그아웃
		else if(command.equals("/MemberLogout.foo")) {
			System.out.println(" C : /MemberLogout.foo 실행");
			System.out.println(" C : 처리작업o, 페이지 이동 (패턴2)");
			
			action = new MemberLogoutAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
		// 5-1. 회원 정보 수정 정보입력 페이지
		else if(command.equals("/MemberUpdate.foo")) {
			System.out.println(" C : /MemberUpdate.foo 호출 ");
			System.out.println(" C : DB사용o, view 페이지 이동 & 출력 (패턴3)");
			
			// MemberUpdateAction() 객체
			action = new MemberUpdateAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		// 5-2. 회원정보 수정 수정버튼 클릭시
		else if(command.equals("/MemberUpdateProAction.foo")) {
			System.out.println(" C : /MemberUpdateProAction.foo 호출 ");
			System.out.println(" C : DB사용o, 페이지 이동 (패턴2) ");
			
			// MemberUpdateProAction() 객체
			action = new MemberUpdateProAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} 
		
		// 5-3. 비밀번호 변경 시 팝업창 호출
		else if (command.equals("/ChangePw.foo")) {
			System.out.println(" C : /ChangePw.foo 호출 ");
			System.out.println(" C : DB사용x, view 페이지 이동 (패턴1)");
			
			forward = new ActionForward();
			forward.setPath("./member/changePw.jsp");
			forward.setRedirect(false);
		}
		
		// 5-4. 비밀번호 수정버튼 클릭시
		else if(command.equals("/ChangePwAction.foo")) {
			System.out.println(" C : /ChangePwAction.foo 호출 ");
			System.out.println(" C : DB사용o, 페이지 이동 (패턴2) ");
			
			// ChangePwAction() 객체
			action = new ChangePwAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} 
		
		// 5-5. 회원 탈퇴 시 팝엉창 호출
		else if (command.equals("/MemberDelete.foo")) {
			System.out.println(" C : /MemberDelete.foo 호출 ");
			System.out.println(" C : DB사용x, view 페이지 이동 (패턴1)");
					
			forward = new ActionForward();
			forward.setPath("./member/memberDelete.jsp");
			forward.setRedirect(false);
		}
		
		// 5-6. 회원 탈퇴 버튼  클릭시
		else if(command.equals("/MemberDeleteAction.foo")) {
			System.out.println(" C : /MemberDeleteAction.foo 호출 ");
			System.out.println(" C : DB사용o, 페이지 이동 (패턴2) ");
					
			// MemberDeleteAction() 객체
			action = new MemberDeleteAction();
					
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} 
		
		
		
		// 6. 마이페이지
		else if(command.equals("/MyPageMember.foo")) {
			System.out.println(" C : /MyPage.foo 실행");
			System.out.println(" C : DB사용x, view 페이지 이동 (패턴1)");
			
			forward = new ActionForward();
			forward.setPath("./member/myPageMember.jsp");
			forward.setRedirect(false);
		}
		
		// 6-1. 마이페이지 - 리뷰 관리
		else if(command.equals("/MyReview.foo")) {
			System.out.println(" C : /MyReview.foo 호출 ");
			System.out.println(" C : DB사용o, view이동&출력(패턴3) ");
			
			// MyReviewAction() 객체
			action = new MyReviewAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		// 6-2. 마이페이지 - 리뷰관리 수정버튼 클릭 시 정보를 저장할 액션페이지 호출
		else if(command.equals("/ReviewUpdate.foo")) {
			System.out.println(" C : /ReviewUpdate.foo 호출 ");
			System.out.println(" C : DB사용o, view이동&출력(패턴3) ");
			
			// MemberUpdateAction() 객체
			action = new ReviewUpdate();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		// 6-3. 마이페이지 - 리뷰관리 수정버튼 클릭 시 수정팝업창 호출
		else if(command.equals("/ReviewUpdatePop.foo")) {
			System.out.println(" C : /ReviewUpdatePop.foo 실행");
			System.out.println(" C : DB사용x, view 페이지 이동 (패턴1)");
			
			forward = new ActionForward();
			forward.setPath("./member/reviewUpdate.jsp");
			forward.setRedirect(false);
		}
		
		// 6-4. 마이페이지 - 리뷰관리 완료버튼 클릭시 정보 수정 및 부모창 새로고침
		else if(command.equals("/ReviewUpdateAction.foo")) {
			System.out.println(" C : /ReviewUpdateAction.foo 호출 ");
			System.out.println(" C : DB사용o, 페이지 이동 (패턴2) ");
			
			// MemberUpdateProAction() 객체
			action = new ReviewUpdateAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		// 6-5. 마이페이지 - 리뷰삭제
		else if(command.equals("/ReviewDelete.foo")) {
			System.out.println(" C : /ReviewDelete.foo 호출 ");
			System.out.println(" C : DB사용o, 페이지 이동 (패턴2) ");
					
			// MemberDeleteAction() 객체
			action = new ReviewDelete();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} 
		
		
		
		// 7. 공지사항 (리스트)
		else if(command.equals("/NoticeList.foo")) {
			System.out.println(" C : /NoticeList.foo 실행");
			System.out.println(" C : DB사용o, view페이지 이동 & 출력 (패턴3)");
			
			action = new NoticeListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		// 7-1. 공지사항 (글쓰기)
		else if(command.equals("/NoticeWrite.foo")) {
			System.out.println(" C : /NoticeWrite.foo 실행");
			System.out.println(" C : DB사용x, view 페이지 이동 (패턴1)");
		
			forward = new ActionForward();
			forward.setPath("./notice/noticeWrite.jsp");
			forward.setRedirect(false);
		}
		
		// 7-1-1. 공지사항 (글쓰기) - 데이터 처리
		else if(command.equals("/NoticeWriteAction.foo")) {
			System.out.println(" C : /NoticeWriteAction.foo 실행");
			System.out.println(" C : DB사용o, view 페이지 이동 & 출력 (패턴3) ");
			
			action = new NoticeWriteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		// 7-2. 공지사항 (컨텐츠 보기)
		else if(command.equals("/NoticeContentAction.foo")) {
			System.out.println(" C : /NoticeContentAction.foo 실행");
			System.out.println(" C : DB사용o, view 페이지 이동 & 출력 (패턴3)");
			
			action = new NoticeContentAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		// 7-3. 공지사항 (수정)
		else if(command.equals("/NoticeUpdateAction.foo")) {
			System.out.println("/NoticeUpdateAction.foo 실행");
			System.out.println(" C : DB사용o, view 페이지 이동 & 출력 (패턴3)");
			
			action = new NoticeUpdateAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		// 7-3-1. 공지사항 (수정) - 데이터처리
		else if(command.equals("/NoticeContentActionPro.foo")) {
			System.out.println("/NoticeContentActionPro.foo 실행");
			System.out.println(" C : DB사용o, view 페이지 이동 & 출력 (패턴3)");
			
			action = new NoticeContentActionPro();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		// 7-4. 공지사항 (삭제)
		else if(command.equals("/NoticeDeleteAction.foo")) {
			System.out.println("/NoticeDeleteAction.foo 실행");
			System.out.println(" C : DB사용o, view 페이지 이동 (패턴2)");
			
			action = new NoticeDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}


    
		// 8. FaqList 페이지 이동
		else if(command.equals("/FaqList.foo")) {
			System.out.println(" C : /FaqList.foo 실행");
			System.out.println(" C : DB사용o, view 페이지 이동 & 출력 (패턴3) ");
			
			action = new FaqList();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		
		
		// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
		
		
		
		// 1. 예약
		
		
		
		
		
		
		

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
