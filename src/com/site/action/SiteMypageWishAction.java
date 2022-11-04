package com.site.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.StayDTO;
import com.model.WishDAO;

public class SiteMypageWishAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	
    	// 찜 dao
    	WishDAO dao = WishDAO.getInstance();
		
    	// 세션 로그인되어 있는 값 가져오기
    	HttpSession session = request.getSession();
    	String id = (String)session.getAttribute("login_id");
    	
    	// 아이디로 숙소번호 가져오고 그 숙소번호로 내역을 가져오는 메서드 만들음
		List<StayDTO> slist = dao.getWishInfo(id);
		request.setAttribute("list", slist);

        ActionForward forward = new ActionForward();
        forward.setRedirect(false);
        forward.setPath("mypage/mypage_wish_list.jsp");

        return forward;

    }

}