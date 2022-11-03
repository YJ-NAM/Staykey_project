package com.site.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.StayDAO;
import com.model.StayDTO;

public class SiteMainAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	
    	StayDAO dao = StayDAO.getInstance();
    	
    	// 배열 total count 생성
    	int stayTotal = dao.getStayTotalCount();    	
    	
    	// randomNum 담을 변수 
    	int randomNum = 0;
    	
    	// display : 메인에 표시할 총 개수 
    	int[] display = new int[5];
    	
    	// stayNums[] : 숙소 번호 담겨 있음
    	int[] stayNums = dao.getStayNums(stayTotal);
    	
    	for(int i=0; i<display.length; i++) {    		
    		randomNum = (int)(Math.random()*stayTotal) + 1;
    		display[i] = stayNums[randomNum];
    	}
    	
    	List<StayDTO> list = dao.getStayforMain(display);

    	request.setAttribute("stayRandom", list);
        ActionForward forward = new ActionForward();
        forward.setRedirect(false);
        forward.setPath("main.jsp");

        return forward;
    }

}
