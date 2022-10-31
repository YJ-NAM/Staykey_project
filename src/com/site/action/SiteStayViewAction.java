package com.site.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;

public class SiteStayViewAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        ActionForward forward = new ActionForward();
        forward.setRedirect(false);
        forward.setPath("stay/stay_view.jsp");

        return forward;
    }

}