package com.fooeating.commons;


public class ActionForward{
	
	private String path;			// 이동할 페이지 주소(목적지)
	private boolean isRedirect;		// 이동할 방식(직행 or 환승 등...)
	// 이동방식 설정 (교재 p.143)
	// true  - sendRedirect 방식 (화면 전환o, 주소 전환o)
	// false = forward 방식 (화면 전환o, 주소 전환x)

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public boolean isRedirect() {
		return isRedirect;
	}

	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
}
