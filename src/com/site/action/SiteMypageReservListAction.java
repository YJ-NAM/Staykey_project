package com.site.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.MemberDAO;
import com.model.MemberDTO;
import com.model.ReservDAO;
import com.model.ReservDTO;
import com.model.StayDTO;
import com.model.WishDAO;

public class SiteMypageReservListAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {


    	ReservDAO dao = ReservDAO.getInstance();
		
    	HttpSession session = request.getSession();
    	String id = (String)session.getAttribute("login_id");
    	
    	List<ReservDTO> list = dao.getMyReservInfo(id);
        request.setAttribute("reservList", list);
    	
		System.out.println("뜨나?"+list);
		
        ActionForward forward = new ActionForward();
        forward.setRedirect(false);
        forward.setPath("mypage/mypage_reserv_list.jsp");

        return forward;
    }

}
