package com.admin.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.StayDAO;
import com.model.StayDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class AdminStayWriteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 숙소 등록하기
		
		StayDTO dto = new StayDTO();
	
        // 파일 업로드 설정
        String thisFolder = "/data/stay/";
        String saveFolder = request.getSession().getServletContext().getRealPath(thisFolder);
        int fileSize = 10 * 1024 * 1024; // 10MB
        
        // 업로드 폴더 체크 후 없으면 생성
        File dirChk = new File(saveFolder);
        if(!dirChk.exists()){
            dirChk.mkdir();
        }

        // 파일 업로드 객체 생성
        MultipartRequest multi = new MultipartRequest(request, saveFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());

        // 파라미터 정리
        // stay_option1~3_price if문... => NumberFormatException 처리 위함
        String stay_type = multi.getParameter("stay_type");
        String stay_name = multi.getParameter("stay_name").trim();
        String stay_desc = multi.getParameter("stay_desc").trim();
        String stay_location = multi.getParameter("stay_location").trim();
        String stay_addr = multi.getParameter("stay_addr").trim();
        String stay_phone = multi.getParameter("stay_phone").trim();
        String stay_email = multi.getParameter("stay_email").trim();
        String stay_option1_name = multi.getParameter("stay_option1_name").trim();      
        if(multi.getParameter("stay_option1_price").length() > 0) {
        	int stay_option1_price = Integer.parseInt(multi.getParameter("stay_option1_price").trim());
        	dto.setStay_option1_price(stay_option1_price);
        }
        String stay_option1_desc = multi.getParameter("stay_option1_desc").trim();
        String stay_option2_name = multi.getParameter("stay_option2_name").trim();
        System.out.println("뭐냐" + multi.getParameter("stay_option2_price"));
        if(multi.getParameter("stay_option2_price").length() > 0) {
        	int stay_option2_price = Integer.parseInt(multi.getParameter("stay_option2_price").trim());
        	dto.setStay_option2_price(stay_option2_price);
        }
        String stay_option2_desc = multi.getParameter("stay_option2_desc").trim();
        String stay_option3_name = multi.getParameter("stay_option3_name").trim();
        if(multi.getParameter("stay_option3_price").length() > 0) {
        	int stay_option3_price = Integer.parseInt(multi.getParameter("stay_option3_price").trim());
        	dto.setStay_option3_price(stay_option3_price);
        }
        String stay_option3_desc = multi.getParameter("stay_option3_desc").trim();
        String stay_content1 = multi.getParameter("stay_content1").trim();
        String stay_content2 = multi.getParameter("stay_content2").trim();
        String stay_content3 = multi.getParameter("stay_content3").trim();
        String stay_info1 = multi.getParameter("stay_info1").trim();
        String stay_info2 = multi.getParameter("stay_info2").trim();
        String stay_info3 = multi.getParameter("stay_info3").trim();
        
        // stay_file ~ photo들 rename 필요
        File stay_file1 = multi.getFile("stay_file1");
        File stay_file2 = multi.getFile("stay_file2");
        File stay_file3 = multi.getFile("stay_file3");
        File stay_file4 = multi.getFile("stay_file4");
        File stay_file5 = multi.getFile("stay_file5");
        File stay_option1_photo = multi.getFile("stay_option1_photo");
        File stay_option2_photo = multi.getFile("stay_option2_photo");
        File stay_option3_photo = multi.getFile("stay_option3_photo");
        
        dto.setStay_type(stay_type);
        dto.setStay_name(stay_name);
        dto.setStay_desc(stay_desc);
        dto.setStay_location(stay_location);
        dto.setStay_addr(stay_addr);
        dto.setStay_phone(stay_phone);
        dto.setStay_email(stay_email);
        dto.setStay_content1(stay_content1);
        dto.setStay_content2(stay_content2);
        dto.setStay_content3(stay_content3);
        dto.setStay_info1(stay_info1);
        dto.setStay_info2(stay_info2);
        dto.setStay_info3(stay_info3);
        dto.setStay_option1_name(stay_option1_name);
        dto.setStay_option1_desc(stay_option1_desc);
        dto.setStay_option2_name(stay_option2_name);
        dto.setStay_option2_desc(stay_option2_desc);
        dto.setStay_option3_name(stay_option3_name);
        dto.setStay_option3_desc(stay_option3_desc);
        
        // 아마도 코드 수정 예정...        
        // 객체지향적 코드가 필요한 상태...
        // "_(" + stay_file3 +")" => currentTimeMillis 중복되서 파일명 중복되는 경우 있어, 수정함
        if(stay_file1 != null) {
            String fileExt = stay_file1.getName().substring(stay_file1.getName().lastIndexOf(".") + 1);
            String stay_file1_rename = stay_name + "_(" + stay_file1 +")" + System.currentTimeMillis() + "." + fileExt;
            stay_file1.renameTo(new File(saveFolder + "/" + stay_file1_rename));
            dto.setStay_file1(thisFolder + stay_file1_rename);
        }
        
        if(stay_file2 != null) {
            String fileExt = stay_file2.getName().substring(stay_file2.getName().lastIndexOf(".") + 1);
            String stay_file2_rename = stay_name + "_(" + stay_file2 +")"  + System.currentTimeMillis() + "." + fileExt;
            stay_file2.renameTo(new File(saveFolder + "/" + stay_file2_rename));
            dto.setStay_file2(thisFolder + stay_file2_rename);
        }
        
        if(stay_file3 != null) {
            String fileExt = stay_file3.getName().substring(stay_file3.getName().lastIndexOf(".") + 1);
            String stay_file3_rename = stay_name + "_(" + stay_file3 +")" + System.currentTimeMillis() + "." + fileExt;
            stay_file3.renameTo(new File(saveFolder + "/" + stay_file3_rename));
            dto.setStay_file3(thisFolder + stay_file3_rename);
        }
        
        if(stay_file4 != null) {
            String fileExt = stay_file4.getName().substring(stay_file4.getName().lastIndexOf(".") + 1);
            String stay_file4_rename = stay_name + "_(" + stay_file4 +")" + System.currentTimeMillis() + "." + fileExt;
            stay_file4.renameTo(new File(saveFolder + "/" + stay_file4_rename));
            dto.setStay_file4(thisFolder + stay_file4_rename);
        }
        
        if(stay_file5 != null) {
            String fileExt = stay_file5.getName().substring(stay_file5.getName().lastIndexOf(".") + 1);
            String stay_file5_rename = stay_name + "_(" + stay_file5 +")" + System.currentTimeMillis() + "." + fileExt;
            stay_file5.renameTo(new File(saveFolder + "/" + stay_file5_rename));
            dto.setStay_file5(thisFolder + stay_file5_rename);
        }
        
        if(stay_option1_photo != null) {
            String fileExt = stay_option1_photo.getName().substring(stay_option1_photo.getName().lastIndexOf(".") + 1);
            String stay_option1_photo_rename = stay_name + "_(" + stay_option1_photo +")" + System.currentTimeMillis() + "." + fileExt;
            stay_option1_photo.renameTo(new File(saveFolder + "/" + stay_option1_photo_rename));
            dto.setStay_option1_photo(thisFolder + stay_option1_photo_rename);
        }
        
        if(stay_option2_photo != null) {
            String fileExt = stay_option2_photo.getName().substring(stay_option2_photo.getName().lastIndexOf(".") + 1);
            String stay_option2_photo_rename = stay_name + "_(" + stay_option2_photo +")" + System.currentTimeMillis() + "." + fileExt;
            stay_option2_photo.renameTo(new File(saveFolder + "/" + stay_option2_photo_rename));
            dto.setStay_option2_photo(thisFolder + stay_option2_photo_rename);
        }
        
        if(stay_option3_photo != null) {
            String fileExt = stay_option3_photo.getName().substring(stay_option3_photo.getName().lastIndexOf(".") + 1);
            String stay_option3_photo_rename = stay_name + "_(" + stay_option3_photo +")" + System.currentTimeMillis() + "." + fileExt;
            stay_option3_photo.renameTo(new File(saveFolder + "/" + stay_option3_photo_rename));
            dto.setStay_option3_photo(thisFolder + stay_option3_photo_rename);
        }

        StayDAO dao = StayDAO.getInstance();
        int res = dao.registerStay(dto);

        ActionForward forward = new ActionForward();
        PrintWriter out = response.getWriter();

        if (res > 0) {
            forward.setRedirect(true);
            forward.setPath("stayList.do");
        } else {
            out.println("<script> alert('숙소 등록 중 에러가 발생했습니다.'); history.back(); </script>");
        }

        return forward;

		}

}
