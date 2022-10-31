<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% long time = System.currentTimeMillis(); %>
<jsp:include page="layout/layout_header.jsp" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/asset/css/main.css?<%=time%>" />


<script type="text/javascript">
$(document).ready(function(){
    var visualSwiper = new Swiper(".main-visual", {
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
            nextEl: '.main-visual i.fa-chevron-right',
            prevEl: '.main-visual i.fa-chevron-left',
        }
    });

    var swiper = new Swiper("#new-container", {
        slidesPerView: 3,
        spaceBetween: 0,
        speed: 500,
        loop: true,
        touchEnabled: false,
        autoplay: {
            delay: 3000,
            disableOnInteraction: false,
        }
      });
    
    var swiper = new Swiper("#promo-container", {
        effect: "fade",
        slidesPerView: 1,
        spaceBetween: 0,
        speed: 500,
        loop: true,
        touchEnabled: false,
        navigation: {
        pagination: {
          el: ".swiper-pagination",
          type: "fraction",
        },
          nextEl: "#promo-container .fa-chevron-right",
          prevEl: "#promo-container .fa-chevron-left",
        },
    });
});

</script>

${ login_msg }
<c:remove var="login_msg"/>

<!-------- 메인 페이지 시작 --------->
<div id="main-contents" class="main-contents">
    <div class="container-wide main-contents-page">


        <!-------- 메인 페이지 비주얼 //START --------->
        <div id="main-visual" class="main-visual">
            <ul class="swiper-wrapper">
                <li class="swiper-slide slider-box">
                    <a href="#">
                    <img class="img" src="https://images.stayfolio.com/system/pictures/images/000/147/185/original/f7795e07092868f683dc1efd5c38e9707a4958f1.jpg?1665466753;"/>
                        <div class="stay-info">
                            <p class="title">의귀소담</p>
                            <p class="event subtitle">의귀리에서 찾은 진짜 제주</p>
                            <p class="more">Read more</p>
                        </div>
                    </a>
                </li>

                <li class="swiper-slide slider-box">
                    <a href="#">
                        <img class="img" src="https:////images.stayfolio.com/system/pictures/images/000/149/625/original/2785159fd7d9d314fd5f5c511278464805166703.jpg?1666753232"/>
                        <div class="stay-info">
                            <p class="title">월정느루</p>
                            <p class="event subtitle">천천히, 오랫동안</p>
                            <p class="more">Read more</p>
                        </div>
                    </a>
                </li>

                <li class="swiper-slide slider-box">
                    <a href="#">
                        <img class="" src="https://images.prismic.io/stayfolio-production/c65fe543-b3c7-4695-904c-859609637aa5_Main+banner_pc+1.jpg" />
                        <div class="stay-info">
                            <p class="title"></p>
                            <p class="event subtitle">전어회</p>
                            <p class="more">Read more</p>
                        </div>
                    </a>
                </li>

                <li class="swiper-slide slider-box">
                    <a href="#">
                        <img class="" src="https://images.prismic.io/stayfolio-production/b5310af4-cfb3-4211-859f-37629cf5c0ab_1.jpg" />
                        <div class="stay-info">
                            <p class="title"></p>
                            <p class="event subtitle">연어회</p>
                            <p class="more">Read more</p>
                        </div>
                    </a>
                </li>
            </ul>
            <i class="fa fa-chevron-left"></i>
            <i class="fa fa-chevron-right"></i>
        </div>
    </div>
    <!-------- 메인 페이지 비주얼 //END --------->




    

    <!-------- 메인 페이지 신규 창 //START --------->
    <div class="container main-new">
        <div class="sec-title">
            <strong>Stay:Key로 여는 새로운 경험</strong>
        </div>

        <div class="new-container stay-list" id="new-container">

            <div class="swiper-wrapper">
                <div class="swiper-slide stay-box">
                        <a href="#">
                            <img class="img" src="https://images.stayfolio.com/system/pictures/images/000/088/425/original/4c745f673dc5c91bff78dfef019da95786b22e9e.jpg?1628906575" />
                            <div class="title">비 온 후 풍경</div>
                            <div class="subtitle">
                                <span>강원/양양</span>
                            </div>
                            <div class="other">
                                <span>자연과 하나된 프라이빗 휴식</span>
                            </div>
                        </a>
                </div>

                <div class="swiper-slide stay-box">
                        <a href="#">
                            <img src="https://images.stayfolio.com/system/pictures/images/000/105/686/original/0c046e3258a34c039a041b8a679586eac6d86b08.jpg?1640251254" />
                            <div class="title">굿올데이즈 호텔</div>
                            <div class="subtitle">
                                <span>부산/중구</span>
                            </div>
                            <div class="other">
                                <span>좋았던 옛 시절을 회상하는</span>
                            </div>
                        </a>
                </div>

                <div class="swiper-slide stay-box">
                        <a href="#">
                            <img src="https://images.stayfolio.com/system/pictures/images/000/072/793/original/a85c030e3ae1ed36bda4a7d4444debe8d4edd344.jpg?1621839513" />
                            <div class="title">의림여관</div>
                            <div class="subtitle">
                                <span>강원/춘천</span>
                            </div>
                            <div class="other">
                                <span>숲속 나그네의 집</span>
                            </div>
                        </a>
                </div>

                <div class="swiper-slide stay-box">
                        <a href="#">
                            <img src="https://images.stayfolio.com/system/pictures/images/000/078/487/original/fed4b2a88ae247cba7e87a74ff8e8f0efaec753c.jpg?1624414143" />
                            <div class="title">이호소락</div>
                            <div class="subtitle">
                                <span>서울/종로</span>
                            </div>
                            <div class="other">
                                <span>작고 소박한 즐거움, 이호소락</span>
                            </div>
                        </a>
                </div>

                <div class="swiper-slide stay-box">
                    <a href="#">
                        <img src="https://images.stayfolio.com/system/pictures/images/000/126/065/original/80ad8add0dc98fafcc76b18332ad6a4b2d903f30.jpg?1655169615" />
                        <div class="title">시기공추</div>
                        <div class="subtitle">
                            <span>충북/진천</span>
                        </div>
                        <div class="other">
                            <span>시간은 기억으로, 공간은 추억으로</span>
                        </div>
                    </a>
                </div>

                <div class="swiper-slide stay-box">
                    <a href="#">
                        <img src="https://images.stayfolio.com/system/pictures/images/000/071/961/original/42470820f1906ded8cb4a0b93de5950d06a187c5.jpg?1621244347" />
                        <div class="title">몬도마노</div>
                        <div class="subtitle">
                            <span>전남/목포</span>
                        </div>
                        <div class="other">
                            <span>당신이 만드는 영원한 세계</span>
                        </div>
                    </a>
                </div>

                <div class="swiper-slide stay-box">
                    <a href="#">
                        <img src="https://images.stayfolio.com/system/pictures/images/000/075/909/original/0a4b4164fb4d670eadad5a5b435cd9ac73e4be4b.jpg?1623127639" />
                        <div class="title">온화가</div>
                        <div class="subtitle">
                            <span>강원/강릉</span>
                        </div>
                        <div class="other">
                            <span>따뜻하고 고즈넉한 휴식</span>
                        </div>
                    </a>
                </div>

                <div class="swiper-slide stay-box">
                    <a href="#">
                        <img src="https:////images.stayfolio.com/system/pictures/images/000/078/487/original/fed4b2a88ae247cba7e87a74ff8e8f0efaec753c.jpg?1624414143" />
                        <div class="title">이호소락</div>
                        <div class="subtitle">
                            <span>서울/종로</span>
                        </div>
                        <div class="other">
                            <span>작고 소박한 즐거움, 이호소락</span>
                        </div>
                    </a>
                </div>

                <div class="swiper-slide stay-box">
                    <a href="#">
                        <img src="https:////images.stayfolio.com/system/pictures/images/000/078/487/original/fed4b2a88ae247cba7e87a74ff8e8f0efaec753c.jpg?1624414143" />
                        <div class="title">이호소락</div>
                        <div class="subtitle">
                            <span>서울/종로</span>
                        </div>
                        <div class="other">
                            <span>작고 소박한 즐거움, 이호소락</span>
                        </div>
                    </a>
                </div>

                <div class="swiper-slide stay-box">
                    <a href="#">
                        <img src="https:////images.stayfolio.com/system/pictures/images/000/078/487/original/fed4b2a88ae247cba7e87a74ff8e8f0efaec753c.jpg?1624414143" />
                        <div class="title">이호소락</div>
                        <div class="subtitle">
                            <span>서울/종로</span>
                        </div>
                        <div class="other">
                            <span>작고 소박한 즐거움, 이호소락</span>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <!-------- 메인 페이지 신규 창 // END --------->

    <!-------- 메인 페이지 배너 창 --------->
    <div class="main-banner">
        <a href="#">
            <div class="banner-wrap">
                <span>Stay:Key</span><br>
            </div>
        </a>
    </div>


    <!-------- 메인 페이지 프로모션 창 // START  -------------->
     <div class="main-promo">
        <div class="container">
        <!-------- 프로모션 창 타이틀 --------->
            <div class="sec-title" id="pro-title"><strong>PROMOTION</strong></div>
        <!-------- 프로모션 창 목록 --------->
            <div class= "promo-container swiper-container" id="promo-container">
                    <div class="fa fa-chevron-left"></div>
                    <div class="fa fa-chevron-right"></div>
                    <div class="swiper-pagination">
                    </div>

                <ul class="swiper-wrapper">
                    <li class="swiper-slide">
                        <a href="#">
                            <img src="http://images.stayfolio.com/system/pictures/images/000/148/148/original/e8525a7fc7d249af9de4b7d775c31ed19f68cbff.jpg?1665989518"/>
                            <div class="e_date">
                            1 DAY LEFT
                            </div>
                            <div class="promo-title" style="float: right;">
                                <p class="text">나와 피부에게 주는 오늘의 회복</p>
                                <p class="small">프룩스 플럭스 호텔</p>
                            </div>
                        </a>
                    </li>


                    <li class="swiper-slide">
                        <a href="#">
                            <img src="http://images.stayfolio.com/system/pictures/images/000/088/674/original/15012b390d92d2fca9cb2bff7b47de7e4b649050.jpg?1629211014"/>

                            <div class="e_date">

                            </div>
                            <div class="promo-title">
                                <p class="text" >낮고 고요한 사색의 시간</p>
                                <p class="small">흐르는 결</p>
                            </div>
                        </a>
                    </li>


                    <li class="swiper-slide">
                        <a href="#">
                            <img src="//images.stayfolio.com/system/pictures/images/000/075/992/original/5141b3042378cbc8846f93bd524820fb48167128.jpg?1623129791"/>

                            <div class="e_date">
                            
                            </div>
                            <div class="promo-title">
                                <p class="text">제주 서편으로의 자발적 유배</p>
                                <p class="small">고산별곡</p>
                            </div>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!-------- 메인 페이지 프로모션 창 // End  -------------->

</div>



<jsp:include page="layout/layout_footer.jsp" />