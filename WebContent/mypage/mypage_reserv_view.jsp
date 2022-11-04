<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../layout/layout_header.jsp" />
<jsp:include page="../mypage/mypage_header.jsp" />

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="reservList" value="${reservList}" />
<c:set var="stayList" value="${stayList}" />

<script type="text/javascript">$("#mymenu-reserv").addClass("now");</script>



<div class="reserv-view">


	<c:forEach items="${reservList}" var="reserv">
		
		<c:forEach items="${stayList}" var="stay">
		
		
		<%-- <img src="<%=request.getContextPath()%>${img.stay_file1 }" alt="" width="400" height="250"/> --%>
				
	
	<!-- 숙소 정보 -->
	
		<p>예약정보 > ${reserv.reserv_stayname} <b>(${reserv.reserv_sess})</b><p>
		<br>
		
		<p>${reserv.reserv_stayname}<p>
		<br>
		

		<p>${stay.stay_addr}<p>
		<p>${stay.stay_phone}<p>
		<p>${stay.stay_email}<p>
		<br>
		
		
		| 예약 안내
		<br>
		
		<p>01. 예약 번호			${reserv.reserv_sess }(예약 신청 : ${reserv.reserv_date })</p>
		<p>02. 스테이 및 객실		${reserv.reserv_stayname } &nbsp; / &nbsp;${reserv.reserv_roomname } </p>
		
			<c:set var="allpeople" value="${reserv.reserv_people_adult + reserv.reserv_people_kid + reserv.reserv_people_baby}"></c:set>

		<p>03. 예약 인원			총 ${allpeople}명 (성인: ${reserv.reserv_people_adult }명 / 아동 : ${reserv.reserv_people_kid} / 영아 : ${reserv.reserv_people_baby})
					
		<p>02. 체크인				2023-02-24 15:00 <!-- <룸에서도 정보 넘기기;;> -->
		<p>02. 체크아웃 			2023-02-25 11:00 <!-- <룸에서도 정보 넘기기;;> -->


		
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
	
	</c:forEach>
		</c:forEach>
		
		
	<!-- 예약 취소 버튼 -->
	 	<div class="btns">
			<br>
			<button type="button" class="btn_bk">
				<a href="<%=request.getContextPath()%>/mypageReservView.do?reserv_sess=${dto.reserv_sess}">예약 취소 버튼</a>
			</button>
		</div>
		<br> <br> <br>

	</div> 



<jsp:include page="../mypage/mypage_footer.jsp" />
<jsp:include page="../layout/layout_footer.jsp" />