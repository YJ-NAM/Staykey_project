package com.site.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;

public class SiteMemberFindIdPwResultAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        ActionForward forward = new ActionForward();
        forward.setRedirect(false);
        forward.setPath("member/member_find_result.jsp");

        return forward;
    }

}
