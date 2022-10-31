<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% long time = System.currentTimeMillis(); %>
<jsp:include page="../layout/layout_header.jsp" />
<script type="text/javascript">$("#nav-stay").addClass("now");</script>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/asset/css/stay.css?<%=time%>" />
<script language="javascript" src="<%=request.getContextPath()%>/asset/js/stay.js?<%=time%>"></script>



<div class="container page-title">
    <h2>find stay</h2>
    <h4>머무는 것 자체로 여행이 되는 공간</h4>
</div>



<div class="container stay-list">

숙소 목록

</div>



<jsp:include page="../layout/layout_footer.jsp" />