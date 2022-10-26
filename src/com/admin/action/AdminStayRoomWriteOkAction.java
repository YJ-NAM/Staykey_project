package com.admin.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.StayDAO;
import com.model.StayRoomDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class AdminStayRoomWriteOkAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // StayRoom!! 방 등록하기

        StayRoomDTO dto = new StayRoomDTO();

        // 파일 업로드 설정
        String thisFolder = "/data/stayRoom/";
        String saveFolder = request.getSession().getServletContext().getRealPath(thisFolder);
        int fileSize = 10 * 1024 * 1024; // 10MB

        // 업로드 폴더 체크 후 없으면 생성
        File dirChk = new File(saveFolder);
        if (!dirChk.exists()) {
            dirChk.mkdir();
        }

        // 파일 업로드 객체 생성
        MultipartRequest multi = new MultipartRequest(request, saveFolder, fileSize, "UTF-8",
                new DefaultFileRenamePolicy());

        String features_sum = "";
        String amenities_sum = "";
        String service_sum = "";

        // 파라미터 정리
        int stayRoom_roomStayNo = Integer.parseInt(multi.getParameter("stayNo").trim());
        String stayRoom_name = multi.getParameter("name").trim();
        String stayRoom_desc = multi.getParameter("description").trim();
        String stayRoom_checkIn = multi.getParameter("checkIn").trim();
        String stayRoom_checkOut = multi.getParameter("checkOut").trim();
        int stayRoom_standardNumber = Integer.parseInt(multi.getParameter("standardNumber").trim());
        int stayRoom_maxNumber = Integer.parseInt(multi.getParameter("maxNumber").trim());
        int stayRoom_roomSize = Integer.parseInt(multi.getParameter("roomSize").trim());

        String[] stayRoom_features = multi.getParameterValues("features");
        for (int i = 0; i < stayRoom_features.length; i++) {
            features_sum += stayRoom_features[i] + "/";
        }
        
        // 맨 처음 슬래시 붙이는 용도 : 검색 설정 시 필요함
        features_sum += "/" + features_sum; 

        String[] stayRoom_amenities = multi.getParameterValues("amenities");
        for (int i = 0; i < stayRoom_amenities.length; i++) {
            amenities_sum += stayRoom_amenities[i] + "/";
        }
        amenities_sum += "/" + amenities_sum;

        String[] stayRoom_services = multi.getParameterValues("services");
        for (int i = 0; i < stayRoom_services.length; i++) {
            service_sum += stayRoom_services[i] + "/";
        }
        service_sum += "/" + service_sum;

        dto.setRoom_stayno(stayRoom_roomStayNo);
        dto.setRoom_name(stayRoom_name);
        dto.setRoom_desc(stayRoom_desc);
        dto.setRoom_checkin(stayRoom_checkIn);
        dto.setRoom_checkout(stayRoom_checkOut);
        dto.setRoom_people_min(stayRoom_standardNumber);
        dto.setRoom_people_max(stayRoom_maxNumber);
        dto.setRoom_size(stayRoom_roomSize);
        dto.setRoom_features(features_sum); 
        dto.setRoom_amenities(amenities_sum);
        dto.setRoom_service(service_sum);

        // 첨부파일 한 개만 등록해놓음 -- 추후 수정 예정
        // 첨부파일 이름 변경 처리
        File stayRoom_photo = multi.getFile("member_photo");
        if (stayRoom_photo != null) {
            String fileExt = stayRoom_photo.getName().substring(stayRoom_photo.getName().lastIndexOf(".") + 1);
            String stayRoom_photo_rename = stayRoom_roomStayNo + "_" + System.currentTimeMillis() + "." + fileExt;
            stayRoom_photo.renameTo(new File(saveFolder + "/" + stayRoom_photo_rename));

            // DB에 저장되는 파일 이름
            // 저장이름 : /data/저장폴더/회원아이디_현재날짜(유닉스타임)
            String fileDBName = thisFolder + stayRoom_photo_rename;
            dto.setRoom_photo1(fileDBName);
        }

        StayDAO dao = StayDAO.getInstance();
        int res = dao.registerStayRoom(dto);

        ActionForward forward = new ActionForward();
        PrintWriter out = response.getWriter();

        if (res > 0) {
            forward.setRedirect(true);
            forward.setPath("stayRoomList.do?stay_no=" + stayRoom_roomStayNo);
        } else {
            out.println("<script> alert('Room 등록 중 에러가 발생했습니다.'); history.back(); </script>");
        }

        return forward;

    }

}