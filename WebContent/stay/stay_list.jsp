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
            <a href="<%=request.getContextPath()%>/stayView.do?stay_no=">
                <div class="slw-name">시나몬<span>민박</span></div>
                <div class="clear"></div>
                <div class="slw-info">
                    <p class="address">강원/강릉시</p>
                    <p class="people">기준 2명 (최대 2명)</p>
                    <p class="price">₩240,000 ~ ₩260,000</p>
                    <p class="reserv">예약하기</p>
                </div>
                <div class="slw-photo" style="background-image: url('https://images.stayfolio.com/system/pictures/images/000/120/916/small/9396befbf669066455d06b31a2a7f4d5ccbd1e6b.jpg');"></div>
            </a>
        </li>


        <li>
            <a href="<%=request.getContextPath()%>/stayView.do?stay_no=">
                <div class="slw-name">제주스테이 비우다<span>민박</span></div>
                <div class="clear"></div>
                <div class="slw-info">
                    <p class="address">제주/서귀포시</p>
                    <p class="people">기준 2명 (최대 2명)</p>
                    <p class="price">₩220,000 ~ ₩360,000</p>
                    <p class="reserv">예약하기</p>
                </div>
                <div class="slw-photo" style="background-image: url('https://images.stayfolio.com/system/pictures/images/000/062/014/small/6d52add1f0d866a773b19c3977a337e73f9ce1fe.jpg');"></div>
            </a>
        </li>


        <li>
            <a href="<%=request.getContextPath()%>/stayView.do?stay_no=">
                <div class="slw-name">월화여인숙<span>렌탈하우스</span></div>
                <div class="clear"></div>
                <div class="slw-info">
                    <p class="address">강원/양양군</p>
                    <p class="people">기준 4명 (최대 5명)</p>
                    <p class="price">₩350,000 ~ ₩450,000</p>
                    <p class="reserv">예약하기</p>
                </div>
                <div class="slw-photo" style="background-image: url('https://images.stayfolio.com/system/pictures/images/000/055/128/small/f3399c0d6bf9432f07993e97ed227b96db29e954.jpg');"></div>
            </a>
        </li>


        <li>
            <a href="<%=request.getContextPath()%>/stayView.do?stay_no=">
                <div class="slw-name">흐르는결<span>한옥</span></div>
                <div class="clear"></div>
                <div class="slw-info">
                    <p class="address">경상/경주시</p>
                    <p class="people">기준 2명 (최대 4명)</p>
                    <p class="price">₩380,000 ~ ₩550,000</p>
                    <p class="reserv">예약하기</p>
                </div>
                <div class="slw-photo" style="background-image: url('https://images.stayfolio.com/system/pictures/images/000/088/860/small/bf6c4c31f255ccf044e96d991d04da25c346b9b7.jpg');"></div>
            </a>
        </li>


        <li>
            <a href="<%=request.getContextPath()%>/stayView.do?stay_no=">
                <div class="slw-name">이밤491<span>민박</span></div>
                <div class="clear"></div>
                <div class="slw-info">
                    <p class="address">강원/강릉시</p>
                    <p class="people">기준 4명 (최대 4명)</p>
                    <p class="price">₩400,000 ~ ₩420,000</p>
                    <p class="reserv">예약하기</p>
                </div>
                <div class="slw-photo" style="background-image: url('https://images.stayfolio.com/system/pictures/images/000/053/541/small/e7fb92713487efd0a9d0dedeb5987e451827b719.JPG');"></div>
            </a>
        </li>


        <li>
            <a href="<%=request.getContextPath()%>/stayView.do?stay_no=">
                <div class="slw-name">어오내스테이<span>펜션</span></div>
                <div class="clear"></div>
                <div class="slw-info">
                    <p class="address">제주/제주</p>
                    <p class="people">기준 4명 (최대 5명)</p>
                    <p class="price">₩290,000 ~ ₩350,000</p>
                    <p class="reserv">예약하기</p>
                </div>
                <div class="slw-photo" style="background-image: url('https://images.stayfolio.com/system/pictures/images/000/073/598/small/017d007bc326731c9ba402f4d55c63adda257267.jpg');"></div>
            </a>
        </li>
    </ul>
</div>



<div class="page-paging">
    <span class="nolink"><i class="fa fa-angle-double-left"></i></span>
    <span><a href="#"><i class="fa fa-angle-left"></i></a></span>
    <ol>
        <li><a href="#">1</a></li>
        <li><a href="#">2</a></li>
        <li class="now">3</li>
        <li><a href="#">4</a></li>
        <li><a href="#">5</a></li>
    </ol>
    <span><a href="#"><i class="fa fa-angle-right"></i></a></span>
    <span class="nolink"><i class="fa fa-angle-double-right"></i></span>
</div>




<jsp:include page="../layout/layout_footer.jsp" />