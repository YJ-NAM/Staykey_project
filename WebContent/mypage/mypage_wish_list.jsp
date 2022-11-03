<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../layout/layout_header.jsp" />
<jsp:include page="../mypage/mypage_header.jsp" />

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
	$("#mymenu-wish").addClass("now");
</script>



<div class="wish-list">관심 스테이 목록</div>

<br>
<br>
<c:forEach items="${ stay }" var="dto">
<!-- 이름 영역 -->
<div class="name">
	<span class="ellipsis" style="padding-bottom: 0px;">
		${dto.stay_name} </span>
</div>
<br>

<!-- 위치, 인원, 가격 영역 -->
<div>
	<p class="option">
		${dto.stay_location}<br> 
		최소 ${dto.stay_room_people_min}명 / 최대 ${dto.stay_room_people_max}명<br>
		₩<fmt:formatNumber value="${dto.stay_room_price_min}" /> ~ ₩<fmt:formatNumber value="${dto.stay_room_price_max}" />
	</p>
</div>
<br><br>
</c:forEach>
<!-- 예약하기 버튼 -->
<div class="btns">
	<button type="button" class="btn_bk">
		<a href="https://booking.stayfolio.com/places/on-a">예약하기</a>
	</button>
</div>

<!-- 이미지 영역 -->
<div class="likestay_img" style="padding-top: 0px;">




	<jsp:include page="../mypage/mypage_footer.jsp" />
	<jsp:include page="../layout/layout_footer.jsp" />