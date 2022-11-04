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

    	int comment_no = Integer.parseInt(request.getParameter("comment_no").trim());
    	int qna_no = Integer.parseInt(request.getParameter("qna_no").trim());
    	
    	QnaCommentDAO dao = QnaCommentDAO.getInstance();
    	QnaCommentDTO dto = dao.getCommentInfo(comment_no);
    	
    	request.setAttribute("comment", dto);
    	request.setAttribute("qna_no", qna_no);

        forward.setRedirect(false);
        forward.setPath("mypage/mypage_qna_modify.jsp");

        return forward;
    }

}
