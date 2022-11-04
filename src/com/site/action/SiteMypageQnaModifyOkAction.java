package com.site.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.QnaCommentDAO;
import com.model.QnaCommentDTO;

public class SiteMypageQnaModifyOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 댓글 수정하는 비지니스 로직.
		int qna_no = Integer.parseInt(request.getParameter("qna_no"));
		int comment_no = Integer.parseInt(request.getParameter("comment_no"));
		String comment_content = request.getParameter("comment_content");
		
		QnaCommentDTO dto = new QnaCommentDTO();
		QnaCommentDAO dao = QnaCommentDAO.getInstance();
		
		dto.setComment_content(comment_content);
		dto.setComment_no(comment_no);
		
        int check = dao.commentModify(dto); 
        ActionForward forward = new ActionForward();
        PrintWriter out = response.getWriter();

        if (check > 0) {
            forward.setRedirect(false); forward.setPath("mypageQnaView.do?no="+qna_no);
        } else {
            out.println("<script>alert('댓글 수정 중 에러가 발생하였습니다.'); history.back();</script>");
        }



        return forward;
	}

}
