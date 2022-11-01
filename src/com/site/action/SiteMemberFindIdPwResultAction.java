package com.site.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.MemberDAO;

public class SiteMemberFindIdPwResultAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

    	MemberDAO dao = MemberDAO.getInstance();
    	
    	String find_email = request.getParameter("find_email");
    	String find_name =request.getParameter("find_name");
    	
    	String find_id = dao.idFind(find_email, find_name);
    	
        ActionForward forward = new ActionForward();
        
        if(!find_id.equals("noEmail") && !find_id.equals("noName")) {
        	request.setAttribute("findId", find_id);
        	forward.setRedirect(false);
        	forward.setPath("member/member_find_result.jsp");
        }else if(!find_id.equals("noEmail")) {
        	request.setAttribute("errMsg", "<script> alert('유효하지 않은 이메일입니다.'); </script>");
        	forward.setRedirect(false);
        	forward.setPath("member/member_find_result.jsp");
        }else {
        	request.setAttribute("errMsg", "<script> alert('존재하지 않는 이름입니다.'); </script>");
        	forward.setRedirect(false);
        	forward.setPath("member/member_find_result.jsp");
        }

        return forward;
    }

}
