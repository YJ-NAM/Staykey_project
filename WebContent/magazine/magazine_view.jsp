<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<% long time = System.currentTimeMillis(); %>
<jsp:include page="../layout/layout_header.jsp" />
<script type="text/javascript">$("#nav-magazine").addClass("now");</script>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/asset/css/magazine.css?<%=time%>" />
<script language="javascript" src="<%=request.getContextPath()%>/asset/js/magazine.js?<%=time%>"></script>
<c:set var="magazine" value="${ magazineList }"/>
















<jsp:include page="../layout/layout_footer.jsp" />