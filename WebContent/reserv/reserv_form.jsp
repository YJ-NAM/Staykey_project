<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% long time = System.currentTimeMillis(); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% pageContext.setAttribute("newLine", "\n"); %>

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


        <table class="rfw-list">
            <colgroup>
                <col width="32%" />
                <col />
            </colgroup>

            <tbody>
                <tr>
                    <th>예약 스테이</th>
                    <td>${room.room_name} / ${room.room_type}</td>
                </tr>

                <tr>
                    <th>예약일</th>
                    <td class="day">${start_date} ~ ${end_date}<em>${daycount}박 ${daycount+1}일</em></td>
                </tr>

                <tr>
                    <th>이름</th>
                    <td><input type="text" name="reserv_memname" value="${login_name}" class="input-width" readonly="readonly" /></td>
                </tr>

                <tr>
                    <th>연락처</th>
                    <td><input type="text" name="reserv_memphone" value="${login_phone}" class="input-width" readonly="readonly" /></td>
                </tr>

                <tr>
                    <th>이메일</th>
                    <td><input type="text" name="reserv_mememail" value="${login_email}" class="input-width" readonly="readonly" /></td>
                </tr>

                <tr>
                    <th>인원 (최대 ${room.room_people_max}명)</th>
                    <td class="people">
                        <div class="select">
                            <span>성인</span>
                            <select name="reserv_people_adult">
                                <c:forEach begin="1" end="${room.room_people_max}" var="i">
                                <option value="${i}">${i}명</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="select">
                            <span>아동</span>
                            <select name="reserv_people_kid">
                                <option value="0">0명</option>
                                <c:forEach begin="1" end="${room.room_people_max}" var="j">
                                <option value="${j}">${j}명</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="select">
                            <span>영아</span>
                            <select name="reserv_people_baby">
                                <option value="0">0명</option>
                                <c:forEach begin="1" end="${room.room_people_max}" var="k">
                                <option value="${k}">${k}명</option>
                                </c:forEach>
                            </select>
                        </div>
                        <span class="people-txt">아동 : 24개월 ~ 12세<br />영아 : 24개월 미만</span>
                    </td>
                </tr>

                <c:if test="${!empty stay.stay_option1_name or !empty stay.stay_option2_name or !empty stay.stay_option3_name}">
                <tr>
                    <th>추가 옵션 선택</th>
                    <td class="option">
                        <c:if test="${!empty stay.stay_option1_name}">
                            <c:if test="${!empty stay.stay_option1_photo}">
                            <div class="option-img">
                                <div class="img" style="background-image: url('<%=request.getContextPath()%>${stay.stay_option1_photo}');"></div>
                            </div>
                            </c:if>
                            <div class="option-select">
                                <div class="tit">${stay.stay_option1_name}<span class="price"><fmt:setLocale value="ko_kr" /><fmt:formatNumber value="${stay.stay_option1_price}" type="currency" /></span></div>
                                <div class="txt">${stay.stay_option1_desc.replace(newLine, '<br />')}</div>
                                <div class="sel-option">
                                    <label><input type="radio" name="stay_option1_select" value="Y"> 선택</label>
                                    <label><input type="radio" name="stay_option1_select" value="N" checked="checked"> 선택안함</label>
                                </div>
                            </div>
                        </c:if>

                        <c:if test="${!empty stay.stay_option2_name}">
                            <c:if test="${!empty stay.stay_option2_photo}">
                            <div class="option-img">
                                <div class="img" style="background-image: url('<%=request.getContextPath()%>${stay.stay_option2_photo}');"></div>
                            </div>
                            </c:if>
                            <div class="option-select">
                                <div class="tit">${stay.stay_option2_name}<span class="price"><fmt:setLocale value="ko_kr" /><fmt:formatNumber value="${stay.stay_option2_price}" type="currency" /></span></div>
                                <div class="txt">${stay.stay_option2_desc.replace(newLine, '<br />')}</div>
                                <div class="sel-option">
                                    <label><input type="radio" name="stay_option2_select" value="Y"> 선택</label>
                                    <label><input type="radio" name="stay_option2_select" value="N" checked="checked"> 선택안함</label>
                                </div>
                            </div>
                        </c:if>

                        <c:if test="${!empty stay.stay_option3_name}">
                            <c:if test="${!empty stay.stay_option3_photo}">
                            <div class="option-img">
                                <div class="img" style="background-image: url('<%=request.getContextPath()%>${stay.stay_option3_photo}');"></div>
                            </div>
                            </c:if>
                            <div class="option-select">
                                <div class="tit">${stay.stay_option3_name}<span class="price"><fmt:setLocale value="ko_kr" /><fmt:formatNumber value="${stay.stay_option3_price}" type="currency" /></span></div>
                                <div class="txt">${stay.stay_option3_desc.replace(newLine, '<br />')}</div>
                                <div class="sel-option">
                                    <label><input type="radio" name="stay_option3_select" value="Y"> 선택</label>
                                    <label><input type="radio" name="stay_option3_select" value="N" checked="checked"> 선택안함</label>
                                </div>
                            </div>
                        </c:if>
                    </td>
                </tr>
                </c:if>

                <tr>
                    <th>요청사항</th>
                    <td>
                        <textarea name="reserv_request" cols="80" rows="5"></textarea>
                    </td>
                </tr>

                <tr>
                    <th>예상 결제금액</th>
                    <td class="total-price">
                        <dl>
                            <dt>객실 요금<span class="stay">${room.room_name} / ${room.room_type} &nbsp; <fmt:setLocale value="ko_kr" /><fmt:formatNumber value="${room.room_price}" type="currency" /> * ${daycount}박</span></dt>
                            <dd>₩840,000</dd>
                            <dt>
                                <span class="plus-option-tit">추가 옵션</span>
                                <ul class="plus-option-wrap">
                                    <li class="plus-option">한우 BBQ SET (2인분 1세트)</li>
                                    <li class="plus-option">조식(추가인원 조식신청시)</li>
                                </ul>
                            </dt>
                            <dd>₩179,300</dd>
                            <dt class="total"></dt>
                            <dd class="total">₩812,000</dd>
                        </dl>
                    </td>
                </tr>

                <tr>
                    <th>결제방법 선택</th>
                    <td class="payment">
                        
                    </td>
                </tr>
            </tbody>
        </table>



        <div class="rfw-button"><button type="submit">예약하기</button></div>
        </form>
    </div>
    <!-- 예약 폼 //END -->

</div>




<jsp:include page="../layout/layout_footer.jsp" />