package com.admin.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.StayDAO;
import com.model.StayDTO;

public class AdminStayViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 전체 목록 클릭 시 -> 상세 정보 보기
		
		int stayNo = Integer.parseInt(request.getParameter("stay_no"));
		
		StayDAO dao = StayDAO.getInstance();
		StayDTO dto = dao.getStayView(stayNo);
		
		request.setAttribute("stayView", dto);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("stay/stay_view.jsp");
		
		return forward;
	}

}
