<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% long time = System.currentTimeMillis(); %>
<jsp:include page="../layout/layout_header.jsp" />
<script type="text/javascript">$("#nav-magazine").addClass("now");</script>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/asset/css/magazine.css?<%=time%>" />
<script language="javascript" src="<%=request.getContextPath()%>/asset/js/magazine.js?<%=time%>"></script>



<div class="container page-title">
    <h2>JOURNAL</h2>
    <h4>스테이:키의 관점으로 스테이를 조명합니다.</h4>
</div>



<div class="container magazine-list">

매거진 목록

</div>



<jsp:include page="../layout/layout_footer.jsp" />