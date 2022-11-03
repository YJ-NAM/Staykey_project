package com.site.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.Action;
import com.controller.ActionForward;

public class SiteMypageQnaDeleteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 문의글 댓글 삭제 폼 페이지.
		
		// 문의글 답변 상태 체크 
        HttpSession session = request.getSession();
        
        // 문의글 번호
		int qna_no = Integer.parseInt(request.getParameter("qna_no").trim());
		
		// 댓글 번호
		int comment_no = Integer.parseInt(request.getParameter("comment_no").trim());
		
		
		
		return null;
	}

}
