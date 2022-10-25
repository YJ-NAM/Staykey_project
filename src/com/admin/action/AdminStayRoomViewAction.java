package com.admin.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.StayDAO;
import com.model.StayDTO;
import com.model.StayRoomDTO;

public class AdminStayRoomViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 방 상세정보 보기
		
		int roomNo = Integer.parseInt(request.getParameter("room_no"));
		int stayNo = Integer.parseInt(request.getParameter("stay_no"));
		
		StayDAO dao = StayDAO.getInstance();
		StayRoomDTO dto = dao.getStayRoomView(roomNo);
		StayDTO stayDTO = dao.getStayView(stayNo);
		
		ActionForward forward = new ActionForward();
		request.setAttribute("stayView", stayDTO);
		request.setAttribute("roomView", dto);
		forward.setRedirect(false);
		forward.setPath("stay/stay_room_view.jsp");

		return forward;
	}

}
