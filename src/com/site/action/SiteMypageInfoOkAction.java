package com.site.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.MagazineDAO;
import com.model.MagazineDTO;
import com.model.MemberDAO;
import com.model.MemberDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class SiteMypageInfoOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		
		// dto, dao 생성
		MemberDTO dto = new MemberDTO();
		MemberDAO dao = MemberDAO.getInstance();

		
		// 파일 업로드 설정
		String thisFolder = "/data/member/";
		String saveFolder = request.getSession().getServletContext().getRealPath(thisFolder);
		int fileSize = 25 * 1024 * 1024; // 10MB
		

		// 업로드 폴더 체크 후 없으면 생성
		File dirChk = new File(saveFolder);
		if (!dirChk.exists()) {
			dirChk.mkdir();
		}
		

		// 파일 업로드 객체 생성
		MultipartRequest multi = new MultipartRequest(request, saveFolder, fileSize, "UTF-8",
				new DefaultFileRenamePolicy());

		
		// 파라미터 정리
		String member_id = multi.getParameter("member_id");
		String member_email = multi.getParameter("member_email");
		String member_name = multi.getParameter("member_name");
		String member_phone = multi.getParameter("member_phone");
		String mypage_pw = multi.getParameter("mypage_pw");

		
		dto.setMember_id(member_id);
		dto.setMember_email(member_email);
		dto.setMember_name(member_name);
		dto.setMember_phone(member_phone);
		dto.setMember_pw(mypage_pw);
		
		
		// 순서 지정 문제 해결 위함
		// 새로 업로드된 파일
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_photo", multi.getFile("member_photo"));

		
		// 기존 파일 정보 가져오기 위함
		MemberDTO originalDTO = dao.getMemberInfo(member_id);
		
		String original_member_photo = originalDTO.getMember_photo();

		
		// delete folder 현재 경로 받아옴
		String delFolder = request.getSession().getServletContext().getRealPath("/");

		Iterator<Map.Entry<String, Object>> iterator = map.entrySet().iterator(); // iterator로 다음 값 가져옴
		String original_file = ""; // 예전 파일 변수로 지정

		while (iterator.hasNext()) {
			Entry<String, Object> e = iterator.next();
			File file = (File) e.getValue(); // map에 저장된 파일 객체의 value 값만 얻어와서 File형으로 casting

			switch (e.getKey()) { // original file 값 할당
			case "member_photo":
				original_file = original_member_photo;
				break;
			}

			if (file != null) { // value 값이 null이 아니면(new file 있음)
				File del_image = new File(delFolder + original_file);
				if (del_image.exists()) {
					del_image.delete();
				}
				String fileExt = file.toString().substring(file.toString().lastIndexOf(".") + 1); // 확장자 분리
				String fileRename = e.getKey() + "_modify_" + System.currentTimeMillis() + "." + fileExt; // 파일 rename
				file.renameTo(new File(saveFolder + fileRename)); // file을 인자로 전달된 파일의 경로로 변경
				map.replace(e.getKey(), thisFolder + fileRename); // 현재 key 값에 새로운 value 값을 map에 저장
			} else { // new file 없으면
				
				if (original_file != null) {// 예전 파일이 null이 아니면
					map.replace(e.getKey(), original_file); // 예전 값 할당
				} else {
					map.replace(e.getKey(), ""); // null 값 처리 위함
				}
			}
		}

		dto.setMember_photo(map.get("member_photo").toString());

		
		// 수정 업로드 메서드
		int res = dao.membersiteModify(dto);

		
		// 포워드 실행
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();

		if (res > 0) {
			forward.setRedirect(true);
			forward.setPath("mypageInfo.do");
		} else {
			out.println("<script> alert('회원 정보 수정 중 에러가 발생했습니다.'); history.back(); </script>");
			}
			return forward;
		}
}


