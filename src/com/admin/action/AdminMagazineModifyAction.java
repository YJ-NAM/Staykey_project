package com.admin.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.MagazineDAO;
import com.model.MagazineDTO;
import com.model.StayDAO;
import com.model.StayDTO;

public class AdminMagazineModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		// 히든으로 받아 옴
		int bbs_no = Integer.parseInt(request.getParameter("bbs_no"));
		
		// dao 연결
		MagazineDAO dao = MagazineDAO.getInstance();
		
		// 상세 목록 조회 메서드
		MagazineDTO dto = dao.getMagView(bbs_no);
		
		// 메서드로 조회해온 값 dto로 넘겨 주기
		request.setAttribute("magazineModify", dto);

		// forward 실행
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		forward.setPath("magazine/magazine_modify.jsp");
	
		return forward;
	}

}
