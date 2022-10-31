<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% long time = System.currentTimeMillis(); %>
<jsp:include page="../layout/layout_header.jsp" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/asset/css/member.css?<%=time%>" />
<script language="javascript" src="<%=request.getContextPath()%>/asset/js/member.js?<%=time%>"></script>



<div class="container page-title">
    <h2>FIND RESULT</h2>
    <h4>아이디/비밀번호 찾기 결과</h4>
</div>



<div class="container member-form result">
    <div class="mf-wrap">
        <legend>아이디/비밀번호 찾기 결과</legend>

        <div class="mf-result">회원님이 가입하신<br />아이디는 <strong>test1234</strong> 입니다.</div>

        <div class="mf-btn">
            <p><a href="memberLogin.do">로그인</a></p>
        </div>
    </div>
</div>



<jsp:include page="../layout/layout_footer.jsp" />