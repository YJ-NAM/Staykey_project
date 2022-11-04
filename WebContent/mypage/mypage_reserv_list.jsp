<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../layout/layout_header.jsp" />
<jsp:include page="../mypage/mypage_header.jsp" />

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="reservList" value="${reservList}" />

<script type="text/javascript">
	$("#mymenu-reserv").addClass("now");
</script>


<div class="reserv-list">

	예약 목록 <br>
	<br>



	<%-- 	<!-- 이미지 영역 -->

 			<c:choose>
				<c:when test="${!empty dto.stay_file1}"> 
					<img src="<%=request.getContextPath()%>${dto.stay_file1 }" alt="" width="400" height="250"/>
					
 				</c:when>
						<c:otherwise> <!-- 이미지가 없는 경우 기본 이미지 -->
							<svg class="bd-placeholder-img" width="60" height="60"
								xmlns="http://www.w3.org/2000/svg"
								preserveAspectRatio="xMidYMid slice" focusable="false"
								role="img">
	                            <title>${dto.bbs_no}</title>
	                            <rect width="100%" height="100%" fill="#eee"></rect>
	                            <text x="48%" y="54%" fill="#888" dy=".1em">no img</text>
	                        </svg>
						</c:otherwise> 
			</c:choose> --%>

	<c:forEach items="${reservList}" var="dto">

	<!-- 예약 상태 -->

	<p>${dto.reserv_status}</p>
	<br>

	<!-- 숙소 이름 -->
	<p>${dto.reserv_stayname}</p>
	<br>


	<!-- 2022.01.01~2022.0102 (1박) 날짜 -->


	<!-- 룸타입 / 예약 인원 -->

	<p>${dto.reserv_roomname}</p>
	/
	<p>${dto.reserv_people_adult}+${dto.reserv_people_kid}+${dto.reserv_people_baby}명
	</p>


	<!-- 결제 금액 -->
	<p> ₩ <fmt:formatNumber value="${dto.reserv_total_price}" /> </p>
	<br>

	<!-- 예약 상세 확인 버튼 -->
		<div class="btns">
			<br>
			<button type="button" class="btn_bk">
				<a
					href="<%=request.getContextPath()%>/stayView.do?stay_no=${dto.stay_no}">예약 상세 확인</a>
			</button>
		</div>
		<br> <br> <br>

	
		</c:forEach>

	</div>



<jsp:include page="../mypage/mypage_footer.jsp" />
<jsp:include page="../layout/layout_footer.jsp" />