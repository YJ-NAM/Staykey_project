package com.site.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.MemberDAO;
import com.model.MemberDTO;

public class SiteMemberJoinOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 회원가입 정보 입력
		// 회원만? 회원가입?
		// member_type은... 
		
		MemberDAO dao = MemberDAO.getInstance();
		MemberDTO dto = new MemberDTO();
		
		String member_id = request.getParameter("join_id");
		String member_pw = request.getParameter("join_pw");
		String member_name = request.getParameter("join_name");
		String member_email = request.getParameter("join_email");
		String member_phone = request.getParameter("join_phone");
		
		dto.setMember_id(member_id);
		dto.setMember_pw(member_pw);
		dto.setMember_name(member_name);
		dto.setMember_email(member_email);
		dto.setMember_phone(member_phone);

		int res = dao.registerMember(dto);
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		
		if(res > 0) {
        	session.setAttribute("login_msg", "<script> alert('성공적으로 회원 가입이 완료되었습니다.'); </script>)");
            forward.setRedirect(true);
            forward.setPath("index.jsp");
		}else {
            out.println("<script> alert('회원 등록 중 에러가 발생했습니다.'); history.back(); </script>");
		}
		return forward;
	}

}
