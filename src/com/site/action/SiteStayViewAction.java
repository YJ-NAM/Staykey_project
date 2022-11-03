package com.site.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.StayDAO;
import com.model.StayDTO;
import com.model.StayRoomDTO;
import com.model.WishDAO;

public class SiteStayViewAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        int stayNo = Integer.parseInt(request.getParameter("stay_no"));
        StayDAO dao = StayDAO.getInstance();
        
        // getStayView() : 상세 정보 조회 메서드
        StayDTO dto = dao.getStayView(stayNo);
        request.setAttribute("stayView", dto);
        
        // getStayRoomList() : 전체 room 정보 목록 조회 메서드
        List<StayRoomDTO> list = dao.getStayRoomList(stayNo);
        request.setAttribute("roomList", list);


        // 찜 목록 체크하기
        HttpSession session = request.getSession();
        String login_id = (String) session.getAttribute("login_id");
        String wishChk = "N";

        if(login_id != null){
            WishDAO wdao = WishDAO.getInstance();
            wishChk = wdao.chkStayWish(stayNo, login_id);
        }
        request.setAttribute("wishChk", wishChk);



        ActionForward forward = new ActionForward();
        forward.setRedirect(false);
        forward.setPath("stay/stay_view.jsp");

        return forward;
    }

}
