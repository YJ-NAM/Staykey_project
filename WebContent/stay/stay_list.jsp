<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% long time = System.currentTimeMillis(); %>
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
        <li>
            
        </li>


    </ul>
</div>



<jsp:include page="../layout/layout_footer.jsp" />