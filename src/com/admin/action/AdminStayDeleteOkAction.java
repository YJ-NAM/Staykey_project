package com.admin.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.StayDAO;
import com.model.StayDTO;

public class AdminStayDeleteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 숙소 삭제
		
		StayDAO dao = StayDAO.getInstance();
		String saveFolder = request.getSession().getServletContext().getRealPath("/");
		
		int stayNo = Integer.parseInt(request.getParameter("stay_no"));
		StayDTO dto = dao.getStayView(stayNo);
		
		String stay_file1 = dto.getStay_file1();
		String stay_file2 = dto.getStay_file2();
		String stay_file3 = dto.getStay_file3();
		String stay_file4 = dto.getStay_file4();
		String stay_file5 = dto.getStay_file5();
		String stay_option1_photo = dto.getStay_option1_photo();
		String stay_option2_photo = dto.getStay_option2_photo();
		String stay_option3_photo = dto.getStay_option3_photo();
		
        if(stay_file1 != null) { 
        	File del_image = new File(saveFolder + stay_file1);     
        	System.out.println(del_image);
        	if(del_image.exists()) { del_image.delete(); }
        }
        if(stay_file2 != null) { 
        	File del_image = new File(saveFolder + stay_file2);        	
        	if(del_image.exists()) { del_image.delete(); }
        }
        if(stay_file3 != null) { 
        	File del_image = new File(saveFolder + stay_file3);        	
        	if(del_image.exists()) { del_image.delete(); }
        }
        if(stay_file4 != null) { 
        	File del_image = new File(saveFolder + stay_file4);        	
        	if(del_image.exists()) { del_image.delete(); }
        }
        if(stay_file5 != null) { 
        	File del_image = new File(saveFolder + stay_file5);        	
        	if(del_image.exists()) { del_image.delete(); }
        }
        if(stay_option1_photo != null) { 
        	File del_image = new File(saveFolder + stay_option1_photo);        	
        	if(del_image.exists()) { del_image.delete(); }
        }
        if(stay_option2_photo != null) { 
        	File del_image = new File(saveFolder + stay_option2_photo);        	
        	if(del_image.exists()) { del_image.delete(); }
        }
        if(stay_option3_photo != null) { 
        	File del_image = new File(saveFolder + stay_option3_photo);        	
        	if(del_image.exists()) { del_image.delete(); }
        }
                
		int res = dao.deleteStay(stayNo);
		
		ActionForward forward = new ActionForward();
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        
		if(res > 0) {
			session.setAttribute("msg", "<script> alert('성공적으로 삭제되었습니다.'); </script>");
			forward.setRedirect(true);
			forward.setPath("stayList.do");
		}else {
            out.println("<script> alert('숙소 삭제 중 에러가 발생했습니다.'); history.back(); </script>");
		}		
		return forward;
	}

}
