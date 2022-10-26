package com.admin.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.MagazineDAO;
import com.model.MagazineDTO;

public class AdminMagazineViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		
		int mag_no = Integer.parseInt(request.getParameter("bbs_no"));
		
		MagazineDAO dao = MagazineDAO.getInstance();
	
		
		
		// 상세 정보 조회 메서드
		MagazineDTO dto = dao.getMagView(mag_no);
		
				request.setAttribute("magazine", dto);
				
				ActionForward forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("magazine/magazine_view.jsp");
				
				return forward;
		
	}

}
