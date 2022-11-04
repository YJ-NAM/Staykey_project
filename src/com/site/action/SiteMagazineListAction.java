package com.site.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.MagazineDAO;
import com.model.MagazineDTO;

public class SiteMagazineListAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

    	MagazineDAO magazineDAO = MagazineDAO.getInstance();

    	//////////////////////////////////////////////////////////////////////////////////
    	// magazine : 매거진
    	//////////////////////////////////////////////////////////////////////////////////    	
    	
    	List<MagazineDTO> magazineList = magazineDAO.getTotalMagazine();
    	request.setAttribute("magazineList", magazineList);    	

        ActionForward forward = new ActionForward();
        forward.setRedirect(false);
        forward.setPath("magazine/magazine_list.jsp");

        return forward;
    }

}
