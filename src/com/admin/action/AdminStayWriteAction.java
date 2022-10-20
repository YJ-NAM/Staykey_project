package com.admin.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.StayRoomDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class AdminStayWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 숙소 등록하기
		
		StayRoomDTO dto = new StayRoomDTO();
	
        // 파일 업로드 설정
        String thisFolder = "/data/stay/";
        String saveFolder = request.getSession().getServletContext().getRealPath(thisFolder);
        int fileSize = 10 * 1024 * 1024; // 10MB

        // 파일 업로드 객체 생성
        MultipartRequest multi = new MultipartRequest(request, saveFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());

		
		return null;
	}

}
