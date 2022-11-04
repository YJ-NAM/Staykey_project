<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../layout/layout_header.jsp" />
<jsp:include page="../mypage/mypage_header.jsp" />

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="staylist" value="${list}" />

<script type="text/javascript">
	$("#mymenu-wish").addClass("now");
</script>



<div class="wish-list">관심 스테이 목록</div>

<br>
<br>
<c:forEach items="${staylist}" var="dto">


	<!-- 이미지 영역 -->

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
			</c:choose>
			
					
					
	<!-- 이름 영역 -->
	<div class="name">
		<span class="ellipsis" style="padding-bottom: 0px;">
			${dto.stay_name} </span>
	</div>
	<br>

	<!-- 위치, 인원, 가격 영역 -->
	<div>
		<p class="option">


			${dto.stay_location}<br> 최소 ${dto.stay_room_people_min}명 / 최대
			${dto.stay_room_people_max}명<br> ₩
			<fmt:formatNumber value="${dto.stay_room_price_min}" />
			~ ₩
			<fmt:formatNumber value="${dto.stay_room_price_max}" />
		</p>
		
<!-- 예약하기 버튼 -->
<div class="btns">
	<br>
	<button type="button" class="btn_bk">
		<a href="<%=request.getContextPath()%>/stayView.do?stay_no=${dto.stay_no}">예약하기</a>
	</button>
	</div>
	<br>	<br>	<br>

	</div>
	
</c:forEach>


	<jsp:include page="../mypage/mypage_footer.jsp" />
	<jsp:include page="../layout/layout_footer.jsp" />