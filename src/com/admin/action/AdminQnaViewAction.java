package com.admin.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.QnaDAO;
import com.model.QnaDTO;


public class AdminQnaViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 문의글 상세내역 비지니스 로직.
		
        int no = Integer.parseInt(request.getParameter("no").trim());

        QnaDAO dao = QnaDAO.getInstance();
        QnaDTO dto = dao.getQnaInfo(no);

        request.setAttribute("qna", dto);

        ActionForward forward = new ActionForward();
        forward.setRedirect(false);
        forward.setPath("qna/qna_view.jsp");

		return forward;

		
	}

}
