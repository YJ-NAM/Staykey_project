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

public class SiteMypageReservViewAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	
    	
    	// 아이디로 예약 정보 리스트 가져오기
    	ReservDAO dao = ReservDAO.getInstance();
		
    	HttpSession session = request.getSession();
    	String id = (String)session.getAttribute("login_id");
    	
    	List<ReservDTO> list = dao.getMyReservInfo(id);
        request.setAttribute("reservList", list);
    	
        
		  // 숙소 번호로 숙소 사진 가져오기 
		  List<StayDTO> slist = dao.getImgReservInfo(id);
		  request.setAttribute("stayList", slist);

    	
    	
        ActionForward forward = new ActionForward();
        forward.setRedirect(false);
        forward.setPath("mypage/mypage_reserv_view.jsp");

        return forward;
    }

}
