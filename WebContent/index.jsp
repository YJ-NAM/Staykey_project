<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="layout/layout_header.jsp" />


<!-------- 메인 페이지 시작 --------->
<div id="main-contents" class="main-contents">
   <div class="container-wide main-contents-page">
    <!-------- 메인 페이지 비주얼 창 --------->
        <div id="swiper-container main-visual parallax-bg" data-swiper-parallax="-23%" class="main-visual">
            <!------메인 페이지 이미지 창------->
            <ul class= "swiper-wrapper">
            <li class="swiper-slide parallax-bg-1 slider-box" ><a href="#"><img src="https://img.stibee.com/38745_1626152387.png"/>                    
                    <div class="stay-info">
                        <p class="logo"></p>
                        <p class="title" data-swiper-parallax="-300">우리끼리의 얘기</p>
                        <p class="event subtitle" data-swiper-parallax="-200">환기미술관 개관 30주년 기념전</p>
                        <p class="more" data-swiper-parallax="-100">Read more</p></div>
                </a></li>
                <li class="swiper-slide parallax-bg-2 slider-box"><a href="#"><div class="img main-2"></div>
                    <div id="stay-info">
                    <p class="logo"></p>
                    <p class="title">민어회</p>
                    <p class="event subtitle">맛잇다</p>
                    <p class="more">Read more</p></div>
                </a></li>
                <li class="swiper-slide parallax-bg-3 slider-box"><a href="#"><div class="img main-3"></div>
                    <div id="stay-info">
                    <p class="logo"></p>
                    <p class="title"></p>
                    <p class="event subtitle">전어회</p>
                    <p class="more">Read more</p></div>
                </a></li>
                <li class="swiper-slide parallax-bg-4 slider-box"><a href="#"><div class="img main-4"></div>
                    <div id="stay-info">
                    <p class="logo"></p>
                    <p class="title"></p>
                    <p class="event subtitle">연어회</p>
                    <p class="more">Read more</p></div>
                </a></li></ul>
            <!----메인 페이지 아이콘 방향키 ----->
            <div class="swiper-button-prev"><i class=icon-arrow-left></i></div>
            <div class="swiper-button-next"></div>
            <div class="swiper-pagination">
                <span>0</span>/
                <span>10</span></div>
            <div class="bg_paper"></div>
        </div>
    <!-------- 메인 페이지 프로모션 창 --------->
   <div class="container main-new">
    <!-------- 신규 창 타이틀 --------->
        <div class="sec-title"><strong>Stay:Key로 여는 새로운 경험</strong></div>
     <!-------- 신규 창 목록 --------->
     <div class="main-new stay-list" id="new-container" >
     <!-------- 신규 창 아이콘 --------->
        <div class="swiper-button-prev"></div>
        <div class="swiper-button-next"></div>
     <!-------- 신규 창 슬라이드 --------->
            <div class="swiper-wrapper">
                <div class="swiper-slide stay-box" >
                    <button type="button" id="btn_like"></button>
                    <a href="#"><img src="asset/images/gilsangsa.png"></img>
                    <div class="name title">길상사</div>
                    <div class="others subtitle"><span>서울 / 성북구</span><span>당일체험&#8361;10,000원</span></div>
                    <div class="btn_more">Read more</div></a></div>
                <div class="swiper-slide stay-box">
                    <button type="button" id="btn_like"></button>
                    <a href="#"><img src="asset/images/bongeunsa.png"></img>
                    <div class="name title">봉은사</div>
                    <div class="others subtitle"><span>서울 / 강남구</span><span>1일 휴식형&#8361;70,000원</span></div>
                    <div class="btn_more">Read more</div></a></div>
                <div class="swiper-slide stay-box">
                    <button type="button" id="btn_like"></button>
                    <a href="#"><img src=""></img>
                    <div class="name title"></div>
                    <div class="others subtitle"><span></span><span>&#8361;</span></div>
                    <div class="btn_more">Read more</div></a></div>
                <div class="swiper-slide stay-box">
                    <button type="button" id="btn_like"></button>
                    <a href="#"><img src=""></img>
                    <div class="name title"></div>
                    <div class="others subtitle"><span></span><span>&#8361;</span></div>
                    <div class="btn_more">Read more</div></a></div>
                <div class="swiper-slide parallax-bg-5 stay-box">
                    <button type="button" id="btn_like"></button>
                    <a href="#"><img src=""></img>
                    <div class="name title"></div>
                    <div class="others subtitle"><span></span><span>&#8361;</span></div>
                    <div class="btn_more">Read more</div></a></div>
            </div>
        </div>
    </div>
    <!-------- 메인 페이지 배너 창 --------->
   <div class="container-main-banner">
        <a href="#"><div class="banner-wrap"><span>마음의 평안을 여는</span><span style="font-size: 17px;">Stay</span></div></a>
     </div>
   
        <!-------- 메인 페이지 프로모션 창 --------->
    <div class="container-full main-promo">
        <div class="container">
        <!-------- 프로모션 창 타이틀 --------->
            <div class="sec-title"><strong>PROMOTION</strong></div>
        <!-------- 프로모션 창 목록 --------->
            <div class= "swiper-container" id="promo-swiper">
            <section class="promo-section">
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
                <div class="swiper-pagination">
                <span></span>
                <span></span></div>
                <ul class="swiper-wrapper">
                    <li class="swiper-slide parallax-bg-1" >
                        <a><div class="img"></div>
                        <div class="e_date"></div>
                        <div class="animate"><div class="tit"><p class="text">내게 사랑은 너무 써</p><p class="small">아직 전 어리거든요</p></div>
                        <div class="info"></div>
                        </div></a></li>
                    <li class="swiper-slide parallax-bg-2" >
                        <a><div class="img"></div>
                        <div class="e_date"></div>
                        <div class="animate"><div class="tit"><p class="text">" "</p><p class="small">" "</p></div>
                        <div class="info"></div>
                        </div></a></li>
                    <li class="swiper-slide parallax-bg-3" >
                        <a><div class="img"></div>
                        <div class="e_date"></div>
                        <div class="animate"><div class="tit"><p class="text">" "</p><p class="small">" "</p></div>
                        <div class="info"></div>
                        </div></a></li>
                    <li class="swiper-slide parallax-bg-4" >
                        <a><div class="img"></div>
                        <div class="e_date"></div>
                        <div class="animate"><div class="tit"><p class="text">" "</p><p class="small">" "</p></div>
                        <div class="info"></div></div></a></li></ul>
                <br>
                <br>
                <br>
            </section></div>
        </div>
    </div>
    <!-------- 메인 페이지 이벤트 창 --------->
    <div class="container main-event">
        <div class="sec-title">Event</div>
        <div class="swiper-container stay-list" id="event-container">
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
            <div class="swiper-pagination"></div>
            <div class="swiper-wrapper">
                <div class="swiper-slide stay-box"><a href="#">
                    <div class="image"></div>
                    <div class="e_date"></div>
                    <div class="name"></div>
                    <div class="other"><span></span></div>
                    <div class="text"></div>
                    <div class="btn_more">자세히</div></a></div>

                <div class="swiper-slide stay-box"><a href="#">
                    <div class="image"></div>
                    <div class="e_date"></div>
                    <div class="name"></div>
                    <div class="other"><span></span></div>
                    <div class="text"></div>
                    <div class="btn_more">자세히</div></a></div>

                <div class="swiper-slide stay-box"><a href="#">
                    <div class="image"></div>
                    <div class="e_date"></div>
                    <div class="name"></div>
                    <div class="other"><span></span></div>
                    <div class="text"></div>
                    <div class="more">자세히</div></a></div>

                <div class="swiper-slide stay-box"><a href="#">
                    <div class="image"></div>
                    <div class="e_date"></div>
                    <div class="name"></div>
                    <div class="other"><span></span></div>
                    <div class="text"></div>
                    <div class="more">자세히</div></a></div>

                <div class="swiper-slide stay-box"><a href="#">
                    <div class="image"></div>
                    <div class="e_date"></div>
                    <div class="name"></div>
                    <div class="other"><span></span></div>
                    <div class="text"></div>
                    <div class="more">자세히</div></a></div>
            </div>
        </div>
    </div>
    <!-------- 메인 페이지 매거진 창 --------->
   <div class="container-wide main-magazine">
    <div class="swiper-container" id="magazine-container">
        <div class="swiper-button-prev"></div>
        <div class="swiper-button-next"></div>
            <ul class="swiper-wrapper">
                <li class="swiper-slide slider-box"><a href="#">
                    <div class="img"></div>
                    <div class="stay-info">
                        <p class="logo"></p>
                        <p class="text"></p>
                        <p class="magazine">Magazine</p>
                        <p class="more">Read more</p></div></a></li>
                <li class="swiper-slide slider-box"><a href="#">
                    <div class="img"></div>
                    <div class="stay-info">
                        <p class="logo"></p>
                        <p class="text"></p>
                        <p class="magazine">Magazine</p>
                        <p class="more">Read more</p></div></a></li>
                <li class="swiper-slide slider-box"><a href="#">
                    <div class="img"></div>
                    <div class="stay-info">
                        <p class="logo"></p>
                        <p class="text"></p>
                        <p class="magazine">Magazine</p>
                        <p class="more">Read more</p></div></a></li>
                <li class="swiper-slide slider-box"><a href="#">
                    <div class="img"></div>
                    <div class="stay-info">
                        <p class="logo"></p>
                        <p class="text"></p>
                        <p class="magazine">Magazine</p>
                        <p class="more">Read more</p></div></a></li>
                <li class="swiper-slide slider-box"><a href="#">
                    <div class="img"></div>
                    <div class="stay-info">
                        <p class="logo"></p>
                        <p class="text"></p>
                        <p class="magazine">Magazine</p>
                        <p class="more">Read more</p></div></a></li></ul>
        <div class="swiper-pagination">
            <span class="magazine-pagination-current"></span>
            <span class="magazine-pagination-total"></span></div>
        <div class="bg-paper"></div>
     </div>
    </div> 
    <!-------- 메인 페이지 종합 추천 창! --------->
   <div class="container main-travel">
    <!-------- 메인 페이지 종합 추천 타이틀! --------->
     <div class="sec-title">TRAVEL</div>
        <ul class="stay-list">
            <li class="stay-box"><a href="#"><img class="img" src="">
                <div class="text">" "</div>
                <div class="other"><span>""</span></div>
                <div class="btn-more">Read more</div></a></li>

            <li class="stay-box"><a href="#"><img class="img" src="">
                <div class="text">" "</div>
                <div class="other"><span>""</span></div>
                <div class="btn-more">Read more</div></a></li>

            <li class="stay-box"><a href="#"><img class="img" src="">
                <div class="text">" "</div>
                <div class="other"><span>""</span></div>
                <div class="btn-more">Read more</div></a></li>

            <li class="stay-box"><a href="#"><img class="img" src="">
                <div class="text">" "</div>
                <div class="other"><span>""</span></div>
                <div class="btn-more">Read more</div></a></li>

            <li class="stay-box"><a href="#"><img class="img" src="">
                <div class="text">" "</div>
                <div class="other"><span>""</span></div>
                <div class="btn-more">Read more</div>
            </a></li></ul>
     </div>
</div>


<jsp:include page="layout/layout_footer.jsp" />