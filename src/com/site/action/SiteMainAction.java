package com.site.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
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
    	
    	// stayNums : 모든 숙소 번호 추출 / 숙소 번호 다 다르기 때문
    	List<Integer> stayNums = stayDAO.getStayNums();
    	
    	// 화면에 표시할 개수만큼 random 지정
    	for(int i=0; i<display.length; i++) {    		
    		randomNum = (int)(Math.random()*stayTotal);
    		display[i] = stayNums.get(randomNum);
    	}
    	
    	List<StayDTO> list = stayDAO.getStayforMain(display);
    	request.setAttribute("stayRandom", list);
    	
    	////////////////////////////////////////////////////////////////
    	// 키워드에 따른 선택된 값만 추출
    	// 관리자 창에서 설정할 수 있으면 좋을 것 같음...
    	String keyword = "제주";
    	EventDTO eventDTO = new EventDTO();
    	
    	List<StayDTO> selectedStay = stayDAO.getSelectedStay(keyword);
    	request.setAttribute("keyword", keyword);
    	request.setAttribute("selectedStay", selectedStay);

    	//////////////////////////////////////////////////////////////////////////////////
    	// event : 이벤트
    	////////////////////////////////////////////////////////////////////////////////// 
    	
    	List<EventDTO> eventList = eventDAO.getTotalEvent();
    	request.setAttribute("eventList", eventList);	
    	List<StayDTO> eventStayList = new ArrayList<StayDTO>();
    	String eventName = "";
    	
    	// 모든 bbs_no(이벤트 번호) 따른 숙소 번호 추출
    	for(int i=0; i<eventList.size(); i++) {  
    		// bbs_no : 이벤트 번호
    		int bbs_no = eventList.get(i).getBbs_no();    	
    		// getEventStayNums(bbs_no) : 이벤트에 해당하는 숙소 번호 : String
    		// getStayNum(String) => List<Integer>로 쪼개서 추출
    		
    		List<Integer> stayList = eventDAO.getStayNum(eventDAO.getEventStayNums(bbs_no));
    		eventDTO = eventDAO.getEventInfo(bbs_no);
    		eventName = eventDTO.getBbs_title();
    		int[] stay_no = new int[stayList.size()];    		
    		for(int j=0; j<stayList.size(); j++) {
    			stay_no[j] = stayList.get(j);
    		}    		
    		// 숙소 번호에 따른 숙소 정보 추출
    		eventStayList = stayDAO.getStayforMain(stay_no);    		
    	}
    	request.setAttribute("eventName", eventName);
    	request.setAttribute("eventStay", eventStayList);    	    

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
