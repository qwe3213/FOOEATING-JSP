package com.fooeating.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fooeating.commons.Action;
import com.fooeating.commons.ActionForward;
import com.fooeating.commons.JSForward;
import com.fooeating.db.PublicDAO;
import com.fooeating.db.Restaurant_menuDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class OwnerMenuAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 한글 처리
		request.setCharacterEncoding("UTF-8");

		// 세션 정보 저장
		HttpSession session = request.getSession();

		String user_id = (String) session.getAttribute("user_id");
		// 파일업로드 + 상품정보 (파라메터)
		ServletContext ctx = request.getServletContext();
		String realPath = ctx.getRealPath("/upload");
		System.out.println(realPath);

		int maxSize = 5 * 1024 * 1024;
		System.out.println(realPath);
		// 파일업로드

		MultipartRequest multi = 
						new MultipartRequest(
						request, 
						realPath, 
						maxSize, 
						"UTF-8",
						new DefaultFileRenamePolicy()
				);

		System.out.println(" M : 파일업로드 성공");
		
		Restaurant_menuDTO menudto = new Restaurant_menuDTO();
		
		menudto.setMenu_name(multi.getParameter("menu_name"));
		menudto.setMenu_descriptions(multi.getParameter("menu_descriptions"));
		menudto.setPrice(multi.getParameter("price"));
		menudto.setRest_id(multi.getParameter("rest_id"));
		menudto.setMenufile(multi.getFilesystemName("menufile")); 
		
		PublicDAO dao = new PublicDAO();
		dao.getRestaurantMenu(menudto);
		
		JSForward.alertAndClose(response, "메뉴 추가 완료!");
		
		return null;

	}

}
