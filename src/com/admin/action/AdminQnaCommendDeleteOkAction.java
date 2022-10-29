package com.admin.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.QnaCommentDAO;

public class AdminQnaCommendDeleteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 답변 삭제하는 비지니스 로직.
		int no = Integer.parseInt(request.getParameter("no").trim());
		
		QnaCommentDAO dao = QnaCommentDAO.getInstance();
		
		int res = dao.deleteComment(no);
		
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();

		
        if (res > 0) {
            forward.setRedirect(true);
            forward.setPath("qnaView.do?no="+no);
        } else {
            out.println("<script>alert('댓글 삭제 중 에러가 발생하였습니다.'); history.back();</script>");
        }
		
		
		
		return forward;
	}

}
