package ownerMainPage_rstcareAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fooeating.commons.Action;
import com.fooeating.commons.ActionForward;
import com.fooeating.db.PublicDAO;
import com.fooeating.db.RestaurantDTO;

public class OwnerMainPagerstcareAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println(" O : OwnerMainpage_rstcareAction_execute() 호출 ");
		
		// 세션 제어
		HttpSession session = request.getSession();
		ActionForward forward = new ActionForward();
		String user_id = (String)session.getAttribute("user_id");
		int status = (int)session.getAttribute("status");
		if(user_id == null) {
			forward.setPath("./Main.foo");
			forward.setRedirect(true);
			return forward;
		}
		 
		PublicDAO dao = new PublicDAO();
		RestaurantDTO restal = dao.getRestaurantallow(user_id);
		System.out.println("출력할 가게의 정보" + restal);
		
		
		// status = dao.getOwnerStatus();
		forward.setPath("./owner/ownerMainPage_rstcare.jsp");
		forward.setRedirect(false);		
//		if(status != 0 ) {
//			forward.setPath("./Main.foo");
//			forward.setRedirect(true);
//			return forward;
//		}
//		
//		RestaurantDTO restInfo = dao.get(status);
	
		return forward;
	}

	  
}
