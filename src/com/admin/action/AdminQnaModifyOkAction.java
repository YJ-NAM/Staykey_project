package com.admin.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.QnaDAO;
import com.model.QnaDTO;

public class AdminQnaModifyOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 문의글 상태를 수정하는 비지니스 로직.
		QnaDTO dto = new QnaDTO();
		QnaDAO dao = QnaDAO.getInstance();

		int no = Integer.parseInt(request.getParameter("no").trim());
		String bbs_status = request.getParameter("bbs_status").trim();
		
		
		dto.setBbs_no(no);
		dto.setBbs_status(bbs_status);
		
        int check = dao.statusModify(dto); 
        ActionForward forward = new ActionForward();
        PrintWriter out = response.getWriter();

        if (check > 0) {
            forward.setRedirect(false); forward.setPath("qnaView.do?no="+no);
        } else {
            out.println("<script>alert('문의글 상태 수정 중 에러가 발생하였습니다.'); history.back();</script>");
        }



        return forward;
	}

}
