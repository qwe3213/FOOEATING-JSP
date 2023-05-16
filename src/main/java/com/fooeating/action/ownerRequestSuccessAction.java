package com.fooeating.action;


import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fooeating.commons.Action;
import com.fooeating.commons.ActionForward;
import com.fooeating.db.PublicDAO;
import com.fooeating.db.RestaurantDTO;
import com.fooeating.db.Restaurant_menuDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ownerRequestSuccessAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		 System.out.println(" M : ownerRequestSuccessAction_execute() 호출");
		
		 // 한글 처리
		 request.setCharacterEncoding("UTF-8");
		
		 // 세션 정보 저장
	   	 HttpSession session = request.getSession();
		
		 String user_id = (String)session.getAttribute("user_id");
		
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
				 new DefaultFileRenamePolicy());
		 
		 System.out.println(" M : 파일업로드 성공" );

		//끝
		
		RestaurantDTO dto = new RestaurantDTO();
		dto.setRest_id(multi.getParameter("rest_id"));
		dto.setName(multi.getParameter("name"));
		dto.setCategory(multi.getParameter("category"));
		dto.setAddr_city(multi.getParameter("addr_city"));
		dto.setAddr_district(multi.getParameter("addr_district"));
		dto.setAddr_etc(multi.getParameter("addr_etc"));
		dto.setRest_tel(multi.getParameter("rest_tel"));
		dto.setRuntime(multi.getParameter("runtime"));
		dto.setDayoff(multi.getParameter("dayoff"));
		dto.setDescriptions(multi.getParameter("descriptions"));
		dto.setConvenience(multi.getParameter("convenience"));
		dto.setOutfile(multi.getFilesystemName("outfile"));
		dto.setInfile(multi.getFilesystemName("infile"));
		dto.setOwner_user_id(user_id);
		
		Restaurant_menuDTO menudto = new Restaurant_menuDTO();
		
		menudto.setMenu_name(multi.getParameter("menu_name"));
		menudto.setMenu_descriptions(multi.getParameter("menu_descriptions"));
		menudto.setPrice(multi.getParameter("price"));
		menudto.setRest_id(multi.getParameter("rest_id"));
	    
		 menudto.setMeunfile(multi.getFilesystemName("meunfile")); 
		
		PublicDAO dao = new PublicDAO();
		dao.getRestaurant(dto);
		dao.getRestaurantMenu(menudto);

		System.out.println(" M : " + dto);
        System.out.println(" M : " + menudto);
		
        ActionForward forward = new ActionForward();
		forward.setPath("./owner/ownerRequestSuccess.jsp");
		forward.setRedirect(false);

		return forward;
	}

}
