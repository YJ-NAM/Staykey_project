<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../layout/layout_header.jsp" />
<jsp:include page="../mypage/mypage_header.jsp" />

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="reservList" value="${reservList}" />

<script type="text/javascript">$("#mymenu-reserv").addClass("now");</script>

	
<div class="reserv-list">

	<div class="rl-tab">
		<ul>
			<li class="<c:if test="${getType == 'come'}">now</c:if>"><a href="<%=request.getContextPath()%>/mypageReservList.do?type=come">다가올 예약</a></li>
			<li class="<c:if test="${getType == 'done'}">now</c:if>"><a href="<%=request.getContextPath()%>/mypageReservList.do?type=done">이용 완료</a></li>
			<li class="<c:if test="${getType == 'cancel'}">now</c:if>"><a href="<%=request.getContextPath()%>/mypageReservList.do?type=cancel">취소 내역</a></li>
		</ul>
	</div>



	<ul class="rl-list">
		<c:choose>
		<c:when test="${!empty reservList}">
		<c:forEach var="list" items="${reservList}">
		<li class="<c:if test="${getType == list.reserv_class}">show</c:if>">
			<a href="<%=request.getContextPath()%>/stayView.do?stay_no=${list.reserv_stayno}" class="rll-photo" style="background-image: url('<%=request.getContextPath()%>${list.reserv_stay_photo}');"></a>
			<div class="rll-info">
				<p class="sess">${list.reserv_sess}</p>
				<p class="name">${list.reserv_stayname}<small>${list.reserv_roomname}</small></p>
				<p class="date">${list.reserv_start.substring(0,10).replace("-", ". ")} ~ ${list.reserv_end.substring(0,10).replace("-", ". ")} (${list.reserv_daycount}박)</p>
				<p class="people">
					<c:if test="${list.reserv_people_adult > 0}"><span>성인 ${list.reserv_people_adult}명</span></c:if>
					<c:if test="${list.reserv_people_kid > 0}"><span>아동 ${list.reserv_people_kid}명</span></c:if>
					<c:if test="${list.reserv_people_baby > 0}"><span>영아 ${list.reserv_people_baby}명</span></c:if>
				</p>
				<p class="price"><fmt:setLocale value="ko_kr" /><fmt:formatNumber value="${list.reserv_total_price}" type="currency" /></p>
				<p class="link"><a href="<%=request.getContextPath()%>/mypageReservView.do?reserv_sess=${list.reserv_sess}"><i class="fa fa-search"></i> 예약상세내역</a></p>
			</div>
		</li>
		</c:forEach>
		</c:when>

		<c:otherwise>
		<li class="nodata">
			<p><img src="<%=request.getContextPath()%>/asset/images/no_reserv.png" alt="" /></p>
			<p>예약 정보가 없습니다. 새로운 스테이를 찾아 떠나보세요.</p>
			<a href="<%=request.getContextPath()%>/stayList.do">FIND STAY</a>
		</li>
		</c:otherwise>
		</c:choose>
	</ul>

</div>



<jsp:include page="../mypage/mypage_footer.jsp" />
<jsp:include page="../layout/layout_footer.jsp" />