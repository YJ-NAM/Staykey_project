<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% long time = System.currentTimeMillis(); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="room" value="${ roomView }" />
<c:set var="stay" value="${ stayView }" />

<jsp:include page="../layout/layout_header.jsp" />
<script type="text/javascript">$("#nav-stay").addClass("now");</script>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/asset/css/reserv.css?<%=time%>" />
<script language="javascript" src="<%=request.getContextPath()%>/asset/js/reserv.js?<%=time%>"></script>




<div class="container page-title">
    <h2>BOOKING</h2>
</div>



<div class="container reserv-form">

    <!-- 상단 예약정보 //START -->
    <div class="rf-top">
        <h3 class="rft-name">${stay.stay_name}</h3>
        <div class="rft-date">${start_date} - ${end_date}<em>${daycount}박 ${daycount+1}일</em></div>
        <div class="rft-price"><fmt:setLocale value="ko_kr" /><fmt:formatNumber value="${room.room_price * daycount}" type="currency" /></div>
    </div>
    <!-- 상단 예약정보 //START -->




    <!-- 예약 폼 //START -->
    <div class="rf-wrap">
        <form name="reserv_form" method="post" action="<%=request.getContextPath()%>/stayReservOk.do">
        <div class="rfw-title">Reservations</div>


        <ul class="rfw-list">

            <li>
                <div class="tit">예약 스테이</div>
                <div class="cont">${room.room_name} / ${room.room_type}</div>
            </li>

            <li>
                <div class="tit">예약일</div>
                <div class="cont day">${start_date} ~ ${end_date}<em>${daycount}박 ${daycount+1}일</em></div>
            </li>

            <li>
                <div class="tit">이름</div>
                <div class="cont"><input type="text" name="reserv_memname" value="${login_name}" class="input-width" readonly="readonly" /></div>
            </li>

            <li>
                <div class="tit">휴대전화</div>
                <div class="cont"><input type="text" name="reserv_memphone" value="${login_phone}" class="input-width" readonly="readonly" /></div>
            </li>

            <li>
                <div class="tit">이메일</div>
                <div class="cont"><input type="text" name="reserv_mememail" value="${login_email}" class="input-width" readonly="readonly" /></div>
            </li>

            <li>
                <div class="tit">인원 (최대 ${room.room_people_max}명)</div>
                <div class="cont people">
                    <div class="select">
                        <span>성인</span>
                        <select class="adult-select">
                            <option value="1">1명</option>
                            <option selected="" value="2">2명</option>
                            <option value="3">3명</option>
                        </select>
                    </div>
                    <div class="select">
                        <span>아동</span>
                        <select class="child-select">
                            <option selected="" value="0">0명</option>
                            <option value="1">1명</option>
                            <option value="2">2명</option>
                        </select>
                    </div>
                    <span class="people-txt">아동 : 24개월 ~ 12세<br />영아 : 24개월 미만</span>
                </div>
            </li>


        </ul>


        <div class="rfw-button"><button type="submit">결제하기</button></div>
        </form>
    </div>
    <!-- 예약 폼 //END -->

</div>




<jsp:include page="../layout/layout_footer.jsp" />