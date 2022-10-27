<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="layout/layout_header.jsp" />


<!-------- 메인 페이지 시작 --------->
<div id="main-contents" class="main-contents">
    <div class="container-wide main-contents-page">


        <!-------- 메인 페이지 비주얼 //START --------->
        <div id="main-visual parallax-bg" data-swiper-parallax="-23%" class="main-visual">
            <ul class="swiper-wrapper">
                <li class="swiper-slide slider-box">
                    <a href="#">
                        <img class="img" src="asset/images/leegunhee.jpeg" />
                        <div class="stay-info">
                            <p class="logo"></p>
                            <p class="title" data-swiper-parallax="-300">어느 수집가의 초대</p>
                            <p class="event subtitle" data-swiper-parallax="-200"> MMCA 이건희컬렉션 특별전: 한국미술명작 </p>
                            <p class="more" data-swiper-parallax="-100">Read more</p>
                        </div>
                    </a>
                </li>

                <li class="swiper-slide slider-box">
                    <a href="#">
                        <img class="img" src="asset/images/whanki.jpeg" />
                        <div id="stay-info">
                            <p class="logo"></p>
                            <p class="title">우리끼리의 얘기</p>
                            <p class="event subtitle">환기미술관 개관 30주년 기념전</p>
                            <p class="more">Read more</p>
                        </div>
                    </a>
                </li>

                <li class="swiper-slide slider-box">
                    <a href="#">
                        <img class="" src="https://images.prismic.io/stayfolio-production/c65fe543-b3c7-4695-904c-859609637aa5_Main+banner_pc+1.jpg" />
                        <div id="stay-info">
                            <p class="logo"></p>
                            <p class="title"></p>
                            <p class="event subtitle">전어회</p>
                            <p class="more">Read more</p>
                        </div>
                    </a>
                </li>

                <li class="swiper-slide slider-box">
                    <a href="#">
                        <img class="" src="https://images.prismic.io/stayfolio-production/b5310af4-cfb3-4211-859f-37629cf5c0ab_1.jpg" />
                        <div id="stay-info">
                            <p class="logo"></p>
                            <p class="title"></p>
                            <p class="event subtitle">연어회</p>
                            <p class="more">Read more</p>
                        </div>
                    </a>
                </li>
            </ul>

            <div class="swiper-button-prev"><i class="icon-arrow-left"></i></div>
            <div class="swiper-button-next"><i class="icon-arrow-right"></i></div>
            <div class="swiper-pagination">
                <span>0</span>/
                <span>10</span>
            </div>
            <div class="bg-paper"></div>
        </div>
        <!-------- 메인 페이지 비주얼 //END --------->



        <!-------- 메인 페이지 프로모션 창 //START --------->
        <div class="container main-new">
            <div class="sec-title">
                <strong>Stay:Key로 여는 새로운 경험</strong>
            </div>

            <div class="stay-list" id="new-container">
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>

                <div class="swiper-wrapper">
                    <div class="swiper-slide stay-box">
                        <button type="button" id="btn-like"></button>
                        <a href="#"><img src="asset/images/gilsangsa.png" />
                        <div class="name title">길상사</div>
                        <div class="others subtitle"><span>서울 / 성북구</span><span>당일체험&#8361;10,000원</span></div>
                        <div class="btn_more">Read more</div></a></div>
                    <div class="swiper-slide stay-box">
                        <button type="button" id="btn-like"></button>
                        <a href="#"><img src="asset/images/bongeunsa.png"></img>
                        <div class="name title">봉은사</div>
                        <div class="others subtitle"><span>서울 / 강남구</span><span>1일 휴식형&#8361;70,000원</span></div>
                        <div class="btn_more">Read more</div></a></div>
                    <div class="swiper-slide stay-box">
                        <button type="button" id="btn-like"></button>
                        <a href="#"><img src=""></img>
                        <div class="name title"></div>
                        <div class="others subtitle"><span></span><span>&#8361;</span></div>
                        <div class="btn_more">Read more</div></a></div>
                    <div class="swiper-slide stay-box">
                        <button type="button" id="btn-like"></button>
                        <a href="#"><img src=""></img>
                        <div class="name title"></div>
                        <div class="others subtitle"><span></span><span>&#8361;</span></div>
                        <div class="btn_more">Read more</div></a></div>
                    <div class="swiper-slide parallax-bg-5 stay-box">
                        <button type="button" id="btn-like"></button>
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
                    <li class="swiper-slide parallax-bg-1">
                        <a><div class="img"></div>
                        <div class="e_date"></div>
                        <div class="animate"><div class="tit"><p class="text">내게 사랑은 너무 써</p><p class="small">아직 전 어리거든요</p></div>
                        <div class="info"></div>
                        </div></a></li>
                    <li class="swiper-slide parallax-bg-2">
                        <a><div class="img"></div>
                        <div class="e_date"></div>
                        <div class="animate"><div class="tit"><p class="text">" "</p><p class="small">" "</p></div>
                        <div class="info"></div>
                        </div></a></li>
                    <li class="swiper-slide parallax-bg-3">
                        <a><div class="img"></div>
                        <div class="e_date"></div>
                        <div class="animate"><div class="tit"><p class="text">" "</p><p class="small">" "</p></div>
                        <div class="info"></div>
                        </div></a></li>
                    <li class="swiper-slide parallax-bg-4">
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
            </a></li>
        </ul>
     </div>

