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


    var swiper = new Swiper("#event-container", {
        slidesPerView: 3,
        spaceBetween: 0,
        speed: 500,
        loop: true,
        touchEnabled: false,
        autoplay: {
            delay: 3000,
            disableOnInteraction: false,
        },
      });


      var visualSwiper = new Swiper("#magazine-container", {
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
            nextEl: '#magazine-container .fa-chevron-right',
            prevEl: '#magazine-container .fa-chevron-left',
        }
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
                    <ul class="swiper-wrapper">
                        <li class="swiper-slide">
                            <a href="#">
                                <div class="promo-title">
                                    <p class="text">나와 피부에게 주는 오늘의 회복</p>
                                    <p class="small">프룩스 플럭스 호텔</p>
                                </div>
                                <div class="e_date"></div>
                                <img src="http://images.stayfolio.com/system/pictures/images/000/148/148/original/e8525a7fc7d249af9de4b7d775c31ed19f68cbff.jpg?1665989518"/>
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
                <div class="swiper-pagination"></div>
                <div class="fa fa-chevron-left"></div>
                <div class="fa fa-chevron-right"></div>
                <div class="clear"></div>
            </div>
        </div>
    </div>
    <!-------- 메인 페이지 프로모션 창 // End  -------------->


   <!-------- 메인 페이지 이벤트 창 // start --------->
   <div class="container main-event">
            <div class="sec-title">EVENT</div>
        <div class="event-container stay-list" id="event-container">
            <div class="swiper-wrapper">
                        <div class="swiper-slide stay-box">
                            <a href="#">
                                <img src="//images.stayfolio.com/system/pictures/images/000/117/566/display/6e562fe56d75731318ae0c7cb4d3dc380a1d459d.jpg?1648778979"/>
                                <div class="e_date"></div>
                                <div class="name">멜로우 맨션</div>
                                <div class="other">인천/강화</div>
                                <div class="text">1박 2인<br>숙박권 이벤트</div>
                                <div class="more">Read more</div>
                            </a>
                        </div>

                        <div class="swiper-slide stay-box">
                            <a href="#">
                                <img src="//images.stayfolio.com/system/pictures/images/000/132/293/display/14b6cc0a7fe24e0ab119374961a5818a375272ce.jpg?1658394600"/>
                                <div class="e_date"></div>
                                <div class="name">온휴가</div>
                                <div class="other">제주/제주</div>
                                <div class="text">1박 2인<br>숙박권 이벤트</div>   
                                <div class="more">Read more</div>
                            </a>
                        </div>

                        <div class="swiper-slide stay-box">
                            <a href="#">
                                <img src="//images.stayfolio.com/system/pictures/images/000/147/657/original/ff9236bb649baa3c6464feba185b7943b68ecf6f.jpg?1665707694"/>
                                <div class="e_date"></div>
                                <div class="name">선흘림</div>
                                <div class="other">제주/제주</div>
                                <div class="text">1박 4인<br>숙박권 이벤트</div>
                                <div class="more">Read more</div>
                            </a>
                        </div>

                        <div class="swiper-slide stay-box">
                            <a href="#">
                                <img src="//images.stayfolio.com/system/pictures/images/000/120/916/display/337e491a01a57f6aa4fb3c85620e841aa0196044.jpg?1651474647"/>
                                <div class="e_date"></div>
                                <div class="name">시나몬</div>
                                <div class="other">강원/강릉</div>
                                <div class="text">1박 2인<br>숙박권 이벤트</div>
                                <div class="more">Read more</div>
                            </a>
                        </div>

                        <div class="swiper-slide stay-box">
                            <a href="#">
                                <img src="//images.stayfolio.com/system/pictures/images/000/119/466/display/46c8f4d958eeac7e78f09e3bb2d70c25c8548d33.jpg?1650349372"/>
                                <div class="e_date"></div>
                                <div class="name">유온</div>
                                <div class="other">경북/경주</div>
                                <div class="text">1박 4인/숙박권 이벤트</div>
                                <div class="more">Read more</div>
                            </a>
                        </div>
            </div>
        </div>
    </div>
    <!-------- 메인 페이지 이벤트 창 // end --------->


    <!-------- 메인 페이지 매거진 창 // start --------->
    <div class="main-magazine">
        <div class="swiper-container" id="magazine-container">
            <ul class="swiper-wrapper">
                    <li class="swiper-slide">
                        <a href="#">
                            <img src="https://images.stayfolio.com/system/pictures/images/000/149/523/original/135581dedb1c12eb129bef11419240c8d531501c.jpg?1666732643" />
                            <div class="stay-info">
                                <img src= "https://images.stayfolio.com/system/pictures/images/000/149/899/original/8fb750bcb410cef63d51c191080e24f8c986a18d.png?1666866407" />
                                <p class="text">육지의 섬에서<br>완전한 자유를 얻다</p>
                                <p class="magazine">MAGAZINE</p>
                                <p class="more">Read more</p>
                            </div>
                        </a>
                    
                    </li>
                    
                
                    
                    <li class="swiper-slide">
                        <a href="#">
                            <img src="https://images.stayfolio.com/system/pictures/images/000/145/825/original/723b3074a426daf8b64c5558c5628a9aee3e51fc.jpg?1664501407" />
                            <div class="stay-info">
                                <img src="https://images.stayfolio.com/system/pictures/images/000/145/798/original/f1c2bb13fb6839fc5d542a15f0ee2cdfec00b07e.jpg?1664500460" />
                                <p class="text">가능한 한 Chill하게<br>그러나 즐겁게</p>
                                <p class="magazine">MAGAZINE</p>
                                <p class="more">Read more</p>
                            </div>
                        </a>
                    
                    </li>
                    
                
                    
                    
                    <li class="swiper-slide">
                        <a href="#">
                            <img src="https://images.stayfolio.com/system/pictures/images/000/141/787/original/871d151510e15a774bcd84f5637d657c03a94df8.jpg?1663121653" />
                            <div class="stay-info">
                                <img src="https://images.stayfolio.com/system/pictures/images/000/141/790/original/0c6ebcdfee1a734d55a624abaad3c49a1d1af3da.jpg?1663121694" ></img>
                                <p class="text">한 척의 우주선 혹은<br>비일상의 궤도에 올라</p>
                                <p class="magazine">MAGAZINE</p>
                                <p class="more">Read more</p>
                            </div>
                        </a>
                    
                    </li>
                    
                
                    
                    <li class="swiper-slide">
                        <a href="#">
                            <img src="https://images.stayfolio.com/system/pictures/images/000/140/370/original/a79d65f3efd11ef8f463e31009661c5e5d96e4c4.jpg?1662352893" />
                            <div class="stay-info">
                                <img src="https://images.stayfolio.com/system/pictures/images/000/135/567/original/ae9601936496ede84b9e6dcbd340b151fbd063b9.jpg?1660612147" />
                                <p class="text">마음에 서리는<br>시간의 기억들</p>
                                <p class="magazine">MAGAZINE</p>
                                <p class="more">Read more</p>
                            </div>
                        </a>
                    </li>
                </ul> 
            <div class="fa fa-chevron-left"></div>
            <div class="fa fa-chevron-right"></div>
         </div>
    </div>
    <!-------- 메인 페이지 매거진 창 END  --------->



    <!-------- 메인 페이지 트래블 창 // START --------->
    <div class="container main-travel">
            <div class="sec-title">TRAVEL</div>
        <ul class="stay-list">
                <li class="stay-box">
                    <a href="#">
                        <img src= "https://images.stayfolio.com/system/pictures/images/000/149/246/original/adc58deccc741bb51635db278a750413558ce38a.jpg?1666661803"/>
                        <div class="text">차분하고 세심한<br>환대를 전하는</div>
                        <div class="other"><span>부산/중구</span></div>
                        <div class="more">Read more</div>
                    </a>
                </li>
        

                <li class="stay-box">
                    <a href="#">
                        <img src="//images.stayfolio.com/system/pictures/images/000/149/966/original/b415c75e3377f5765ecded49771603aa439fc501.jpg?1667005072" class="img" />
                        <div class="text">오래도록 기억될<br>우리의 시간</div>
                        <div class="other"><span>""</span></div>
                        <div class="more">Read more</div>
                    </a>
                </li>


                <li class="stay-box">
                    <a href="#">
                        <img src="//images.stayfolio.com/system/pictures/images/000/147/020/original/37728b0c88d7f0453cc134b9bd9ab72d9ddba6a2.jpg?1665195702" class="img" />
                        <div class="text">육지 끝자락에서 느끼는<br>료칸 무드</div>
                        <div class="other"><span>""</span></div>
                        <div class="more">Read more</div>
                    </a>
                </li>


                <li class="stay-box">
                    <a href="#">
                        <img src="" class="img" />
                        <div class="text">" "</div>
                        <div class="other"><span>""</span></div>
                        <div class="more">Read more</div>
                    </a>
                </li>


                <li class="stay-box">
                    <a href="#">
                        <img src="" class="img" />
                        <div class="text">" "</div>
                        <div class="other"><span>""</span></div>
                        <div class="more">Read more</div>
                    </a>
                </li>


                <li class="stay-box">
                    <a href="#">
                        <img src="" class="img" />
                        <div class="text">" "</div>
                        <div class="other"><span>""</span></div>
                        <div class="more">Read more</div>
                    </a>
                </li>
            </ul>
         </div>
    <!-------- 메인 페이지 트래블 창 // END --------->

</div>



<jsp:include page="layout/layout_footer.jsp" />