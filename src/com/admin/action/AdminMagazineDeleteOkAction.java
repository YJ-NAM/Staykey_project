package com.admin.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.MagazineDAO;
import com.model.MagazineDTO;
import com.model.StayDAO;
import com.model.StayDTO;

public class AdminMagazineDeleteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		
				MagazineDAO dao = MagazineDAO.getInstance();
				
				String saveFolder = request.getSession().getServletContext().getRealPath("/");
				
				int mag_no = Integer.parseInt(request.getParameter("bbs_no"));
				MagazineDTO dto = dao.getMagView(mag_no);
				
				String bbs_file1 = dto.getBbs_file1();
				String bbs_file2 = dto.getBbs_file2();
				String bbs_file3 = dto.getBbs_file3();
				String bbs_file4 = dto.getBbs_file4();
				String bbs_file5 = dto.getBbs_file5();
				
		        if(bbs_file1 != null) { 
		        	File del_image = new File(saveFolder + bbs_file1);     
		        	System.out.println(del_image);
		        	if(del_image.exists()) { del_image.delete(); }
		        }
		        if(bbs_file2 != null) { 
		        	File del_image = new File(saveFolder + bbs_file2);        	
		        	if(del_image.exists()) { del_image.delete(); }
		        }
		        if(bbs_file3 != null) { 
		        	File del_image = new File(saveFolder + bbs_file3);        	
		        	if(del_image.exists()) { del_image.delete(); }
		        }
		        if(bbs_file4 != null) { 
		        	File del_image = new File(saveFolder + bbs_file4);        	
		        	if(del_image.exists()) { del_image.delete(); }
		        }
		        if(bbs_file5 != null) { 
		        	File del_image = new File(saveFolder + bbs_file5);        	
		        	if(del_image.exists()) { del_image.delete(); }
		        }
		       
		                
				int res = dao.deleteMag(mag_no);
				
				ActionForward forward = new ActionForward();
		        PrintWriter out = response.getWriter();
		        
				if(res > 0) {
					forward.setRedirect(true);
					forward.setPath("magazineList.do");
				}else {
		            out.println("<script> alert('삭제 중 에러가 발생했습니다.'); history.back(); </script>");
				}		
				return forward;
			}


}
