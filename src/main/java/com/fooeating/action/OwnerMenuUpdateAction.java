package com.fooeating.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fooeating.commons.Action;
import com.fooeating.commons.ActionForward;
import com.fooeating.commons.JSForward;
import com.fooeating.db.PublicDAO;
import com.fooeating.db.RestaurantDTO;
import com.fooeating.db.Restaurant_menuDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class OwnerMenuUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		 System.out.println(" C : OwnerMenuUpdateACtion.execute()호출");
		 
	       // 한글처리 
	       request.setCharacterEncoding("UTF-8");
	       
	       // 파일업로드 + 상품정보 (파라메터)
			 ServletContext ctx = request.getServletContext();
			 String realPath = ctx.getRealPath("/upload");
			 System.out.println(realPath);
			 
			 int maxSize = 5 * 1024 * 1024 ;
			 System.out.println(realPath);
			 // 파일업로드
			 
			 MultipartRequest multi = new MultipartRequest(
					 request,
					 realPath,
					 maxSize,
					 "UTF-8",
					 new DefaultFileRenamePolicy()
					 );
	       
	       // 점주 아이디 받아오기
	       HttpSession session = request.getSession();
	       String user_id = (String) session.getAttribute("user_id");
	       int rest_menu_num = Integer.parseInt(request.getParameter("rest_menu_num"));
	       
	       PublicDAO dao = new PublicDAO();
	       Restaurant_menuDTO dto = new Restaurant_menuDTO();
	       dto.setRest_menu_num(rest_menu_num);
	       dto.setMenu_descriptions(multi.getParameter("menu_descriptions"));
	       dto.setMenu_name(multi.getParameter("menu_name"));
	       dto.setMenufile(multi.getFilesystemName("menufile"));
	       dto.setPrice(multi.getParameter("price"));
	       dao.OwnerMenuUpdate(dto);
	       
	       
	       JSForward.alertAndClose(response, "수정 완료");
	      
	       return null;
	}

}
