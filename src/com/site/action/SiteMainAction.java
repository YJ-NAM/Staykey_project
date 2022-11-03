package com.site.action;

import java.io.IOException;
import java.util.List;

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
    	int[] display = new int[5];
    	
    	// stayNums[] : 숙소 번호 담겨 있음
    	int[] stayNums = stayDAO.getStayNums(stayTotal);
    	
    	for(int i=0; i<display.length; i++) {    		
    		randomNum = (int)(Math.random()*stayTotal) + 1;
    		display[i] = stayNums[randomNum];
    	}
    	
    	List<StayDTO> list = stayDAO.getStayforMain(display);
    	request.setAttribute("stayRandom", list);
    	
    	//////////////////////////////////////////////////////////////////////////////////
    	// event : 이벤트
    	//////////////////////////////////////////////////////////////////////////////////
    	
    	List<EventDTO> eventList = eventDAO.getTotalEvent();
    	
    	// 이벤트 번호에 따른 숙소 이름 조회
    	int bbs_no = 0;
    	String eventStayNums = "";
    	String[] eventNums = null;
    	String[] stayName = null;
    	int[] stayIntName = null;
    	
    	// 모든 이벤트의 bbs_no(이벤트 번호)에 해당하는 숙소 번호값 추출
    	for(int i=0; i<eventList.size(); i++) {    		
    		bbs_no = eventList.get(i).getBbs_no();
    		eventStayNums = eventDAO.getEventStayNums(bbs_no);
    	}
    	
    	// 숙소 번호 split해서 해당하는 값 int로 형변환 후 getStayView 메서드 실행
    	// getStay_name으로 숙소명 추출 -> list에 해당하는 모든 값 add
    	eventNums = eventStayNums.split("/");
    	stayName = new String[eventNums.length];
    	System.out.println();
    	for(int i=0; i<eventNums.length; i++) {
    		System.out.println(eventNums[i]);
    		stayIntName[i] = Integer.parseInt(eventNums[i]);
    		System.out.println(stayIntName[i]);
			/*
			 * stayName[i] =
			 * stayDAO.getStayView(Integer.parseInt(eventNums[i])).getStay_name();
			 * System.out.println("현록이변심"+stayName[i]);
			 */
    	}
    	
    	
    	
    	request.setAttribute("stayName", stayName);
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
