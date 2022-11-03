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
import com.model.WishDAO;
import com.model.WishDTO;

public class SiteMypageWishAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // 1. 찜에 숙소 번호 가져오기
        // 찜 dao
        WishDAO dao = WishDAO.getInstance();

        // 세션 로그인되어 있는 값 가져오기
        HttpSession session = request.getSession();
        String id = (String)session.getAttribute("login_id");

        // id로 select 하고 값 dto에 저장
        List<WishDTO> dto = dao.getWishInfo(id);
        System.out.println(dto); // id값 저장되어이씀.

        // 2. 숙소 번호로 숙소 정보 가져오기

        // 스테이 dao
        StayDAO sdao = StayDAO.getInstance();

        // 위 dto로 숙소번호 가져와서 dto.get()으로 해서 select로 선택

        /* List<StayDTO> sdto = dao.getStayWish(dto.get(getStay_no()); /
        / request.setAttribute("list", sdto); */


        ActionForward forward = new ActionForward();
        forward.setRedirect(false);
        forward.setPath("mypage/mypage_wish_list.jsp");

        return forward;

    }

}