package com.site.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.MemberDAO;
import com.model.MemberDTO;
import com.sun.net.httpserver.Authenticator.Result;

public class SiteMemberLoginOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 로그인 시 아이디, 비밀번호 대조
		
		MemberDAO dao = MemberDAO.getInstance();
		
		String login_id = request.getParameter("login_id");
		String login_pw = request.getParameter("login_pw");
		
		int result  = dao.idPwCheck(login_id, login_pw);
		MemberDTO dto = dao.getMemberInfo(login_id);
		PrintWriter out = response.getWriter();
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
		if(result == 0) { // 일치하는 아이디 없음
			out.println("<script> alert('일치하는 아이디가 존재하지 않습니다.'); history.back(); </script>");
		}else if(result == -1) { // 비번 오류
			out.println("<script> alert('비밀번호를 다시 확인해주세요.'); history.back(); </script>");
		}else if(result == -2) { // admin = -2
			session.setAttribute("login_id", login_id);
			session.setAttribute("login_pw", login_pw);
			session.setAttribute("login_name", dto.getMember_name());
			session.setAttribute("login_msg", "<script> alert('관리자 로그인 성공!'); </script>");
			forward.setRedirect(false);
			forward.setPath("admin/index.jsp");
			
		}else if(result == -3) { // user = -3
			session.setAttribute("login_id", login_id);
			session.setAttribute("login_pw", login_pw);
			session.setAttribute("login_name", dto.getMember_name());
			session.setAttribute("login_msg", "<script> alert('로그인 성공!'); </script>");
			forward.setRedirect(false);
			forward.setPath("index.jsp");
		}
		return forward;
	}

}
