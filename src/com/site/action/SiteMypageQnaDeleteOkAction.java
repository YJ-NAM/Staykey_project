package com.site.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.QnaCommentDAO;
import com.model.QnaDAO;
import com.model.QnaDTO;

public class SiteMypageQnaDeleteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 문의글 댓글 삭제 폼 페이지.
		ActionForward forward = new ActionForward();

        // 문의글 번호
		int qna_no = Integer.parseInt(request.getParameter("qna_no").trim());
		
		// 댓글 번호
		int comment_no = Integer.parseInt(request.getParameter("comment_no").trim());
		
		QnaCommentDAO commentDao = QnaCommentDAO.getInstance();
		QnaDAO dao = QnaDAO.getInstance();
        QnaDTO dto = dao.getQnaInfo(qna_no);
        
        dto.getBbs_status();
		if(!dto.getBbs_status().equals("send")) {
            PrintWriter out = response.getWriter();
            out.println("<script>alert('삭제할 수 없습니다.'); history.back();</script>");
            return forward;
		}
		
		int res = commentDao.deleteComment(comment_no);
		
		PrintWriter out = response.getWriter();

		
        if (res > 0) {
            forward.setRedirect(false);
            forward.setPath("mypageQnaView.do?no="+qna_no);
        } else {
            out.println("<script>alert('댓글 삭제 중 에러가 발생하였습니다.'); history.back();</script>");
        }
		
		
		
		return forward;

	}

}
