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



<div class="reserv-view">


	<c:forEach items="${reservList}" var="reserv">
	
			<c:forEach items="${stayList}" var="stay">

		<form action="<%=request.getContextPath()%>/mypageReservDeleteOk.do?no=${reserv.reserv_no}" method="post">

			<%-- <img src="<%=request.getContextPath()%>${img.stay_file1 }" alt="" width="400" height="250"/> --%>


			<!-- 숙소 정보 -->

			<p>
				예약정보 > ${reserv.reserv_stayname} <b>(${reserv.reserv_sess})</b>
			<p>
				<br>
			<p>${reserv.reserv_stayname}
			<p>
				<br>
			<p>${stay.stay_addr}
			<p>
			<p>${stay.stay_phone}
			<p>
			<p>${stay.stay_email}
			<p>
				<br> | 예약 안내 <br>
				<br>
			<p>
				<b>01. 예약 번호</b> ${reserv.reserv_sess }(예약 신청 : ${reserv.reserv_date })
			</p>
			<p>
				<b>02. 스테이 및 객실</b> ${reserv.reserv_stayname } &nbsp; /
				&nbsp;${reserv.reserv_roomname }
			</p>

			<c:set var="allpeople"
				value="${reserv.reserv_people_adult + reserv.reserv_people_kid + reserv.reserv_people_baby}"></c:set>

			<p>
				<b>03. 예약 인원</b> 총 ${allpeople}명 (성인: ${reserv.reserv_people_adult }명
				/ 아동 : ${reserv.reserv_people_kid} / 영아 :
				${reserv.reserv_people_baby})
			</p>

			<!-- <룸에서도 정보 넘기기> -->
			<!-- <!!!수기로작성함!!!> -->
			<!-- <!!!수기로작성함!!!> -->
			<!-- <!!!수기로작성함!!!> -->
			<p>
				<b>04. 체크인</b> 2023-02-24 15:00
			</p>
			<p>
				<b>05. 체크아웃</b> 2023-02-25 11:00
			</p>
			<!-- <!!!수기로작성함!!!> -->
			<!-- <!!!수기로작성함!!!> -->
			<!-- <!!!수기로작성함!!!> -->


			<hr>

				<b>06. 옵션</b>

				<!-- 옵션이 있는 경우 -->
		
					<c:if test="${!empty reserv.reserv_option1_name}">
						<p>옵션명 : ${reserv.reserv_option1_name}</p>
						<p>옵션 가격 : ${reserv.reserv_option1_price}</p>
					</c:if>
					
					<c:if test="${!empty reserv.reserv_option2_name}">
						<p>옵션명 : ${reserv.reserv_option2_name}</p>
						<p>옵션 가격 : ${reserv.reserv_option2_price}</p>
					</c:if>
					
					<c:if test="${!empty reserv.reserv_option3_name}">
						<p>옵션명 : ${reserv.reserv_option3_name}</p>
						<p>옵션 가격 : ${reserv.reserv_option3_price}</p>
					</c:if>

					<c:if test="${empty reserv.reserv_option1_name && empty reserv.reserv_option2_name && empty reserv.reserv_option3_name}">
						<p>옵션이 없습니다.</p>
					</c:if>


			<hr>

			<b>07. 요청사항 </b> 
			
							<c:if test="${!empty reserv.reserv_request}">
								<p>${reserv.reserv_request}</p>
							</c:if>

							<c:if test="${empty reserv.reserv_request}">
								<p>요청사항이 없습니다.</p>
							</c:if>


			<hr>

			<p><b>08. 안내사항 						(스테이에) 숙박권의 재판매, 양도, 양수, 교환을 금지합니다 (작게) 예약자의
													부득이한사유로~~<b></p>

			<hr>
			
			
			
			
			| 결제 정보		<br>
			<br>

			<p>
				<b>01. 결제 금액</b> 		
				
				
									${reserv.reserv_stayname } &nbsp; / &nbsp;  ${reserv.reserv_roomname } (${reserv.reserv_daycount }박)
									₩ <fmt:formatNumber value="${reserv.reserv_basic_price}" />		</p> 
											
										
									<c:if test="${ reserv.reserv_option1_price > 0}">
										<p>${reserv.reserv_option1_name} &nbsp; ₩ <fmt:formatNumber value="${reserv.reserv_option1_price}" /></p>
									</c:if>
									
									<c:if test="${reserv.reserv_option2_price > 0}">
										<p>${reserv.reserv_option2_name} ₩ <fmt:formatNumber value="${reserv.reserv_option2_price}" /></p>
									</c:if>
									
									<c:if test="${ reserv.reserv_option3_price > 0}">
										<p>${reserv.reserv_option3_name} ₩ <fmt:formatNumber value="${reserv.reserv_option3_price}" /></p>
									</c:if>
				
									<c:if test="${empty reserv.reserv_option1_price && empty reserv.reserv_option2_price && empty reserv.reserv_option3_price}">
										<p></p>
									</c:if>
					
						
			
			<hr>
					
			<p>
				<b>총 결제 금액</b> 		₩ <fmt:formatNumber value="${reserv.reserv_total_price}" />
			</p>
			
			<hr>

<!-- 예약 취소 버튼 -->
	 	<div class="btns">
			<br>
                <button type="submit" class="btn_bk">예약 취소 버튼</button>
		</div>
		<br> <br> <br>
		
		</form>
		

		</c:forEach>
	</c:forEach>


</div>



<jsp:include page="../mypage/mypage_footer.jsp" />
<jsp:include page="../layout/layout_footer.jsp" />