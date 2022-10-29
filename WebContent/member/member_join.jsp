<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% long time = System.currentTimeMillis(); %>
<jsp:include page="../layout/layout_header.jsp" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/asset/css/member.css?<%=time%>" />



<div class="container member-join">


회원 가입


</div>



<jsp:include page="../layout/layout_footer.jsp" />