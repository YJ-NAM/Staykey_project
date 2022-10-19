package com.admin.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.MemberDAO;

public class AdminMemberListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 전체 레코드를 조회하여 해당 전체 리스트를 view page 로 이동시키는 비지니스 로직.
		
		MemberDAO dao = MemberDAO.getInstance();
		
		List<MemberDAO> list = dao.getUploadList();
		
		request.setAttribute("List", list);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("member/member_list.jsp");



		return forward;
	}

}
