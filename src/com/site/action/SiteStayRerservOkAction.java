package com.site.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.ReservDAO;
import com.model.ReservDTO;

public class SiteStayRerservOkAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        ReservDAO dao = ReservDAO.getInstance();
        ReservDTO dto = new ReservDTO();



        int res = dao.insertReserv(dto);

        ActionForward forward = new ActionForward();
        PrintWriter out = response.getWriter();

        if(res > 0) {
            out.println("<script>alert('예약이 완료되었습니다. :-)'); location.href='mypageReservView.do?reserv_sess="+reserv_sess+"';</script>");
        }else {
            out.println("<script>alert('예약하기 중 에러가 발생했습니다.'); history.back();</script>");
        }

        return null;
    }

}
