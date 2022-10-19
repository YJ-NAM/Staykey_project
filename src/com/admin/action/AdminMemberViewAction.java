package com.admin.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.MemberDAO;
import com.model.MemberDTO;

public class AdminMemberViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 회원의 상세 내역을 보여주는 페이지 이다.
		int no = Integer.parseInt(request.getParameter("no"));
		
		MemberDAO dao = MemberDAO.getInstance();
		
		
		
		// 글번호에 해당하는 상세내역을 조회하는 메서드 호출.
		MemberDTO content = dao.uploadDetails(no);
		
		request.setAttribute("List", content);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		forward.setPath("member/member_view.jsp");
		
		return forward;
	}

}
