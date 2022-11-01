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
    	ActionForward forward = new ActionForward();
    	
    	String find_email = request.getParameter("find_email");
    	String find_name =request.getParameter("find_name");
    	String find_id =request.getParameter("find_id");
    	String find_mode = request.getParameter("find_mode");
    	
    	// 아이디 찾기
    	if(find_mode.equals("id")) {
    		// 아이디 찾기 method
    		String member_id = dao.idFind(find_email, find_name);
    		if(!member_id.equals("noEmail") && !member_id.equals("noName")) {
	        	request.setAttribute("findId", member_id);
	        	forward.setRedirect(false);
	        	forward.setPath("member/member_find_result.jsp");
	        }else if(member_id.equals("noEmail")) { // 이메일 없을 때
	        	request.setAttribute("errMsg", "<script> alert('유효하지 않은 이메일입니다.'); </script>");
	        	forward.setRedirect(false);
	        	forward.setPath("member/member_find.jsp");
	        }else { // 이름 없을 때
	        	request.setAttribute("errMsg", "<script> alert('존재하지 않는 이름입니다.'); </script>");
	        	forward.setRedirect(false);
	        	forward.setPath("member/member_find.jsp");
	        }
    	}else { // 비번 찾기
    		// 비밀번호 찾기 method
    		String member_pwd = dao.pwdFind(find_email, find_id);
        	if(!member_pwd.equals("noEmail") && !member_pwd.equals("noId")) { // 비번 찾기 성공
	        	request.setAttribute("findPwd", member_pwd);
	        	forward.setRedirect(false);
	        	forward.setPath("member/member_find_result.jsp");
	        }else if(member_pwd.equals("noEmail")) { // 이메일 없을 때
	        	request.setAttribute("errMsg", "<script> alert('유효하지 않은 이메일입니다.'); </script>");
	        	forward.setRedirect(false);
	        	forward.setPath("member/member_find.jsp");
	        }else { // 아이디 없을 때
	        	request.setAttribute("errMsg", "<script> alert('존재하지 않는 아이디입니다.'); </script>");
	        	forward.setRedirect(false);
	        	forward.setPath("member/member_find.jsp");
	        }
    	}
    	
        return forward;
    }
}
