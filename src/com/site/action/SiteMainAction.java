package com.site.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.EventDAO;
import com.model.EventDTO;
import com.model.MagazineDAO;
import com.model.MagazineDTO;
import com.model.StayDAO;
import com.model.StayDTO;

public class SiteMainAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	
    	StayDAO stayDAO = StayDAO.getInstance();
    	EventDAO eventDAO = EventDAO.getInstance();
    	MagazineDAO magazineDAO = MagazineDAO.getInstance();
    	
    	//////////////////////////////////////////////////////////////////////////////////
    	// stay : 숙소
    	//////////////////////////////////////////////////////////////////////////////////    	
    	// 배열 total count 생성
    	int stayTotal = stayDAO.getStayTotalCount();    	
    	
    	// randomNum 담을 변수 
    	int randomNum = 0;
    	
    	// display : 메인에 표시할 총 개수 
    	int[] display = new int[10];
    	
    	// stayNums[] : 숙소 번호 담겨 있음
    	int[] stayNums = stayDAO.getStayNums(stayTotal);
    	
    	for(int i=0; i<display.length; i++) {    		
    		randomNum = (int)(Math.random()*stayTotal) + 1;
    		display[i] = stayNums[randomNum];
    	}
    	
    	List<StayDTO> list = stayDAO.getStayforMain(display);
    	request.setAttribute("stayRandom", list);
    	
    	////////////////////////////////////////////////////////////////
    	// 키워드에 따른 선택된 값만 추출
    	// 관리자 창에서 설정할 수 있으면 좋을 것 같음...
    	String keyword = "제주";
    	
    	List<StayDTO> selectedStay = stayDAO.getSelectedStay(keyword);
    	request.setAttribute("keyword", keyword);
    	request.setAttribute("selectedStay", selectedStay);

    	//////////////////////////////////////////////////////////////////////////////////
    	// event : 이벤트
    	//////////////////////////////////////////////////////////////////////////////////    	
    	List<EventDTO> eventList = eventDAO.getTotalEvent();
    	request.setAttribute("eventList", eventList);

    	//////////////////////////////////////////////////////////////////////////////////
    	// magazine : 매거진
    	//////////////////////////////////////////////////////////////////////////////////    	
    	
    	List<MagazineDTO> magazineList = magazineDAO.getTotalMagazine();
    	request.setAttribute("magazineList", magazineList);    	
    	
        ActionForward forward = new ActionForward();
        forward.setRedirect(false);
        forward.setPath("main.jsp");

        return forward;
    }

}
