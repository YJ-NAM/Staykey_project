package com.admin.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.StayDAO;
import com.model.StayRoomDTO;

public class AdminStayRoomModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// room 수정하기 방 정보 받아오기
		
		int roomNo = Integer.parseInt(request.getParameter("room_no"));
		
		StayDAO dao = StayDAO.getInstance();
		StayRoomDTO dto = dao.getStayRoomView(roomNo);
		
		request.setAttribute("roomModify", dto);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("stay/stay_room_modify.jsp");
		
		return forward;
	}

}
