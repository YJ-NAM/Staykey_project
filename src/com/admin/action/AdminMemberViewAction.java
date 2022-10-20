package com.admin.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.MemberDAO;
import com.model.MemberDTO;
import com.model.PointDAO;
import com.model.PointDTO;

public class AdminMemberViewAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        int mem_no = Integer.parseInt(request.getParameter("no"));

        MemberDAO dao = MemberDAO.getInstance();
        MemberDTO dto = dao.getMemberInfo(mem_no);
        request.setAttribute("member", dto);

        PointDAO pdao = PointDAO.getInstance();
        List<PointDTO> plist = pdao.getPointList(dto.getMember_id());
        request.setAttribute("point", plist);

        ActionForward forward = new ActionForward();
        forward.setRedirect(false);
        forward.setPath("member/member_view.jsp");

        return forward;
    }

}
