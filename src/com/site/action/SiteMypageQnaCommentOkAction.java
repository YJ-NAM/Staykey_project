package com.site.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.QnaCommentDAO;
import com.model.QnaCommentDTO;

public class SiteMypageQnaCommentOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 문의글 답변 비지니스 로직.
		int no = Integer.parseInt(request.getParameter("no").trim());
		String comment_content = request.getParameter("comment_content").trim();
		System.out.println(no);
		HttpSession session = request.getSession();
        ActionForward forward = new ActionForward();

		
		QnaCommentDTO dto = new QnaCommentDTO();
		QnaCommentDAO dao= QnaCommentDAO.getInstance();
		
        PrintWriter out = response.getWriter();

		if(comment_content.length() <= 0) {
        	out.println("<script>alert('답변 내용을 입력해주세요.'); history.back();</script>");
            forward.setRedirect(true);
            forward.setPath("mypageQnaView.do?no="+no);
            return forward;
		}

		
		String login_name = (String)session.getAttribute("login_name");
		String id = (String)session.getAttribute("login_id");
		String login_pw = (String)session.getAttribute("login_pw");

		dto.setComment_qnano(no);
		dto.setComment_content(comment_content);
		dto.setComment_writer_name(login_name);
		dto.setComment_writer_id(id);
		dto.setComment_writer_pw(login_pw);

        int res = dao.registerComment(dto);



        if (res > 0) {
            forward.setRedirect(true);
            forward.setPath("mypageQnaView.do?no="+no);
        }else {
        	out.println("<script>alert('답변 등록 중 에러가 발생하였습니다.'); history.back();</script>");
        }


        return forward;
	}

}
