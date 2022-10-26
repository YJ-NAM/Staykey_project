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
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class AdminMagazineWriteOkAction implements Action {

	@Override
	
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
	
		MagazineDTO dto = new MagazineDTO();
		
        // 파일 업로드 설정
        String thisFolder = "/data/magazine/";
        String saveFolder = request.getSession().getServletContext().getRealPath(thisFolder);
        System.out.println(saveFolder);
        int fileSize = 10 * 1024 * 1024; // 10MB
        
        // 업로드 폴더 체크 후 없으면 생성
        File dirChk = new File(saveFolder);
        if(!dirChk.exists()){
            dirChk.mkdir();
        }

        // 파일 업로드 객체 생성
        MultipartRequest multi = new MultipartRequest(request, saveFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());

        // 파라미터 정리
        String mag_title = multi.getParameter("mag_title");
        String mag_content = multi.getParameter("mag_content").trim();
        String mag_youtube = multi.getParameter("mag_youtube").trim();
        String mag_stayno = multi.getParameter("mag_stayno").trim();
        String mag_map = multi.getParameter("mag_map").trim();
        String mag_name = multi.getParameter("mag_name").trim();
        String mag_id = multi.getParameter("mag_id").trim();
        String mag_pw = multi.getParameter("mag_pw").trim();

        


        // 첨부파일 이름 변경 처리
        File mag_file1 = multi.getFile("mag_file1");
        if(mag_file1 != null) {
            String fileExt = mag_file1.getName().substring(mag_file1.getName().lastIndexOf(".") + 1);
            String mag_flie_rename = mag_title + "_" + System.currentTimeMillis() + "." + fileExt;
            mag_file1.renameTo(new File(saveFolder + "/" + mag_flie_rename)); 
            
            // DB에 저장되는 파일 이름
            // 저장이름 : /data/저장폴더/회원아이디_현재날짜(유닉스타임)
            String fileDBName = thisFolder + mag_flie_rename;
            dto.setBbs_file1(fileDBName); }
           
            // 첨부파일 이름 변경 처리
            File mag_file2 = multi.getFile("mag_file2");
            if(mag_file2 != null) {
            	String fileExt = mag_file2.getName().substring(mag_file2.getName().lastIndexOf(".") + 1);
            	String mag_flie_rename = mag_title + "_" + System.currentTimeMillis() + "." + fileExt;
            	mag_file2.renameTo(new File(saveFolder + "/" + mag_flie_rename)); 

                // DB에 저장되는 파일 이름
                // 저장이름 : /data/저장폴더/회원아이디_현재날짜(유닉스타임)
                String fileDBName = thisFolder + mag_flie_rename;
                dto.setBbs_file2(fileDBName); }
            
            	
            	// 첨부파일 이름 변경 처리
            	File mag_file3 = multi.getFile("mag_file3");
            	if(mag_file3 != null) {
            		String fileExt = mag_file3.getName().substring(mag_file3.getName().lastIndexOf(".") + 1);
            		String mag_flie_rename = mag_title + "_" + System.currentTimeMillis() + "." + fileExt;
            		mag_file3.renameTo(new File(saveFolder + "/" + mag_flie_rename));

                    // DB에 저장되는 파일 이름
                    // 저장이름 : /data/저장폴더/회원아이디_현재날짜(유닉스타임)
                    String fileDBName = thisFolder + mag_flie_rename;
                    dto.setBbs_file3(fileDBName); }
            		
            		// 첨부파일 이름 변경 처리
            		File mag_file4 = multi.getFile("mag_file4");
            		if(mag_file4 != null) {
            			String fileExt = mag_file4.getName().substring(mag_file4.getName().lastIndexOf(".") + 1);
            			String mag_flie_rename = mag_title + "_" + System.currentTimeMillis() + "." + fileExt;
            			mag_file4.renameTo(new File(saveFolder + "/" + mag_flie_rename));
            			
                        // DB에 저장되는 파일 이름
                        // 저장이름 : /data/저장폴더/회원아이디_현재날짜(유닉스타임)
                        String fileDBName = thisFolder + mag_flie_rename;
                        dto.setBbs_file4(fileDBName); }
            			
            			// 첨부파일 이름 변경 처리
            			File mag_file5 = multi.getFile("mag_file5");
            			if(mag_file5 != null) {
            				String fileExt = mag_file5.getName().substring(mag_file5.getName().lastIndexOf(".") + 1);
            				String mag_flie_rename = mag_title + "_" + System.currentTimeMillis() + "." + fileExt;
            				mag_file5.renameTo(new File(saveFolder + "/" + mag_flie_rename));

            	            // DB에 저장되는 파일 이름
            	            // 저장이름 : /data/저장폴더/회원아이디_현재날짜(유닉스타임)
            	            String fileDBName = thisFolder + mag_flie_rename;
            	            dto.setBbs_file5(fileDBName); }
            				
		
	       dto.setBbs_title(mag_title);
	       dto.setBbs_content(mag_content); 
	       dto.setBbs_youtube(mag_youtube);
	       dto.setBbs_stayno(mag_stayno);
	       dto.setBbs_map(mag_map);
	       dto.setBbs_writer_name(mag_name);
	       dto.setBbs_writer_id(mag_id);
	       dto.setBbs_writer_pw(mag_pw);
	   
        MagazineDAO dao = MagazineDAO.getInstance();
        int res = dao.registerMagazine(dto);

        ActionForward forward = new ActionForward();
        PrintWriter out = response.getWriter();
        

        if (res > 0) {
        	 forward.setRedirect(true);
             forward.setPath("magazineList.do");
        } else {
            out.println("<script> alert('매거진 등록 중 에러가 발생했습니다.'); history.back(); </script>");
        }
        return forward;
	}
	

}
