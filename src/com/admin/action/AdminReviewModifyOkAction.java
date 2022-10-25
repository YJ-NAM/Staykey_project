package com.admin.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;

public class AdminReviewModifyOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 리뷰 수정을 하는 비지니스 로직.
		
		// 히든 값으로 넘어온 아이디
		int review_pw = Integer.parseInt(request.getParameter("review_pw").trim());
		
		String review_stayname = request.getParameter("review_stayname").trim();
		String review_roomname = request.getParameter("review_roomname").trim();
		String review_id = request.getParameter("review_id").trim();
		String review_name = request.getParameter("review_name").trim();
		int point1 = Integer.parseInt(request.getParameter("review_point1").trim());
		int point2 = Integer.parseInt(request.getParameter("review_point2").trim());
		int point3 = Integer.parseInt(request.getParameter("review_point3").trim());
		int point4 = Integer.parseInt(request.getParameter("review_point4").trim());
		int point5 = Integer.parseInt(request.getParameter("review_point5").trim());
		int point6 = Integer.parseInt(request.getParameter("review_point6").trim());
		

		
		
		return null;
	}

}
