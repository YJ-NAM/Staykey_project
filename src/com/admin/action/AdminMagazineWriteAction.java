package com.admin.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.MagazineDAO;
import com.model.MagazineDTO;
import com.model.StayDAO;
import com.model.StayDTO;
import com.util.Paging;

public class AdminMagazineWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// write 버튼 누르면 stay 정보가 write로 넘어감.

		MagazineDTO dto = new MagazineDTO();
		
        StayDAO sdao = StayDAO.getInstance();
        List<StayDTO> slist = sdao.getBbsStayList(dto.getBbs_stayno());
        request.setAttribute("stayList", slist);


        
        // 뷰에 전달할 매개변수 저장용 맵 생성
        Map<String, Object> map = new HashMap<String, Object>();


        // 검색용 변수들 정의
        String mg_title = "";
        String mg_writer_name = "";
        String ps_order = "";

        if(request.getParameter("mg_title") != null){ mg_title = request.getParameter("mg_title").trim(); }else{ mg_title = ""; }
        if(request.getParameter("mg_writer_name") != null){ mg_writer_name = request.getParameter("mg_writer_name").trim(); }else{ mg_writer_name = ""; }
        if(request.getParameter("ps_order") != null){ ps_order = request.getParameter("ps_order").trim(); }else{ ps_order = "bbs_date_desc"; }


        
        
    	ActionForward forward = new ActionForward();
    	forward.setRedirect(false);
    	forward.setPath("magazine/magazine_write.jsp");
    	System.out.println("slist" + slist);

    	
        return forward;
        
		
		
	}

}
