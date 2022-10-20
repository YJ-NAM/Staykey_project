package com.admin.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;
import com.model.MemberDAO;
import com.model.MemberDTO;
import com.util.Paging;


public class AdminMemberListAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // 전체 레코드를 조회하여 해당 전체 리스트를 view page 로 이동시키는 비지니스 로직.

        MemberDAO dao = MemberDAO.getInstance();

        // 뷰에 전달할 매개변수 저장용 맵 생성
        Map<String, Object> map = new HashMap<String, Object>();


        // 검색용 변수들 정의
        String ps_type = "";
        String ps_name = "";
        String ps_id = "";
        String ps_email = "";
        String ps_order = "";
        if(request.getParameter("ps_type") != null){ ps_type = request.getParameter("ps_type").trim(); }else{ ps_type = "all"; }
        if(request.getParameter("ps_name") != null){ ps_name = request.getParameter("ps_name").trim(); }else{ ps_name = ""; }
        if(request.getParameter("ps_id") != null){ ps_id = request.getParameter("ps_id").trim(); }else{ ps_id = ""; }
        if(request.getParameter("ps_email") != null){ ps_email = request.getParameter("ps_email").trim(); }else{ ps_email = ""; }
        if(request.getParameter("ps_order") != null){ ps_order = request.getParameter("ps_order").trim(); }else{ ps_order = "register_desc"; }

        // 뷰에 전달할 매개변수 추가
        map.put("ps_type", ps_type);
        map.put("ps_name", ps_name);
        map.put("ps_id", ps_id);
        map.put("ps_email", ps_email);
        map.put("ps_order", ps_order);



        // 페이징 변수들 정의
        int rowsize = 3; // 한 페이지당 보여질 게시물의 갯수
        int block = 5; // 아래에 보여질 페이지의 최대 블럭 수

        // 전체 데이터 갯수
        int totalRecord = dao.getTotalCount(map);
        request.setAttribute("listCount", totalRecord);

        // 전체 페이지 갯수
        int allPage = (int)Math.ceil(totalRecord / (double)rowsize);

        // 현재 페이지 변수
        int page = 0;
        if(request.getParameter("page") != null){
            page = Integer.parseInt(request.getParameter("page").trim());
        }else{
            page = 1;
        }


        int startBlock = (((page - 1) / block) * block) + 1;
        int endBlock = (((page - 1) / block) * block) + block;

        if(endBlock > allPage){
            endBlock = allPage;
        }


        // 페이지 이동 URL
        String pageUrl = request.getContextPath()+"/admin/memberList.do?ps_type="+ps_type+"&ps_name="+ps_name+"&ps_id="+ps_id+"&ps_email="+ps_email+"&ps_order="+ps_order;


        // 뷰에 전달할 매개변수 추가
        map.put("pagingWrite", Paging.showPage(allPage, startBlock, endBlock, page, pageUrl));
        request.setAttribute("map", map);


        // 목록 조회 메서드
        List<MemberDTO> list = dao.memberList(page, rowsize, map);
        request.setAttribute("List", list);


        ActionForward forward = new ActionForward();
        forward.setRedirect(false);
        forward.setPath("member/member_list.jsp");

        return forward;
    }

}
