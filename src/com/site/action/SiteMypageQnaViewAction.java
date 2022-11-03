package com.site.action;

import java.io.IOException;
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

public class SiteMypageQnaViewAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	// 마이페이지 1대1 문의 상세내역 비지니스 로직.
    	int no = Integer.parseInt(request.getParameter("no").trim());
    	
    	HttpSession session = request.getSession();
    	
        QnaDAO dao = QnaDAO.getInstance();
        QnaDTO dto = dao.getQnaInfo(no);
        
        QnaCommentDAO commentDao = QnaCommentDAO.getInstance();
        List<QnaCommentDTO> commentDto = commentDao.getQnaCommentInfo(no);

		session.setAttribute("qna", dto);
		session.setAttribute("List", commentDto);

        ActionForward forward = new ActionForward();
        forward.setRedirect(false);
        forward.setPath("mypage/mypage_qna_view.jsp");

        return forward;
    }

}
