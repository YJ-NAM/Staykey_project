package com.site.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.MagazineDAO;
import com.model.MagazineDTO;
import com.model.StayDAO;
import com.model.StayDTO;
import com.model.WishDAO;
import com.model.WishDTO;

public class SiteMypageWishActioㅋn implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
    			
    	 int wish_stayno = Integer.parseInt(request.getParameter("wish_stayno"));

         // 상세 정보 조회 메서드
         WishDAO dao = WishDAO.getInstance();
         WishDTO dto = dao.getMagView(wish_stayno);
         request.setAttribute("wish", dto);

         // 등록된 숙소 목록 정보 메서드
         StayDAO sdao = StayDAO.getInstance();
         List<StayDTO> slist = sdao.getBbsViewList(dto.getBbs_stayno());
         request.setAttribute("stayList", slist);

    	
        ActionForward forward = new ActionForward();
        forward.setRedirect(false);
        forward.setPath("mypage/mypage_wish_list.jsp");
    	
        return forward;	
    	        

    		}

}
