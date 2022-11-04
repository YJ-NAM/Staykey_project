package com.site.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.MagazineDAO;
import com.model.MagazineDTO;
import com.model.StayDAO;
import com.model.StayDTO;

public class SiteMagazineViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 매거진 뷰 페이지
		int bbs_no = Integer.parseInt(request.getParameter("bbs_no"));

        // 상세 정보 조회 메서드
        MagazineDAO dao = MagazineDAO.getInstance();
        MagazineDTO dto = dao.getMagView(bbs_no);
        request.setAttribute("magazineView", dto);
        
        // 등록된 숙소 목록 정보 메서드
        StayDAO stayDAO = StayDAO.getInstance();
        List<StayDTO> stayList = stayDAO.getBbsViewList(dto.getBbs_stayno());
        request.setAttribute("stayList", stayList);

        ActionForward forward = new ActionForward();
        forward.setRedirect(false);
        forward.setPath("magazine/magazine_view.jsp");

        return forward;
	}

}
