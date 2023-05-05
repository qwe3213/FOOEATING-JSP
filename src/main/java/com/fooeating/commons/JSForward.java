package com.fooeating.commons;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

// JS 사용 페이지 이동
public class JSForward {
	
	// 1. alert 메세지 출력 + 페이지 뒤로가기
	public static void alertAndBack(HttpServletResponse response, String msg) {
		try {
			// 인코딩
			response.setContentType("text/html; charset=UTF-8");
			
			// 출력문
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('"+ msg +"');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	// 2. alert 메세지 출력 + 원하는 위치로 이동
	public static void alertAndMove(HttpServletResponse response, String msg, String location) {
		
		try {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('"+ msg +"');");
			out.println("location.href='"+ location +"';");
			out.println("</script>");
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 3. alert 메세지 출력 + 팝업창 닫기
	public static void alertAndClose(HttpServletResponse response, String msg) {
		try {
			// 인코딩
			response.setContentType("text/html; charset=UTF-8");
			
			// 출력문
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('"+ msg +"');");
			out.println("window.close();");
			out.println("</script>");
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
