package com.site.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.MemberDAO;
import com.model.MemberDTO;

public class SiteMemberLoginOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 로그인 시 아이디, 비밀번호 대조
		
		MemberDAO dao = MemberDAO.getInstance();
		
		String login_id = request.getParameter("login_id");
		String login_pw = request.getParameter("login_pw");
		
		int result  = dao.idPwCheck(login_id, login_pw);
		MemberDTO dto = dao.getMemberInfo(login_id);
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
		if(result == 0) { // 일치하는 아이디 없음
			request.setAttribute("errMsg", "<script> alert('존재하지 않는 아이디입니다.'); </script>");
			forward.setRedirect(false);
			forward.setPath("member/member_login.jsp");		
			
		}else if(result == -1) { // 비번 오류
			request.setAttribute("errMsg", "<script> alert('비밀번호를 다시 확인해주세요.'); </script>");
			forward.setRedirect(false);
			forward.setPath("member/member_login.jsp");		
			
		}else if(result == -2) { // admin = -2
			session.setAttribute("login_id", login_id);
			session.setAttribute("login_pw", login_pw);
			session.setAttribute("login_name", dto.getMember_name());
			request.setAttribute("login_msg", "<script> alert('관리자 로그인 성공!'); </script>");
			forward.setRedirect(false);
			forward.setPath("admin/index.jsp");
			
		}else if(result == -3) { // user = -3
			session.setAttribute("login_id", login_id);
			session.setAttribute("login_pw", login_pw);
			session.setAttribute("login_name", dto.getMember_name());
			request.setAttribute("login_msg", "<script> alert('로그인 성공!'); </script>");
			forward.setRedirect(false);
			forward.setPath("index.jsp");
		}
		return forward;
	}

}
