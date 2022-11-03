package com.site.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.QnaCommentDAO;
import com.model.QnaCommentDTO;
import com.model.QnaDAO;
import com.model.QnaDTO;

public class SiteMypageQnaModifyAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        ActionForward forward = new ActionForward();

        // 문의글 번호
		int qna_no = Integer.parseInt(request.getParameter("qna_no").trim());
		
		// 댓글 번호
		int comment_no = Integer.parseInt(request.getParameter("comment_no").trim());
    	HttpSession session = request.getSession();

		QnaCommentDAO commentDao = QnaCommentDAO.getInstance();
		List<QnaCommentDTO> commentDto = commentDao.getQnaCommentInfo(comment_no);
		
		QnaDAO dao = QnaDAO.getInstance();
        QnaDTO dto = dao.getQnaInfo(qna_no);
        
        dto.getBbs_status();
		if(!dto.getBbs_status().equals("send")) {
            PrintWriter out = response.getWriter();
            out.println("<script>alert('수정할 수 없습니다.'); history.back();</script>");
            return forward;
		}

    	
		session.setAttribute("List", commentDto);

        forward.setRedirect(false);
        forward.setPath("mypage/mypage_qna_modify.jsp");

        return forward;
    }

}
