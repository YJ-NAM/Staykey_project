package com.admin.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.List;

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
        System.out.println(saveFolder);
        int fileSize = 25 * 1024 * 1024; // 10MB
        
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
      
        List<String> stayFiles = new ArrayList<String>();
		Enumeration<String> fileNames = multi.getFileNames();
		int i = 0;
		
        while(fileNames.hasMoreElements()) {      	
        	String parameter = fileNames.nextElement();
        	File stayFile = multi.getFile(parameter); // 실제 업로드된 파일 시스템 이름(중복 없는...)
        	System.out.println("44"+stayFile);
        	
        	if(stayFile != null) { // 파일이 있으면
        		String fileExt = stayFile.getName().substring(stayFile.getName().lastIndexOf(".") + 1); // 확장자 분리
                String fileRename = "stay_" + System.currentTimeMillis() + i + "." + fileExt; // 파일 rename
                System.out.println(saveFolder + fileRename);
                stayFile.renameTo(new File(saveFolder + fileRename)); // 경로 지정
        		stayFiles.add(i, thisFolder + fileRename); // list에 저장
        	}else { // list 값 처리 위함(파일이 없을 때)
            	stayFiles.add(i, ""); // null 값이 연속해서 들어갈 수 없는지.... 파일 저장 위치 확인 필요
            }
        	i++;
        }
        
        System.out.println(stayFiles.get(0).toString());        
        dto.setStay_file1(stayFiles.get(0).toString());
        dto.setStay_file2(stayFiles.get(1).toString());
        dto.setStay_file3(stayFiles.get(2).toString());
        dto.setStay_file4(stayFiles.get(3).toString());
        dto.setStay_file5(stayFiles.get(4).toString());
        dto.setStay_option1_photo(stayFiles.get(5).toString());
        dto.setStay_option2_photo(stayFiles.get(6).toString());
        dto.setStay_option3_photo(stayFiles.get(7).toString());
                
        // 아마도 코드 수정 예정...        
        // 객체지향적 코드가 필요한 상태...
        // "_(" + stay_file3 +")" => currentTimeMillis 중복되서 파일명 중복되는 경우 있어, 수정함

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
