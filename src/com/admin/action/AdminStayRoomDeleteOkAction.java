package com.admin.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.StayDAO;

public class AdminStayRoomDeleteOkAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // 방 삭제 메서드

        int room_no = Integer.parseInt(request.getParameter("room_no"));
        StayDAO dao = StayDAO.getInstance();
        int res = dao.deleteRoom(room_no);

        ActionForward forward = new ActionForward();
        PrintWriter out = response.getWriter();

        if (res > 0) {
            out.println("<script>parent.location.href='stayView.do?stay_no=" + dto.getRoom_stayno()
                    + "'; window.close();</script>");
        } else {
            out.println("<script> alert('Room 등록 중 에러가 발생했습니다.'); history.back(); </script>");
        }
        return forward;
    }

}
