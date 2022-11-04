package com.site.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.ReservDAO;

public class SiteMypageReservDeleteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 예약정보 삭제하는 메서드.
		ActionForward forward = new ActionForward();
		
		int no = Integer.parseInt(request.getParameter("no").trim());

		System.out.println("no");
		System.out.println(no);
		ReservDAO dao = ReservDAO.getInstance();
		
		int res = dao.deleteReserv(no);
		
		PrintWriter out = response.getWriter();

		
        if (res > 0) {
            forward.setRedirect(false);
            forward.setPath("mypageReservList.do");
        } else {
            out.println("<script>alert('예약된 숙소를 삭제 중 에러가 발생하였습니다.'); history.back();</script>");
        }
		
		return forward;
	}

}
