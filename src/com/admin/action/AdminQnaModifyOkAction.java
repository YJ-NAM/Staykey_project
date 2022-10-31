package com.admin.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;

public class AdminQnaModifyOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 문의글 상태를 수정하는 비지니스 로직.
		int no = Integer.parseInt(request.getParameter("no").trim());
		
		
		
		
		
		return null;
	}

}
