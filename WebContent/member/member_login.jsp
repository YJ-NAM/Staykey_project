<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% long time = System.currentTimeMillis(); %>
<jsp:include page="../layout/layout_header.jsp" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/asset/css/member.css?<%=time%>" />
<script language="javascript" src="<%=request.getContextPath()%>/asset/js/member.js?<%=time%>"></script>



<div class="container page-title">
    <h2>LOGIN</h2>
    <h4>회원 로그인</h4>
</div>



<div class="container member-form">
    <form name="login_form" method="post" action="<%=request.getContextPath()%>/memberLoginOk.do">
    <fieldset class="mf-wrap">
        <legend>회원 로그인</legend>

        <div class="mf-form">
            <p><input type="text" name="login_id" placeholder="회원 아이디" required autofocus /></p>
            <p><input type="password" name="login_pw" placeholder="비밀번호" required /></p>
        </div>

        <div class="mf-msg">존재하지 않는 아이디입니다.</div>

        <div class="mf-btn">
            <p><button type="submit">LOGIN</button></p>
            <p><a href="memberJoin.do">회원가입</a></p>
        </div>

        <div class="mf-find"><a href="<%=request.getContextPath()%>/memberFindIdPw.do"><i class="fa fa-question-circle"></i> 아이디/비밀번호 찾기</a></div>
    </fieldset>
    </form>
</div>



<jsp:include page="../layout/layout_footer.jsp" />