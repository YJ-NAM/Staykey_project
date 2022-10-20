package com.admin.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.controller.ActionForward;


public class AdminMemberModifyOkAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	// 회원 수정 비지니스 로직
    	
    	String member_type = request.getParameter("member_type").trim();


    	System.out.println("member_type");
  


        return null;
    }

}
