package com.admin.action;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.MemberDAO;
import com.model.MemberDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class AdminMemberModifyOkAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // 회원 수정

        MemberDTO dto = new MemberDTO();
        MemberDAO dao = MemberDAO.getInstance();

        // 파일 업로드 설정
        String thisFolder = "/data/profile/";
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

        // 비밀번호 변경 값
        String member_pw = multi.getParameter("member_pw_chg").trim();

        // 비밀번호 변경 값이 없으면 기존에 히든으로 넘겨줬던 비밀번호 값을 받아준다.
        if (member_pw == null) {
            member_pw = request.getParameter("member_pw").trim();
        }

        // 파라미터 정리
        String member_type = multi.getParameter("member_type").trim();
        String member_id = multi.getParameter("member_id").trim();
        String member_name = multi.getParameter("member_name").trim();
        String member_email = multi.getParameter("member_email").trim();
        String member_phone = multi.getParameter("member_phone").trim();

        dto.setMember_type(member_type);
        dto.setMember_id(member_id);
        dto.setMember_pw(member_pw);
        dto.setMember_name(member_name);
        dto.setMember_email(member_email);
        dto.setMember_phone(member_phone);

        // DB에서 회원 아이디에서 기존에 있던 프사 주소값 가져오기
        dao.getMemberInfo(member_id);
        String member_photo = dto.getMember_photo();

        if (member_photo != null) {
            System.out.println(saveFolder + member_photo);
            File del_pimage = new File(saveFolder + member_photo);
            // del_pimage.delete() 실제로 삭제시키는 메서드
            if (del_pimage.exists()) {
                if (del_pimage.delete()) {
                    System.out.println("프로필 파일 삭제 완료");
                } else {
                    System.out.println("프로필 파일 삭제 실패");
                }
            }
        }

        return null;
    }

}
