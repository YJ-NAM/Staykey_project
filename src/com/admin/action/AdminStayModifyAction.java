package com.admin.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.StayDAO;
import com.model.StayDTO;

public class AdminStayModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 숙소 수정 -> View 값 받아와서 넘김
		
		int stayNo = Integer.parseInt(request.getParameter("stay_no"));
		
		StayDAO dao = StayDAO.getInstance();
		StayDTO dto = dao.getStayView(stayNo);
		
		request.setAttribute("stayModify", dto);

		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("stay/stay_modify.jsp");
	
		return forward;
	}

}
