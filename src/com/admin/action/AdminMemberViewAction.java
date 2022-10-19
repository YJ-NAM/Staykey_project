package com.admin.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;

public class AdminMemberViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 회원의 상세 내역을 보여주는 페이지 이다.
		int no = Integer.parseInt(request.getParameter("no"));
		
		
		
		return null;
	}

}
