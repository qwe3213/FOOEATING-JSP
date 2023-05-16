package com.fooeating.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fooeating.commons.Action;
import com.fooeating.commons.ActionForward;
import com.fooeating.db.PublicDAO;
import com.fooeating.db.RestaurantDTO;

public class ListFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		System.out.println(" M : listFormAction_execute() 호출");
		
		// 한글 처리
		request.setCharacterEncoding("UTF-8");
		
		// 검색어 search(파라미터) 정보를 저장
		String search = request.getParameter("search");
		System.out.println("search : " + search);
		String addr_city = request.getParameter("addr_city");
		String addr_district = request.getParameter("addr_district");
		System.out.println("addr : " + addr_city + ", " + addr_district);
		
		PublicDAO dao = new PublicDAO();
		
		int count = 0;

		if(search != null) { // 검색어만 있을 때
			count = dao.getListCount(search.trim());
			
			if (addr_city != null && addr_district != null) {	// 검색어가 있으면서 지역까지 있을 때
				count = dao.getListCount(search.trim(), addr_city, addr_district);
			}
		} else {
			if (addr_city != null && addr_district != null) {	// 검색어는 없고 지역만 있을 때
				count = dao.getListCount(addr_city, addr_district);
			} else {	// 검색어도 지역도 없을 때
				count = dao.getListCount();
			}
		}
		
		// --------------- 정렬 순서
		
		String rest_id = request.getParameter("rest_id");
		dao.listArrayHeart(rest_id);
		
		
		
		// --------------- 정렬 순서
		
		
		
		
		
//		List<RestaurantDTO> listForm = dao.getlistForm();
//		System.out.println("회원 수 : " + listForm.size());
		
		
		ActionForward forward = new ActionForward();
		
		// 페이징 처리 -----------------
//		int count = dao.getListCount(); 			// 전체 가게 수
//		System.out.println("가게수 : " + count);
		
		int pageSize = 10;							// 한 페이지에 출력할 가게 수
		
		
		String pno = request.getParameter("pno");
		if(pno == null) { pno = "1"; }				// 현재 페이지 정보 체크
		
		int currentPage = Integer.parseInt(pno);
		int startRow = (currentPage - 1) * pageSize + 1;	// 시작행 번호 계산
		int endRow = currentPage * pageSize;				// 끝행 번호 계산
		
		
		// ---------------------------------------------------------------------
		List<RestaurantDTO> listForm = null;
		
		if(search != null) {
			listForm = dao.getListInfo(startRow, pageSize, search.trim());
			
			if (addr_city != null && addr_district != null) {	// 검색어가 있으면서 지역까지 있을 때
				listForm = dao.getListInfo(startRow, pageSize, search.trim(), addr_city, addr_district);
			}
		} else {
			if (addr_city != null && addr_district != null) {	// 지역만 있을 때
				listForm = dao.getListInfo(startRow, pageSize, addr_city, addr_district);
			} else {
				listForm = dao.getListInfo(startRow, pageSize);
			}
		}
		
		System.out.println("listForm : " + listForm.toString());
		// ---------------------------------------------------------------------

		
		request.setAttribute("listForm", listForm);
		request.setAttribute("count", count);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("pno", pno);
		
		// 연결된 view에 출력
		forward.setPath("./list/listForm.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
}
