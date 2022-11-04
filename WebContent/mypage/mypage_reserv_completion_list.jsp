<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../layout/layout_header.jsp" />
<jsp:include page="../mypage/mypage_header.jsp" />

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="reservList" value="${reservList}" />
<c:set var="stayList" value="${stayList}" />

<script type="text/javascript">
	$("#mymenu-reserv").addClass("now");
</script>


<div class="reserv-list">

	<p class="status_notyet">
			<a href="<%=request.getContextPath()%>/mypageReservList.do">다가올 예약 </a> &nbsp;&nbsp; 
		<span class="status">
			| &nbsp;&nbsp; 
			<a href="#">이용 완료 </a>
		</span>
	</p>
	
	<br> <br> <br>




</div>	


<jsp:include page="../mypage/mypage_footer.jsp" />
<jsp:include page="../layout/layout_footer.jsp" />