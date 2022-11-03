package com.site.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.QnaDAO;
import com.model.QnaDTO;


public class SiteMypageQnaListAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	// 마이페이지 1대1 문의 관리 비지니스 로직.
    	
        QnaDAO dao = QnaDAO.getInstance();
        
		HttpSession session = request.getSession();
		
		//세션 아이디 값 받아오기.
		String id = (String)session.getAttribute("login_id");
		List<QnaDTO> list = dao.qnaMemberList(id);
		session.setAttribute("list", list);
		
        ActionForward forward = new ActionForward();
        forward.setRedirect(false);
        forward.setPath("mypage/mypage_qna_list.jsp");

        return forward;
    }

}
