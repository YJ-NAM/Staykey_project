package com.site.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.MemberDTO;
import com.model.QnaCommentDAO;
import com.model.QnaCommentDTO;
import com.model.QnaDAO;
import com.model.QnaDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class SiteMypageQnaModifyOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        HttpSession session = request.getSession();
        String id = (String)session.getAttribute("login_id");


        QnaDAO dao = QnaDAO.getInstance();
        PrintWriter out = response.getWriter();


        // 파일 업로드 설정
        String thisFolder = "/data/qna/";
        String saveFolder = request.getSession().getServletContext().getRealPath(thisFolder);
        int fileSize = 25 * 1024 * 1024; // 10MB

        // 업로드 폴더 체크 후 없으면 생성
        File dirChk = new File(saveFolder);
        if (!dirChk.exists()) {
            dirChk.mkdir();
        }

        // 파일 업로드 객체 생성
        MultipartRequest multi = new MultipartRequest(request, saveFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());


        // 입력값 정리
	    int bbs_no = Integer.parseInt(multi.getParameter("bbs_no"));
	    String bbs_title = multi.getParameter("bbs_title");
	    String bbs_content = multi.getParameter("bbs_content");


        // 문의글 객체에 저장
        QnaDTO dto = new QnaDTO();
        dto.setBbs_title(bbs_title);
        dto.setBbs_content(bbs_content);


        // 첨부파일 이름 변경 처리
        File bbs_file1 = multi.getFile("bbs_file1");
        if(bbs_file1 != null) {
            String fileExt = bbs_file1.getName().substring(bbs_file1.getName().lastIndexOf(".") + 1);
            String bbs_file1_rename = id + "_file1_" + System.currentTimeMillis() + "." + fileExt;
            bbs_file1.renameTo(new File(saveFolder + "/" + bbs_file1_rename));

            // DB에 저장되는 파일 이름
            // 저장이름 : /data/저장폴더/회원아이디_현재날짜(유닉스타임)
            String file1DBName = thisFolder + bbs_file1_rename;
            dto.setBbs_file1(file1DBName);
        }

        File bbs_file2 = multi.getFile("bbs_file2");
        if(bbs_file2 != null) {
            String fileExt = bbs_file2.getName().substring(bbs_file2.getName().lastIndexOf(".") + 1);
            String bbs_file2_rename = id + "_file2_" + System.currentTimeMillis() + "." + fileExt;
            bbs_file2.renameTo(new File(saveFolder + "/" + bbs_file2_rename));

            // DB에 저장되는 파일 이름
            // 저장이름 : /data/저장폴더/회원아이디_현재날짜(유닉스타임)
            String file2DBName = thisFolder + bbs_file2_rename;
            dto.setBbs_file2(file2DBName);
        }


        // 새로운 파일을 등록하고, 기존 파일 있으면 삭제 처리
        if(modify_photo != null && ndto.getMember_photo() != null){
            File del_pimage = new File(saveFolder+ndto.getMember_photo().replace(thisFolder, ""));
            if(del_pimage.exists()){
                if(del_pimage.delete()) {
                    System.out.println("프로필 파일 삭제 완료");
                }else {
                    System.out.println("프로필 파일 삭제 실패");
                }
            }else{
                System.out.println("파일 경로를 찾을 수 없습니다.");
            }
        }


        ActionForward forward = new ActionForward();
        int result = dao.modifyQna(dto);

        if(result > 0){
            forward.setRedirect(false);
            forward.setPath("mypageQnaView.do?no="+bbs_no);

        }else{
            // 에러 중 등록 된 파일 삭제
            String upload_photo = modify_photo.getName();
            if(upload_photo != null){
                File del_pimage = new File(saveFolder+upload_photo);
                if(del_pimage.exists()){
                    if(del_pimage.delete()) {
                        System.out.println("에러 중 등록 된 파일 삭제 완료");
                    }else {
                        System.out.println("에러 중 등록 된 파일 삭제 실패");
                    }
                }else{
                    System.out.println("에러 중 등록 된 파일 경로를 찾을 수 없습니다.");
                }
            }

            out.println("<script>alert('댓글 수정 중 에러가 발생하였습니다.'); history.back();</script>");
            forward = null;
        }

        return forward;
	}

}
