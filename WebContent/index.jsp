<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="layout/layout_header.jsp" />


<!-------- 메인 페이지 시작 --------->
<div id="container" class="container">
   <div class="container-main">
    <!-------- 메인 페이지 비주얼 창 --------->
        <div id="container-main-swiper" class="container-main-swiper">
            <!----메인 페이지 아이콘 방향키 ----->
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
            <!------메인 페이지 이미지 창------->
            <ul class= "swiper-wrapper">
                <li class="swiper-slide" ><a href="#"><img class="img" src="asset/images/leegunhee.jpeg">
                    <div id="stay-info">
                        <p class="logo"></p>
                        <p class="text">어느 수집가의 초대</p>
                        <p class="event"> MMCA 이건희컬렉션 특별전: 한국미술명작 </p>
                        <p class="more">Read more</p></div>
                </a></li>
                <li class="swiper-slide"><a href="#"><img class="img" src="asset/images/whanki.jpeg">
                    <div id="stay-info">
                    <p class="logo"></p>
                    <p class="text">우리끼리의 얘기</p>
                    <p class="event">환기미술관 개관 30주년 기념전</p>
                    <p class="more">Read more</p></div>
                </a></li>
                <li class="swiper-slide"><a href="#"><img class="" src="">
                    <div id="stay-info">
                    <p class="logo"></p>
                    <p class="text"></p>
                    <p class="event">전어회</p>
                    <p class="more">Read more</p></div>
                </a></li>
                <li class="swiper-slide"><a href="#"><img class="" src="">
                    <div id="stay-info">
                    <p class="logo"></p>
                    <p class="text"></p>
                    <p class="event">연어회</p>
                    <p class="more">Read more</p></div>
                </a></li></ul>
            <div class="swiper-pagination">
                <span></span>
                <span></span></div>
            <div class="bg_paper"></div>
        </div>
    <!-------- 메인 페이지 프로모션 창 --------->
   <div class="container-main-new">
    <!-------- 신규 창 타이틀 --------->
        <div class="sec-title"><strong>Stay:Key로 여는 새로운 경험</strong></div>
     <!-------- 신규 창 목록 --------->
     <div class="stay-list">
     <!-------- 신규 창 아이콘 --------->
        <div class="swiper-button-prev"></div>
        <div class="swiper-button-next"></div>
     <!-------- 신규 창 슬라이드 --------->
            <div class="swiper-wrapper">
                <div class="swiper-slide stay-box">
                    <button type="button" id="btn-like"></button>
                    <a href="#"><img src="asset/images/gilsangsa.png"></img>
                    <div class="name">길상사</div>
                    <div class="others"><span>서울 / 성북구</span><span>당일체험&#8361;10,000원</span></div>
                    <div class="btn_more">Read more</div></a></div>
                <div class="swiper-slide stay-box">
                    <button type="button" id="btn-like"></button>
                    <a href="#"><img src="asset/images/bongeunsa.png"></img>
                    <div class="name">봉은사</div>
                    <div class="others"><span>서울 / 강남구</span><span>1일 휴식형&#8361;70,000원</span></div>
                    <div class="btn_more">Read more</div></a></div>
                <div class="swiper-slide stay-box">
                    <button type="button" id="btn-like"></button>
                    <a href="#"><img src=""></img>
                    <div class="name"></div>
                    <div class="others"><span></span><span>&#8361;</span></div>
                    <div class="btn_more">Read more</div></a></div>
                <div class="swiper-slide stay-box">
                    <button type="button" id="btn-like"></button>
                    <a href="#"><img src=""></img>
                    <div class="name"></div>
                    <div class="others"><span></span><span>&#8361;</span></div>
                    <div class="btn_more">Read more</div></a></div>
                <div class="swiper-slide stay-box">
                    <button type="button" id="btn-like"></button>
                    <a href="#"><img src=""></img>
                    <div class="name"></div>
                    <div class="others"><span></span><span>&#8361;</span></div>
                    <div class="btn_more">Read more</div></a></div>
            </div>
        </div>
    </div>
    <!-------- 메인 페이지 배너 창 --------->
   <div class="container-main-banner">
        <a href="#"><div class="banner-wrap"><span>마음의 평안을 여는</span><br><br><span>KEY:S PEACE</span></div></a>
     </div>
   
    <!-------- 메인 페이지 프로모션 창 --------->
    <div class="container-main-promo">
    <!-------- 프로모션 창 타이틀 --------->
        <div class="sec-title"><strong>PROMOTION</strong></div>
    <!-------- 프로모션 창 목록 --------->
        <div class= "swiper-container" id="promotion-container">
         <section class="promo-stay-list">
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
             <div class="swiper-pagination">
             <span></span>
             <span></span></div>
            <ul class="promo-swiper-wrapper">
                <li class="swiper-slide">
                    <a><div class="img"></div>
                    <div class="e_date"></div>
                    <div class="animate"><div class="tit"><p class="text">" "</p><p class="small">" "</p></div>
                    <div class="info"></div>
                    </div></a></li>
                <li class="swiper-slide">
                    <a><div class="img"></div>
                    <div class="e_date"></div>
                    <div class="animate"><div class="tit"><p class="text">" "</p><p class="small">" "</p></div>
                    <div class="info"></div>
                    </div></a></li>
                <li class="swiper-slide">
                    <a><div class="img"></div>
                    <div class="e_date"></div>
                    <div class="animate"><div class="tit"><p class="text">" "</p><p class="small">" "</p></div>
                    <div class="info"></div>
                    </div></a></li>
                <li class="swiper-slide">
                    <a><div class="img"></div>
                    <div class="e_date"></div>
                    <div class="animate"><div class="tit"><p class="text">" "</p><p class="small">" "</p></div>
                    <div class="info"></div></div></a></li></ul>
            <br>
            <br>
            <br>
        </section></div>
    </div>
    <!-------- 메인 페이지 이벤트 창 --------->
    <div class="container-main-event">
        <div class="sec-title">EVENT</div>
        <div class="swiper-container" id="event-container">
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
            <div class="swiper-pagination"></div>
            <div class="swiper-wrapper">
                <div class="swiper-slide"><a href="#">
                    <div class="image"></div>
                    <div class="e_date"></div>
                    <div class="name"></div>
                    <div class="other"><span></span></div>
                    <div class="text"></div>
                    <div class="btn_more">자세히</div></a></div>

                <div class="swiper-slide"><a href="#">
                    <div class="image"></div>
                    <div class="e_date"></div>
                    <div class="name"></div>
                    <div class="other"><span></span></div>
                    <div class="text"></div>
                    <div class="btn_more">자세히</div></a></div>

                <div class="swiper-slide"><a href="#">
                    <div class="image"></div>
                    <div class="e_date"></div>
                    <div class="name"></div>
                    <div class="other"><span></span></div>
                    <div class="text"></div>
                    <div class="btn_more">자세히</div></a></div>

                <div class="swiper-slide"><a href="#">
                    <div class="image"></div>
                    <div class="e_date"></div>
                    <div class="name"></div>
                    <div class="other"><span></span></div>
                    <div class="text"></div>
                    <div class="btn_more">자세히</div></a></div>

                <div class="swiper-slide"><a href="#">
                    <div class="image"></div>
                    <div class="e_date"></div>
                    <div class="name"></div>
                    <div class="other"><span></span></div>
                    <div class="text"></div>
                    <div class="btn_more">자세히</div></a></div>
            </div>
        </div>
    </div>
    <!-------- 메인 페이지 매거진 창 --------->
   <div class="container-main-magazine">
    <div class="main-magazine-container" id="main-magazine-banner">
        <div class="swiper-button-prev"></div>
        <div class="swiper-button-next"></div>
            <ul class="swiper-wrapper">
                <li class="swiper-slide slider-box"><a href="#">
                    <div class="bg-img"></div>
                    <div class="stay-info">
                        <p class="logo"></p>
                        <p class="text"></p>
                        <p class="magazine">MAGAZINE</p>
                        <p class="more">Read more</p></div></a></li>
                <li class="swiper-slide slider-box"><a href="#">
                    <div class="bg-img"></div>
                    <div class="stay-info">
                        <p class="logo"></p>
                        <p class="text"></p>
                        <p class="magazine">MAGAZINE</p>
                        <p class="more">Read more</p></div></a></li>
                <li class="swiper-slide slider-box"><a href="#">
                    <div class="bg-img"></div>
                    <div class="stay-info">
                        <p class="logo"></p>
                        <p class="text"></p>
                        <p class="magazine">MAGAZINE</p>
                        <p class="more">Read more</p></div></a></li>
                <li class="swiper-slide slider-box"><a href="#">
                    <div class="bg-img"></div>
                    <div class="stay-info">
                        <p class="logo"></p>
                        <p class="text"></p>
                        <p class="magazine">MAGAZINE</p>
                        <p class="more">Read more</p></div></a></li>
                <li class="swiper-slide slider-box"><a href="#">
                    <div class="bg-img"></div>
                    <div class="stay-info">
                        <p class="logo"></p>
                        <p class="text"></p>
                        <p class="magazine">MAGAZINE</p>
                        <p class="more">Read more</p></div></a></li></ul>
        <div class="swiper-pagination">
            <span class="magazine-pagination-current"></span>
            <span class="magazine-pagination-total"></span></div>
        <div class="bg-paper"></div>
     </div>
    </div> 
    <!-------- 메인 페이지 종합 추천 창! --------->
   <div class="container-main-travel">
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