<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../layout/layout_header_popup.jsp" />

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="room" value="${ roomView }" />
<c:set var="stay" value="${ stayView }" />

<c:if test="${empty roomView}"><script>alert('잘못된 Room 번호입니다.'); window.close();</script></c:if>
<style type="text/css">body { padding: 0 30px !important; }</style>
<div class="d-flex justify-content flex-wrap flex-md-nowrap align-items-center pt-4 pb-2 mb-4 border-bottom">
    <h2>Room 상세 정보</h2>
    <small><strong>${stay.stay_name}</strong>의 <strong>${room.room_name}</strong> room 정보를 확인 할 수 있습니다.</small>
</div>


${ msg }
<c:remove var="msg" />


<div class="view-form">
    <!-- 내용 //START -->
    <div class="row vf-body">
        <div class="col-lg mb-4">
            <div class="card">
                <div class="card-body p-4">

                    <div class="room-view">
                        <div class="rv-info">
                            <div class="rvi-left">
                                <div class="tit">ROOM INFORMATION</div>
                                <div class="name">${room.room_name}</div>
                                <div class="price"><fmt:setLocale value="ko_kr" /><fmt:formatNumber value="${room.room_price}" type="currency" />~</div>
                                <div class="txt">${room.room_desc}</div>
                                <div class="etc">
                                    <div class="tag">
                                        <c:forTokens items="${room.room_tag}" delims="," var="tag"><span>#${tag}</span></c:forTokens>
                                    </div>
                                    <div class="option">
                                        <p>체크인 ${room.room_checkin} / 체크아웃 ${room.room_checkout}</p>
                                        <p>기준 인원 <fmt:formatNumber value="${room.room_people_min}" />명 (최대 인원 <fmt:formatNumber value="${room.room_people_max}" />명)</p>
                                        <p>${room.room_type}</p>
                                        <p>객실면적 ${room.room_size}㎡</p>
                                        <p>${room.room_bed}</p>
                                    </div>
                                </div>
                            </div>


                            <div class="rvi-right" id="room-view-photo">
                                <c:if test="${!empty room.room_photo1 or !empty room.room_photo2 or !empty room.room_photo3 or !empty room.room_photo4 or !empty room.room_photo5}">
                                <div class="swiper-button-prev"><i class="fa fa-chevron-left"></i></div>
                                <div class="swiper-button-next"><i class="fa fa-chevron-right"></i></div>
                                <ul class="swiper-wrapper">
                                    <c:if test="${!empty room.room_photo1}"><li class="swiper-slide"><div class="img" style="background-image: url('<%=request.getContextPath()%>${room.room_photo1}');"></div></li></c:if>
                                    <c:if test="${!empty room.room_photo2}"><li class="swiper-slide"><div class="img" style="background-image: url('<%=request.getContextPath()%>${room.room_photo2}');"></div></li></c:if>
                                    <c:if test="${!empty room.room_photo3}"><li class="swiper-slide"><div class="img" style="background-image: url('<%=request.getContextPath()%>${room.room_photo3}');"></div></li></c:if>
                                    <c:if test="${!empty room.room_photo4}"><li class="swiper-slide"><div class="img" style="background-image: url('<%=request.getContextPath()%>${room.room_photo4}');"></div></li></c:if>
                                    <c:if test="${!empty room.room_photo5}"><li class="swiper-slide"><div class="img" style="background-image: url('<%=request.getContextPath()%>${room.room_photo5}');"></div></li></c:if>
                                </ul>
                                <script type="text/javascript">
                                $(document).ready(function(){
                                    var visualSwiper = new Swiper("#room-view-photo", {
                                        effect: "slide",
                                        slidesPerView: 1,
                                        spaceBetween: 0,
                                        speed: 500,
                                        loop: true,
                                        touchEnabled: false,
                                        autoplay: {
                                            delay: 3000,
                                            disableOnInteraction: false,
                                        },
                                        navigation: {
                                            nextEl: '#room-view-photo .swiper-button-next',
                                            prevEl: '#room-view-photo .swiper-button-prev',
                                        }
                                    });
                                });
                                </script>
                                </c:if>
                            </div>

                        </div>


                        <div class="rv-service">
                            <c:if test="${!empty room.room_features}">
                            <div class="row">
                                <div class="rvs-tit">FEATURES</div>
                                <ul class="rvs-list">
                                    <c:forTokens items="${room.room_features}" delims="/" var="features"><li>${features}</li></c:forTokens>
                                </ul>
                            </div>
                            </c:if>

                            <c:if test="${!empty room.room_amenities}">
                            <div class="row">
                                <div class="rvs-tit">AMENITIES</div>
                                <ul class="rvs-list">
                                    <c:forTokens items="${room.room_amenities}" delims="/" var="amenities"><li>${amenities}</li></c:forTokens>
                                </ul>
                            </div>
                            </c:if>

                            <c:if test="${!empty room.room_service}">
                            <div class="row">
                                <div class="rvs-tit">ADD-ON SERVICES</div>
                                <ul class="rvs-list">
                                    <c:forTokens items="${room.room_service}" delims="/" var="service"><li>${service}</li></c:forTokens>
                                </ul>
                            </div>
                            </c:if>
                        </div>


                        <div class="rv-other">
                            <div class="rvo-title">OTHER ROOMS</div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../layout/layout_footer.jsp" />