<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% long time = System.currentTimeMillis(); %>
<jsp:include page="../layout/layout_header.jsp" />
<script type="text/javascript">$("#nav-event").addClass("now");</script>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/asset/css/event.css?<%=time%>" />
<script language="javascript" src="<%=request.getContextPath()%>/asset/js/event.js?<%=time%>"></script>



<div class="container page-title">
    <h2>PROMOTION</h2>
    <h4>스테이:키가 제안하는 여행 레시피</h4>
</div>



<div class="container event-list">

이벤트 목록

</div>



<jsp:include page="../layout/layout_footer.jsp" />