package com.fooeating.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.fooeating.commons.Action;
import com.fooeating.commons.ActionForward;
import com.fooeating.commons.JSForward;
import com.fooeating.db.NoticeDTO;
import com.fooeating.db.PublicDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;



public class NoticeWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		
		
		// 0. 한글처리
		request.setCharacterEncoding("UTF-8");
		
		// 1. noticeWrite.jsp에서 전달된 정보 dto 객체에 저장
		// -> subject, content
		NoticeDTO dto = new NoticeDTO();
		dto.setSubject(request.getParameter("subject"));
		dto.setContent(request.getParameter("content"));
		
		// 2. dao의 메서드 실행
		PublicDAO dao = new PublicDAO();
		dao.insertNotice(dto);
		
		// 3. 페이지 이동
		JSForward.alertAndMove(response, "게시글 작성이 완료되었습니다.", "./NoticeList.foo");
		return null;
	}

}
