<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% long time = System.currentTimeMillis(); %>
<jsp:include page="../layout/layout_header.jsp" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/asset/css/member.css?<%=time%>" />
<script language="javascript" src="<%=request.getContextPath()%>/asset/js/member.js?<%=time%>"></script>



<div class="container page-title">
    <h2>FIND ID/PW</h2>
    <h4>아이디/비밀번호 찾기</h4>
</div>



<div class="container member-form find">
    <form name="find_form" method="post" action="<%=request.getContextPath()%>/memberFindIdPwOk.do">
    <fieldset class="mf-wrap">
        <legend>아이디/비밀번호 찾기</legend>
        <div class="mf-select">
            <label><input type="radio" name="find_mode" value="id" checked="checked" /> 아이디 찾기</label>
            <label><input type="radio" name="find_mode" value="pw" /> 비밀번호 찾기</label>
        </div>

        <div class="mf-form">
            <p><input type="email" name="find_email" placeholder="가입한 이메일" required autofocus /></p>
            <p id="fid"><input type="text" name="find_name" placeholder="가입한 이름" required /></p>
            <p id="fpw" class="displaynone"><input type="text" name="find_id" placeholder="가입한 아이디" required /></p>
        </div>

        <div class="mf-msg">존재하지 않는 이메일입니다.</div>

        <div class="mf-btn">
            <p><button type="submit">FIND <span>ID</span></button></p>
            <p><a href="memberLogin.do">로그인</a></p>
        </div>
    </fieldset>
    </form>
</div>



<jsp:include page="../layout/layout_footer.jsp" />