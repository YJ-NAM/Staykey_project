package com.admin.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.StayDAO;
import com.model.StayDTO;

public class AdminStayListAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	// 숙소(방 아님)에 대한 전체 목록 정보
    	
    	StayDAO dao = StayDAO.getInstance();
    	
    	// 숙소 전체 목록 조회 메서드 : getStayList()
    	List<StayDTO> list = dao.getStayList(); 
    	request.setAttribute("stayList", list);
    	
    	ActionForward forward = new ActionForward();
    	forward.setRedirect(false);
    	forward.setPath("stay/stay_list.jsp");

        return forward;
    }
}
