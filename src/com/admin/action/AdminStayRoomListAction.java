package com.admin.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.StayDAO;
import com.model.StayRoomDTO;

public class AdminStayRoomListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// GET method로 특정 숙소의 room 정보 전체 목록 조회
		
		int stayNo = Integer.parseInt(request.getParameter("stay_no"));
		StayDAO dao = StayDAO.getInstance();
		
		// 전체 room 정보 목록 조회 메서드 : getStayLoomList()
		List<StayRoomDTO> list = dao.getStayRoomList(stayNo);
		request.setAttribute("stayNo", stayNo);
		request.setAttribute("roomList", list);
				
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("stay/stay_list.jsp");
		
		return forward;
	}
}
