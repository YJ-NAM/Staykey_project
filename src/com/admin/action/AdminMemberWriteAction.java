package com.admin.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.MemberDAO;
import com.model.MemberDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class AdminMemberWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		// 회원을 등록하는 곳.
		// 자료실 폼 페이지에서 넘어온 데이터들을 DB에 저장하는 비지니스 로직.

		MemberDTO dto = new MemberDTO();

		// 파일 업로드 시에는 설정 내용이 있음.

		// 1. 파일 저장할 경로 지정.
		String saveFolder = request.getSession().getServletContext().getRealPath("/data/profile/");
		// 2. 첨부파일 크기 지정.
		int fileSize = 10 * 1024 * 1024; // 10MB

		// 3. MuitlpartRequest 객체 생성
		// ==> 파일 업로드를 진행하기 위한 객체 생성.
		MultipartRequest multi = new MultipartRequest(request, // 일반적인 request 객체.
				saveFolder, // 첨부파일이 저장될 경로.
				fileSize, // 업로드할 첨부 파일의 최대 경로
				"UTF-8", // 문자 인코딩 방식
				new DefaultFileRenamePolicy() // 파일의 이름이 같은 경우 중복이 안되게 설정.
		);
		// 자료실 폼 페이지에서 넘어온 데이터들을 받아 주자.
		String type = multi.getParameter("type").trim();
		String id = multi.getParameter("id").trim();
		String pw = multi.getParameter("pw").trim();
		String name = multi.getParameter("name").trim();
		String email = multi.getParameter("email").trim();
		String phone = multi.getParameter("phone").trim();
		
		// 자료실 폼 페이지에서 type="file"로 되어 있으면 getFile() 메서드로 받아주어야 함.

		File photo = multi.getFile("photo");

		if (photo != null) { // 첨부파일이 존재하는 경우

			// 우선은 첨부파일의 이름을 알아야 함.
			// getName() 메서드를 이용하면 이름을 알 수 있음.
			String flieName = photo.getName();

			// 날짜 객체 생성
			Calendar cal = Calendar.getInstance();
			int year = cal.get(Calendar.YEAR);

			int month = cal.get(Calendar.MONTH) + 1;

			int day = cal.get(Calendar.DAY_OF_MONTH);

			// ....../upload/2022-10-11
			String homedir = saveFolder + "/" + year + "-" + month + "-" + day;

			// 날짜 폴더를 만들어 보자.
			File path1 = new File(homedir);

			if (!path1.exists()) { // 폴더가 존재하지 않는 경우
				path1.mkdir(); // 실제 폴더를 만들어 주는 메서드.
			}

			// 파일을 만들어 보자 ==> 예) 홍길동_파일명
			// ....../upload/2022-10-11/홍길동_파일명 여기를 한글말고 영어로 받자.
			String reFileName = id + "_" + flieName;

			photo.renameTo(new File(homedir + "/" + reFileName));

			// 실제로 DB에 저장되는 파일 이름
			// "/2022-10-11/홍길동_파일명" 으로 저장할 예정.
			String fileDBName = "/" + year + "-" + month + "-" + day + "/" + reFileName;
			dto.setMember_photo(fileDBName);
		}
		System.out.println("등록");
		dto.setMember_type(type);
		dto.setMember_id(id);
		dto.setMember_pw(pw);
		dto.setMember_name(name);
		dto.setMember_email(email);
		dto.setMember_phone(phone);
		
		MemberDAO dao = MemberDAO.getInstance();

		int res = dao.registerMember(dto);

		ActionForward forward = new ActionForward();

		PrintWriter out = response.getWriter();

		if(res > 0) {
			forward.setRedirect(true);
			forward.setPath("memberList.do");
		}else {
			out.println("<script>");
			out.println("alert('회원 등록 실패 ~~~')");
			out.println("history.back()");
			out.println("</script>");
		}

		

		return forward;
	}

}
