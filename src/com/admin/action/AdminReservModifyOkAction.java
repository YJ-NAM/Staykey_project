package com.admin.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;

public class AdminReservModifyOkAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {







        ActionForward forward = new ActionForward();
        forward.setRedirect(true);
        forward.setPath("reservList.do");

        return forward;
    }

}
