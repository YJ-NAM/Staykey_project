<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% long time = System.currentTimeMillis(); %>
<jsp:include page="../layout/layout_header.jsp" />
<script type="text/javascript">$("#nav-event").addClass("now");</script>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/asset/css/event.css?<%=time%>" />
<script language="javascript" src="<%=request.getContextPath()%>/asset/js/event.js?<%=time%>"></script>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="event" value="${eList}"/>


<div class="container page-title">
    <h2>PROMOTION</h2>
    <h4>스테이:키가 제안하는 여행 레시피</h4>
</div>



<div class="container event-list">

    <!-- 프로모션 //START -->
    <c:if test="${!empty event }">
    <div class="el-promotion">
        <h4 class="elp-title">PROMOTION</h4>

        <div class="elp-wrap">
            <ul class="swiper-wrapper">
                <c:forEach items="${event}" var="list">
                <li class="swiper-slide">
                    <a href="<%=request.getContextPath()%>/eventView.do?bbs_no=${list.bbs_no}">
                        <div class="e_img" style="background-image:url('<%=request.getContextPath()%>${list.bbs_file1}');"><c:if test="${list.bbs_showstart != 'N'}"><span>${list.bbs_showstart} days<br />left!</span></c:if></div>
                        <div class="e_info">
                            <p class="txt">PROMOTION</p>
                            <p class="tit">${list.bbs_title}</p>
                            <p class="more">read more</p>
                        </div>
                    </a>
                </li>
                </c:forEach>
            </ul>
        </div>
    </div>

    <script type="text/javascript">
    $(document).ready(function(){
        var visualSwiper = new Swiper(".event-list .el-promotion .elp-wrap", {
            effect: "slide",
            slidesPerView: 2,
            spaceBetween: 0,
            speed: 500,
            loop: true,
            touchEnabled: false,
            autoplay: {
                delay: 3000,
                disableOnInteraction: false,
            }
        });
    });
    </script>
    </c:if>
    <!-- 프로모션 //END -->





    <!-- 이벤트 //START -->
    <div class="el-event">
        <h4 class="elp-title">EVENT</h4>


    </div>
    <!-- 이벤트 //END -->
</div>




<jsp:include page="../layout/layout_footer.jsp" />