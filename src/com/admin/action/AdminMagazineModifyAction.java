package com.admin.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.StayDAO;
import com.model.StayDTO;

public class AdminMagazineModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {


		int bbs_no = Integer.parseInt(request.getParameter("bbs_no"));
		
		StayDAO dao = StayDAO.getInstance();
		
		StayDTO dto = dao.getStayView(bbs_no);
		
		request.setAttribute("magazineModify", dto);

		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		forward.setPath("magazine/magazine_modify.jsp");
	
		return forward;
	}

}
