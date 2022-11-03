package com.site.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
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
    	int[] display = new int[10];
    	
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
    	String[] eventStayNum = new String[eventList.size()];
    	int[] stayIntNums = null;
    	
    	List<String> eventStayList = new ArrayList<String>();
    	
    	// total event => 모든 bbs_no(이벤트 번호)에 해당하는 숙소 번호값 추출 /String + / 로 합쳐진 상태/
    	for(int i=0; i<eventList.size(); i++) {    		
    		bbs_no = eventList.get(i).getBbs_no();
    		eventStayNum[i] = eventDAO.getEventStayNums(bbs_no);
    		System.out.println(eventStayNum[i]);
    		String[] eventNums = eventStayNum[i].split("/");
    		System.out.println("여기"+eventNums.length);
    		for(int j=0; j<eventNums.length; j++) {
    			eventStayList.add(eventNums[j]);
    			System.out.println(eventStayList.get(i));
    		}
    	}
//		/*
//		 * System.out.println(eventNums.length);
//		 *///    	eventStayList.add(e)
//    	// 숙소 번호 split해서 해당하는 값 int로 형변환 후 getStayView 메서드 실행
//    	// getStay_name으로 숙소명 추출 -> list에 해당하는 모든 값 add
//    	for(int i=0; i<eventNums.length; i++) {
//    		System.out.println(eventNums[i]);
////    		stayIntNums[i] = Integer.parseInt(eventNums[i]);			 
//    	}
//    	stayIntNums = new int[eventNums.length];
//    	
//    	
//    	stayName[i] =
//    			stayDAO.getStayView(stayIntNums[i]).getStay_name();
//    	System.out.println("현록이변심"+stayName[i]);
//    	
    	
//    	request.setAttribute("stayName", stayName);
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
