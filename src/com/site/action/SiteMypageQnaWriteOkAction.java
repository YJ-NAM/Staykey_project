package com.site.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.QnaDAO;
import com.model.QnaDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class SiteMypageQnaWriteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 문의글 등록 하는 비지니스 로직.
        QnaDAO dao = QnaDAO.getInstance();
        QnaDTO dto = new QnaDTO();
        
		HttpSession session = request.getSession();
		
		//세션 아이디 값 받아오기.
		String id = (String)session.getAttribute("login_id");
		String pw = (String)session.getAttribute("login_pw");
		String name = (String)session.getAttribute("login_name");
		
        // 파일 업로드 설정
        String thisFolder = "/data/qna/";
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
        String bbs_title = multi.getParameter("bbs_title").trim();
        String bbs_content = multi.getParameter("bbs_content").trim();
 
        
        // 첨부파일 이름 변경 처리
        File bbs_file1 = multi.getFile("bbs_file1");
        if(bbs_file1 != null) {
            String fileExt = bbs_file1.getName().substring(bbs_file1.getName().lastIndexOf(".") + 1);
            String bbs_file1_rename = id + "_" + System.currentTimeMillis() + "." + fileExt;
            bbs_file1.renameTo(new File(saveFolder + "/" + bbs_file1_rename));

            // DB에 저장되는 파일 이름
            // 저장이름 : /data/저장폴더/회원아이디_현재날짜(유닉스타임)
            String fileDBName = thisFolder + bbs_file1_rename;
            dto.setBbs_file1(fileDBName);
        }

        File bbs_file2 = multi.getFile("bbs_file2");
        if(bbs_file2 != null) {
        	String fileExt = bbs_file2.getName().substring(bbs_file2.getName().lastIndexOf(".") + 1);
        	String bbs_file2_rename = id + "_" + System.currentTimeMillis() + "." + fileExt;
        	bbs_file2.renameTo(new File(saveFolder + "/" + bbs_file2_rename));
        	
        	// DB에 저장되는 파일 이름
        	// 저장이름 : /data/저장폴더/회원아이디_현재날짜(유닉스타임)
        	String fileDBName = thisFolder + bbs_file2_rename;
        	dto.setBbs_file2(fileDBName);
        }
        
        dto.setBbs_writer_id(id);
        dto.setBbs_writer_pw(pw);
        dto.setBbs_writer_name(name);
        dto.setBbs_title(bbs_title);
        dto.setBbs_content(bbs_content);
        dto.setBbs_status("send");
        
        int res = dao.registerQna(dto);
        
        ActionForward forward = new ActionForward();
        PrintWriter out = response.getWriter();

        if (res > 0) {
        	forward.setRedirect(true);
        	forward.setPath("mypageQnaList.do");
        }else {
            out.println("<script>alert('문의글 등록 중 에러가 발생하였습니다.'); history.back();</script>");

        }

        return forward;
	}

}
