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
    	
    	List<StayDTO> randomStay = stayDAO.getStayforMain(display);
    	request.setAttribute("randomStay", randomStay);
    	
    	////////////////////////////////////////////////////////////////
    	// 키워드에 따른 선택된 값만 추출
    	// 관리자 창에서 키워드 설정할 수 있으면 좋을 것 같음...
    	String keyword = "제주";
    	
    	List<StayDTO> keywordStay = stayDAO.getSelectedStay(keyword);
    	request.setAttribute("keyword", keyword);
    	request.setAttribute("keywordStay", keywordStay);

    	//////////////////////////////////////////////////////////////////////////////////
    	// event : 이벤트
    	////////////////////////////////////////////////////////////////////////////////// 
    	// 전체 이벤트 목록 + 이벤트에 따른 숙소 목록
    	List<HashMap<String, String>> sList = eventDAO.getEventStayList();
        request.setAttribute("sList", sList);

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
