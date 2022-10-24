package com.admin.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.ReservDAO;
import com.model.ReservDTO;

public class AdminReservListAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        ReservDAO dao = ReservDAO.getInstance();
        List<ReservDTO> reserv_list = dao.getReservList();

        request.setAttribute("List", reserv_list);

        ActionForward forward = new ActionForward();
        forward.setRedirect(false);
        forward.setPath("reserv/reserv_list.jsp");

        return forward;
    }

}