</div>





<!--
    <script type="text/javascript">
    $(document).ready(function(){
        var visualSwiper = new Swiper(".main-visual-sample", {
            effect: "fade",
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
                nextEl: '.main-visual-sample .swiper-next',
                prevEl: '.main-visual-sample .swiper-prev',
            }
        });
    });
    </script>


    <style type="text/css">
    .main-visual-sample {
        position: relative;
        width: 100%;
        height: 530px;
        margin-bottom: 80px;
        overflow: hidden;
    }
    .main-visual-sample .swiper-wrapper {
        height: 530px;
        overflow: hidden;
    }
    .main-visual-sample .swiper-slide {
        height: 530px;
    }
    .main-visual-sample .swiper-slide .mv-box {
        position: relative;
        width: 880px;
        margin: 0 auto;
    }
    .main-visual-sample .swiper-slide .mv-box a {
        display: block;
        width: 880px;
        height: 530px;
    }
    .main-visual-sample .swiper-slide .mv-box img {
        width: 100%;
        height: 100%;
    }

    .main-visual-sample .swiper-prev,
    .main-visual-sample .swiper-next {
        position: absolute;
        width: 40px;
        height: 530px;
        font-size: 40px;
        line-height: 40px;
        color: rgba(255,255,255,0.5);
        text-align: center;
        background: transparent;
        cursor: pointer;
        z-index: 22;
        -webkit-transition: all 0.2s ease;
        -moz-transition: all 0.2s ease;
        -o-transition: all 0.2s ease;
        transition: all 0.2s ease;
    }
    .main-visual-sample .swiper-prev {
        left: 50%;
        margin-left: -530px;
    }
    .main-visual-sample .swiper-next {
        right: 50%;
        margin-right: -530px;
    }
    .main-visual-sample .swiper-prev:hover,
    .main-visual-sample .swiper-next:hover {
        color: rgba(255,255,255,1);
    }
    </style>


    <div class="main-visual-sample">
        <button class="swiper-prev"><i class="fa fa-angle-left"></i></button>
        <button class="swiper-next"><i class="fa fa-angle-right"></i></button>
        <div class="swiper-wrapper">
            <div class="swiper-slide" style="background: rgb(114, 34, 45);">
                <div class="mv-box">
                    <a href="#"><img src="https://nutridday.com/design/thebagel/banner/220922_main_visual_PC_1320_795.jpg" alt="가을 환절기 기획전" /></a>
                </div>
            </div>

            <div class="swiper-slide" style="background: rgb(231, 180, 161);">
                <div class="mv-box">
                    <a href="#"><img src="https://nutridday.com/design/thebagel/banner/220914_main_visual_PC.jpg" alt="명절 후 다이어트 기획전" /></a>
                </div>
            </div>

            <div class="swiper-slide" style="background: rgb(88, 212, 201);">
                <div class="mv-box">
                    <a href="#"><img src="https://nutridday.com/design/thebagel/banner/210728_main_visual_megalex.jpg" alt="시그니처 메가렉스" /></a>
                </div>
            </div>
        </div>
    </div>


    <a href="https://swiperjs.com/swiper-api" target="_blank">https://swiperjs.com/swiper-api</a>

    
    
<jsp:include page="layout/layout_footer.jsp" />