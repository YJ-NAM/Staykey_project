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

public class AdminStayModifyOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 수정된 정보 저장		
		
		StayDTO dto = new StayDTO();
		StayDAO dao = StayDAO.getInstance();
	
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
        int stay_no = Integer.parseInt(multi.getParameter("stay_no"));
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
        
        
        // 기존 이미지 정보 가져오기 위함
        StayDTO viewDTO = dao.getStayView(stay_no);
        String original_stay_file1 = viewDTO.getStay_file1();
        String original_stay_file2 = viewDTO.getStay_file2();
        String original_stay_file3 = viewDTO.getStay_file3();
        String original_stay_file4 = viewDTO.getStay_file4();
        String original_stay_file5 = viewDTO.getStay_file5();
        String original_stay_option1_photo = viewDTO.getStay_option1_photo();
        String original_stay_option2_photo = viewDTO.getStay_option2_photo();
        String original_stay_option3_photo = viewDTO.getStay_option3_photo();
        
        // 삭제될 파일 경로
        String delFolder = request.getSession().getServletContext().getRealPath("/");
        
        // 아마도 코드 수정 예정...        
        // 객체지향적 코드가 필요한 상태...
        // "_(" + stay_file3 +")" => currentTimeMillis 중복되서 파일명 중복되는 경우 있어, 수정함
        System.out.println("2");
        System.out.println(stay_file1);
        // file.delete() 실제 삭제 메서드
        if(!stay_file1.equals(null)) { 
            File del_image = new File(delFolder + original_stay_file1);
            if(del_image.exists()) {
                if(del_image.delete()) {
                	System.out.println("이미지 삭제 성공");
                }else {
                	System.out.println("실패임");
                }
            }            
        	String fileExt = stay_file1.getName().substring(stay_file1.getName().lastIndexOf(".") + 1);
            String stay_file1_rename = stay_name + "_" + stay_file1 +"_" + System.currentTimeMillis() + "." + fileExt;
            stay_file1.renameTo(new File(saveFolder + "/" + stay_file1_rename));
        	System.out.println("이미지 삭제 성공");
            dto.setStay_file1(thisFolder + stay_file1_rename);            
        }else {
        	System.out.println("안녀ㅛㄴㅇㄹㄴㅇㄹㅇㄹ"+original_stay_file1);
        	dto.setStay_file1(original_stay_file1);
        }
        
        if(stay_file2 != null) {
            File del_image = new File(delFolder + original_stay_file2);
            if(del_image.exists()) { del_image.delete(); }
            String fileExt = stay_file2.getName().substring(stay_file2.getName().lastIndexOf(".") + 1);
            String stay_file2_rename = stay_name + "_" + stay_file2 + "_" + System.currentTimeMillis() + "." + fileExt;
            stay_file2.renameTo(new File(saveFolder + "/" + stay_file2_rename));
            dto.setStay_file2(thisFolder + stay_file2_rename);
        }else {
        	
        	dto.setStay_file2(original_stay_file2);
        }
        
        if(stay_file3 != null) {

            File del_image = new File(delFolder + original_stay_file3);
            if(del_image.exists()) { del_image.delete(); }
            String fileExt = stay_file3.getName().substring(stay_file3.getName().lastIndexOf(".") + 1);
            String stay_file3_rename = stay_name + "_" + stay_file3 +"_" + System.currentTimeMillis() + "." + fileExt;
            stay_file3.renameTo(new File(saveFolder + "/" + stay_file3_rename));
            dto.setStay_file3(thisFolder + stay_file3_rename);
        }else {
        	System.out.println("안녀ㅛㄴㅇㄹㄴㅇㄹㅇㄹ"+original_stay_file3);
        	
        	dto.setStay_file3(original_stay_file3);
        }
        
        if(stay_file4 != null) {

        	File del_image = new File(delFolder + original_stay_file4);
            if(del_image.exists()) { del_image.delete(); }
            String fileExt = stay_file4.getName().substring(stay_file4.getName().lastIndexOf(".") + 1);
            String stay_file4_rename = stay_name + "_(" + stay_file4 +")" + System.currentTimeMillis() + "." + fileExt;
            stay_file4.renameTo(new File(saveFolder + "/" + stay_file4_rename));
            dto.setStay_file4(thisFolder + stay_file4_rename);
        }else {
        	dto.setStay_file4(original_stay_file4);
        }
        
        if(stay_file5 != null) {

            File del_image = new File(delFolder + original_stay_file5);
            if(del_image.exists()) { del_image.delete(); }
            String fileExt = stay_file5.getName().substring(stay_file5.getName().lastIndexOf(".") + 1);
            String stay_file5_rename = stay_name + "_(" + stay_file5 +")" + System.currentTimeMillis() + "." + fileExt;
            stay_file5.renameTo(new File(saveFolder + "/" + stay_file5_rename));
            dto.setStay_file5(thisFolder + stay_file5_rename);
        }else {
        	dto.setStay_file5(original_stay_file5);
        }
        
        if(stay_option1_photo != null) {

            File del_image = new File(delFolder + original_stay_option1_photo);
            if(del_image.exists()) { del_image.delete(); }
            String fileExt = stay_option1_photo.getName().substring(stay_option1_photo.getName().lastIndexOf(".") + 1);
            String stay_option1_photo_rename = stay_name + "_(" + stay_option1_photo +")" + System.currentTimeMillis() + "." + fileExt;
            stay_option1_photo.renameTo(new File(saveFolder + "/" + stay_option1_photo_rename));
            dto.setStay_option1_photo(thisFolder + stay_option1_photo_rename);
        }else {
        	dto.setStay_option1_photo(original_stay_option1_photo);
        }
        
        if(stay_option2_photo != null) {

            File del_image = new File(delFolder + original_stay_option2_photo);
            if(del_image.exists()) { del_image.delete(); }
            String fileExt = stay_option2_photo.getName().substring(stay_option2_photo.getName().lastIndexOf(".") + 1);
            String stay_option2_photo_rename = stay_name + "_(" + stay_option2_photo +")" + System.currentTimeMillis() + "." + fileExt;
            stay_option2_photo.renameTo(new File(saveFolder + "/" + stay_option2_photo_rename));
            dto.setStay_option2_photo(thisFolder + stay_option2_photo_rename);
        }else {
        	dto.setStay_option2_photo(original_stay_option2_photo);
        }
        
        if(stay_option3_photo != null) {

            File del_image = new File(delFolder + original_stay_option3_photo);
            if(del_image.exists()) { del_image.delete(); }
            String fileExt = stay_option3_photo.getName().substring(stay_option3_photo.getName().lastIndexOf(".") + 1);
            String stay_option3_photo_rename = stay_name + "_(" + stay_option3_photo +")" + System.currentTimeMillis() + "." + fileExt;
            stay_option3_photo.renameTo(new File(saveFolder + "/" + stay_option3_photo_rename));
            dto.setStay_option3_photo(thisFolder + stay_option3_photo_rename);
        }else {
        	dto.setStay_option3_photo(original_stay_option3_photo);
        }

        int res = dao.modifyStay(dto);

        ActionForward forward = new ActionForward();
        PrintWriter out = response.getWriter();

        if (res > 0) {
            forward.setRedirect(true);
            forward.setPath("stayView.do?stay_no="+stay_no);
        }else {
            out.println("<script> alert('숙소 수정 중 에러가 발생했습니다.'); history.back(); </script>");
        }

        return forward;

		}

	

}
