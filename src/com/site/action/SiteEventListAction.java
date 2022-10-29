package com.site.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;

public class SiteEventListAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {



        ActionForward forward = new ActionForward();
        forward.setRedirect(false);
        forward.setPath("event/event_list.jsp");

        return forward;
    }

}
