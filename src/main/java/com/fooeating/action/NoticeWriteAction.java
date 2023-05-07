package com.fooeating.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.fooeating.commons.Action;
import com.fooeating.commons.ActionForward;
import com.fooeating.db.NoticeDTO;
import com.fooeating.db.PublicDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;



public class NoticeWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		
		
		// 1) 파일업로드 처리
		// 글쓰기 + 파일업로드
		String realPath = request.getRealPath("/upload");
		
		// 파일의 크기 제한 (10mb)
		int maxSize = 10 * 1024 * 1024;
		
		// MultipartRequest객체 생성 (업로드)
		MultipartRequest mlti = new MultipartRequest(
				request,
				realPath,	// 경로
				maxSize,	// 저장시킬 사이즈
				"UTF-8",	// 인코딩
				new DefaultFileRenamePolicy()	// 객체
				);
		
		
		
		// 2) 글쓰기
		NoticeDTO dto = new NoticeDTO();
		
		// 객체에 정보 저장
		dto.setSubject(mlti.getParameter("subject"));
		dto.setContent(mlti.getParameter("content"));
		dto.setFile(mlti.getFilesystemName("file"));
		
		// DB에 객체 정보 전달하기
		PublicDAO dao = new PublicDAO();
		dao.insertNotice(dto);
		
		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./NoticeList.foo");
		forward.setRedirect(true);
		
		return forward;
	}

}
