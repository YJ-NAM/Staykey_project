<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% long time = System.currentTimeMillis(); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="stayList" value="${stayList}" />

<jsp:include page="../layout/layout_header.jsp" />
<script type="text/javascript">$("#nav-stay").addClass("now");</script>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/asset/css/stay.css?<%=time%>" />
<script language="javascript" src="<%=request.getContextPath()%>/asset/js/stay.js?<%=time%>"></script>



<div class="container page-title">
    <h2>find stay</h2>
    <h4>머무는 것 자체로 여행이 되는 공간</h4>
</div>




<div class="container stay-search">
    <form name="stay_search" method="post" action="<%=request.getContextPath()%>/stayList.do">
    <div class="row">
        <div class="col-auto">
            <label for="ps_stay">여행지/숙소</label>
            <input type="text" name="ps_stay" id="ps_stay" value="" class="ss-input" />
        </div>
        <div class="col-auto">
            <label for="ps_start">체크인</label>
            <button type="button" class="ss-button" id="ps_start">선택하세요</button>
        </div>
        <div class="col-auto">
            <label for="ps_end">체크아웃</label>
            <button type="button" class="ss-button" id="ps_end">선택하세요</button>
        </div>
        <a href="<%=request.getContextPath()%>/stayList.do" class="ss-reset"><i class="fa fa-refresh"></i></a>
    </div>

    <div class="row">
        <div class="col-auto">
            <label for="ps_people">인원</label>
            <button type="button" class="ss-button" id="ps_people">선택하세요</button>
        </div>
        <div class="col-auto">
            <label for="ps_price">가격범위</label>
            <button type="button" class="ss-button" id="ps_price">전체</button>
        </div>
        <div class="col-auto">
            <label for="ps_type">스테이 유형</label>
            <button type="button" class="ss-button" id="ps_type">전체</button>
        </div>
    </div>

    <button type="submit">SEARCH <i class="icon-arrow-right"></i></button>
    </form>
</div>




<ul class="container stay-order">
    <li><a href="#" class="now">추천순</a></li>
    <li><a href="#">최신순</a></li>
    <li><a href="#">인기순</a></li>
    <li><a href="#">높은 가격순</a></li>
    <li><a href="#">낮은 가격순</a></li>
</ul>




<div class="container stay-list">
    <ul class="sl-wrap">
    <c:choose>
        <c:when test="${!empty stayList }">
        <c:forEach items="${stayList}" var="list">
        <li>
            <a href="<%=request.getContextPath()%>/stayView.do?stay_no=${list.stay_no}">
                <div class="slw-name">${list.stay_name}<span>민박</span></div>
                <div class="clear"></div>
                <div class="slw-info">
                    <p class="address">${list.stay_location}</p>
                    <p class="people">기준 ${list.room_people_min}명 (최대 ${list.room_people_max}명)</p>
                    <p class="price">
                        <fmt:setLocale value="ko_kr" /><fmt:formatNumber value="${list.room_price_min}" type="currency" /> ~ 
                        <c:if test="${list.room_price_min != list.room_price_max}"><fmt:setLocale value="ko_kr" /><fmt:formatNumber value="${list.room_price_max}" type="currency" /></c:if>
                    </p>
                    <p class="reserv">예약하기</p>
                </div>
                <c:choose>
                    <c:when test="${!empty list.stay_file1}"><div class="slw-photo" style="background-image: url('<%=request.getContextPath()%>${list.stay_file1}');"></div></c:when>
                    <c:when test="${!empty list.stay_file2}"><div class="slw-photo" style="background-image: url('<%=request.getContextPath()%>${list.stay_file2}');"></div></c:when>
                    <c:when test="${!empty list.stay_file3}"><div class="slw-photo" style="background-image: url('<%=request.getContextPath()%>${list.stay_file3}');"></div></c:when>
                    <c:when test="${!empty list.stay_file4}"><div class="slw-photo" style="background-image: url('<%=request.getContextPath()%>${list.stay_file4}');"></div></c:when>
                    <c:when test="${!empty list.stay_file5}"><div class="slw-photo" style="background-image: url('<%=request.getContextPath()%>${list.stay_file5}');"></div></c:when>
                </c:choose>
            </a>
        </li>
        </c:forEach>
        </c:when>

        <c:otherwise>
        <li class="nodata">등록된 숙소가 없습니다.</li>
        </c:otherwise>
    </c:choose>
    </ul>
</div>



${map.pagingWrite}




<jsp:include page="../layout/layout_footer.jsp" />