package com.admin.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.controller.Action;
import com.controller.ActionForward;
import com.model.MemberDAO;
import com.model.MemberDTO;

public class AdminMemberSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		// 검색 폼 페이지에서 넘어온 데이터를 가지고 검색어에 해당하는 게시물들을
		// DB에서 조회하여 view page로 이동시키는 비지니스 로직
		
		String search_field = request.getParameter("search_field").trim();
		String search_keyword = request.getParameter("search_keyword").trim();
		
		// 페이징 처리 작업 진행
		
		// 한 페이지당 보여질 게시물의 수
		int rowsize = 3;
		
		// 아래에 보여질 페이지의 최대 블럭 수 	
		int block = 3;
		
		// 예) [1][2][3][4][5] / [6][7][8][9][10]
		
		// DB 상의 게시물의 전체 수
		int totalRacord = 0;
		
		// 전체 페이지 수 - 
		// 전체 게시물의 수 / 한 페이지 당 보여질 게시물의 수 
		int allPage = 0;
		
		int page = 1;	// 현재 페이지 변수
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page").trim());
		}
		
		// 해당 페이지에서 시작 번호
		int startNo = (page * rowsize) - (rowsize -1);
		
		// 해당 페이지에서 끝 번호
		int endNo = (page * rowsize);
		
		// 해당 페이지에서 시작 블럭
		int startBlock = (((page - 1) / block) * block) + 1;
		
		// 해당 페이지에서 끝 블럭
		int endBlock = (((page - 1) / block) * block) + block;

		
		MemberDAO dao = MemberDAO.getInstance();

		// DB상의 검색 게시물의 수를 확인하는 메서드 호출.
		totalRacord = dao.memberSearchListCount(search_field, search_keyword);
		
		// 검색 게시물의 수를 한 페이지당 보여질 게시물의 수로 나누어 주어야 함.
		// 이 과정을 거치면 전체 페이지수가 나오게 됨.
		// 검색 페이지 수가 나올 때 나머지가 있으면 무조건 페이지 수를 하나 올려주어야 함.
		allPage = (int)Math.ceil(totalRacord / (double)rowsize);
		
		if(endBlock > allPage) {
			endBlock = allPage;
		}
		
		// 현재 페이지에 해당하는 검색 게시물을 가져오는 메서드 호출
		List<MemberDTO> searchList = dao.memberSearchList(search_field, search_keyword, page, rowsize);
		
		// 지금까지 페이징 처리 시 작업했던 모든 값들을 view page로 이동시키자.
		request.setAttribute("page", page);
		request.setAttribute("rowsize", rowsize);
		request.setAttribute("block", block);
		request.setAttribute("totalRacord", totalRacord);
		request.setAttribute("allPage", allPage);
		request.setAttribute("startNo", startNo);
		request.setAttribute("endNo", endNo);
		request.setAttribute("startBlock", startBlock);
		request.setAttribute("endBlock", endBlock);
		request.setAttribute("field", search_field);
		request.setAttribute("keyword", search_keyword);
		request.setAttribute("List", searchList);

		ActionForward forward = new ActionForward();
		
		PrintWriter out = response.getWriter();
		System.out.println(searchList);
		if(searchList != null) {
			
			forward.setRedirect(true);
			forward.setPath("member/member_list.jsp");
			
		}else {
			
			out.println("<script>");
			out.println("alert('찾으시는 검색어가 없습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}

		
		
		
		return forward;
	}

}
