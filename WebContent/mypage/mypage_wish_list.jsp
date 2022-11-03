<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../layout/layout_header.jsp" />
<jsp:include page="../mypage/mypage_header.jsp" />
<script type="text/javascript">$("#mymenu-wish").addClass("now");</script>



<div class="wish-list">

관심 스테이 목록

</div>

<br><br>

<!-- 이름 영역 -->
<div class="name"><span class="ellipsis" style="padding-bottom: 0px;"> ${숙소이름} </span></div>
<br>

<!-- 위치, 인원, 가격 영역 -->
<div><p class="option">${숙소 위치}<br>${숙소 최소 인원} / ${숙소 최대 인원}<br>${숙소 가격}</p></div>
<br><br>

<!-- 예약하기 버튼 -->
<div class="btns"><button type="button" class="btn_bk"><a href="https://booking.stayfolio.com/places/on-a">예약하기</a></button></div>

<!-- 이미지 영역 -->
<div class="likestay_img" style="padding-top: 0px;">




<jsp:include page="../mypage/mypage_footer.jsp" />
<jsp:include page="../layout/layout_footer.jsp" />