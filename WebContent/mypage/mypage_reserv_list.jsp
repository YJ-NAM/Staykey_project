<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../layout/layout_header.jsp" />
<jsp:include page="../mypage/mypage_header.jsp" />

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />

<c:set var="reservList" value="${reservList}" />
<c:set var="imgList" value="${imgList}" />

<script type="text/javascript">
	$("#mymenu-reserv").addClass("now");
</script>

	
<div class="reserv-list">

    <p class="status_notyet">
            <a href="#">다가올 예약 </a> &nbsp;&nbsp; 
        <span class="status">
            | &nbsp;&nbsp; 
            <a href="<%=request.getContextPath()%>/mypageReservCompletionList.do">이용 완료 </a>
        </span>
    </p>

    <br> <br> <br>

	<!-- 이미지 영역 -->
	

	<c:forEach items="${reservList}" var="dto">
		
		<c:forEach items="${imgList}" var="img">
		<c:if test="${dto.reserv_start > today }">
		
		<img src="<%=request.getContextPath()%>${img.stay_file1 }" alt="" width="400" height="250"/>
				
	
	<!-- 예약 상태 -->
	
		<c:set var="stt" value="${dto.reserv_status }" />
		
			<c:if test="${stt eq 'reserv'}">
				<c:set var="result" value="예약 중" />
			</c:if>
		
				<c:if test="${stt eq 'cancle'}">
					<c:set var="result" value="예약 취소" />
				</c:if> 
			
			<p><b>${result}</b></p>
		

	<br>
	

 	<!-- 숙소 이름 -->
	<p>${dto.reserv_stayname}</p>
	<br>
	

	<!-- 2022.01.01~2022.0102 (1박) 날짜 -->
	
	<fmt:parseDate var="start" value="${dto.reserv_start}" pattern="yyyy-MM-dd HH:mm"/>
	<fmt:formatDate var="reserv_start" value="${start}" pattern="yyyy.MM.dd"/>

	<fmt:parseDate var="end" value="${dto.reserv_end}" pattern="yyyy-MM-dd HH:mm"/>
	<fmt:formatDate var="reserv_end" value="${end}" pattern="yyyy.MM.dd"/>
	
	<p>${reserv_start } ~ ${reserv_end } (${dto.reserv_daycount }박) </p>
	

	
	<!-- 룸타입 / 예약 인원 -->
	<c:set var="allpeople" value="${dto.reserv_people_adult + dto.reserv_people_kid + dto.reserv_people_baby}"></c:set>

	 <p>${dto.reserv_roomname} / ${allpeople}명
	 </p>
	
	<!-- 결제 금액 -->
	<p> ₩ <fmt:formatNumber value="${dto.reserv_total_price}" /> </p>
	<br>
	</c:if>
	</c:forEach>
		</c:forEach>
		
		
	<!-- 예약 상세 확인 버튼 -->
	 	<div class="btns">
			<br>
			<button type="button" class="btn_bk">
				<a href="<%=request.getContextPath()%>/mypageReservView.do?reserv_sess=${dto.reserv_sess}">예약 상세 확인</a>
			</button>
		</div>
		<br> <br> <br>

	</div> 


<jsp:include page="../mypage/mypage_footer.jsp" />
<jsp:include page="../layout/layout_footer.jsp" />