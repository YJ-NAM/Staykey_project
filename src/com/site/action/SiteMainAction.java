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
    	

    	//////////////////////////////////////////////////////////////////////////////////
    	// event : 이벤트
    	//////////////////////////////////////////////////////////////////////////////////    	
    	List<EventDTO> eventList = eventDAO.getTotalEvent();
    	
    	// 이벤트 번호에 따른 숙소 이름 조회
    	int bbs_no = 0;
    	String[] eventStayNum = new String[eventList.size()];

    	
    	// 숙소 번호 / 숙소 이름 저장 변수 선언
    	List<String> stayNameMap = new ArrayList<String>();

    	// total event => 모든 bbs_no(이벤트 번호)에 해당하는 숙소 번호값 추출 /String + / 로 합쳐진 상태/
    	for(int i=0; i<eventList.size(); i++) {    		
    		bbs_no = eventList.get(i).getBbs_no();
    		eventStayNum[i] = eventDAO.getEventStayNums(bbs_no);    		
    		eventStayNum[i] = eventStayNum[i].substring(1);
    		System.out.println(eventStayNum[i]);    		
    		
    		StringTokenizer tokenizer = new StringTokenizer(eventStayNum[i], "/");
    		
    		// 배열 초기화
        	String[] stayNums_array = new String[tokenizer.countTokens()];
        	int[] stayIntNums = new int[tokenizer.countTokens()];
        	String[] stayNames_array = new String[tokenizer.countTokens()];
        	
        	System.out.println(tokenizer.countTokens());
        	int j=0;
            while(tokenizer.hasMoreTokens()) {
            	stayNums_array[j] = tokenizer.nextToken();
            	stayIntNums[j] = Integer.parseInt(stayNums_array[j]);
        		stayNames_array[j] = stayDAO.getStayName(stayIntNums[j]);

        		stayNameMap.add(stayNames_array[j]);
        		j++;
            }
    	}
    	request.setAttribute("stayName", stayNameMap);
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
