package com.site.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.EventDAO;
import com.model.EventDTO;

public class SiteEventListAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        EventDAO dao = EventDAO.getInstance();
        List<EventDTO> list = dao.getBbsEventList();
        request.setAttribute("eList", list);


        ActionForward forward = new ActionForward();
        forward.setRedirect(false);
        forward.setPath("event/event_list.jsp");

        return forward;
    }

}
