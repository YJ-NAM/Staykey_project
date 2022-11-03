<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% long time = System.currentTimeMillis(); %>
<jsp:include page="layout/layout_header.jsp" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/asset/css/main.css?<%=time%>" />
<c:set var="stay" value="${ stayRandom }"/>


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
    var swiper = new Swiper("#recom-container", {
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
                <c:forEach items="${ stay }" var="list">
                <li class="swiper-slide slider-box">
                    <a href="<%=request.getContextPath()%>/stayList.do?stay_no=${list.stay_no}" style="background-image: url('<%=request.getContextPath()%>${stay.stay_file1}');">
                        <div class="stay-info">
                            <p class="title">${ list.stay_name }</p>
                            <p class="event subtitle">${ list.stay_desc }</p>
                            <p class="more"></p>
                        </div>
                    </a>
                </li>
				</c:forEach>
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
                  <c:forEach items="${ stay }" var="list">                
                        <a href="#">
                            <img class="img" src="https://images.stayfolio.com/system/pictures/images/000/088/425/original/4c745f673dc5c91bff78dfef019da95786b22e9e.jpg?1628906575" />
                            <div class="title">${ list.stay_name }</div>
                            <div class="subtitle">
                                <span>${ list.stay_location }</span>
                            </div>
                            <div class="other">
                                <span>${ list.stay_desc }</span>
                            </div>
                        </a>
                   </c:forEach>                        
                </div>

            </div>
        </div>
    </div>
    
    <!-------- 메인 페이지 신규 창 // END --------->

    <!-------- 메인 페이지 배너 창 // START --------->
    <div class="main-banner">
        <a href="#">
            <div class="banner-wrap">
                <span>Stay:Key</span><br>
            </div>
        </a>
    </div>
    
    <!-------- 메인 페이지 배너 창 // END --------->
    

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
                            </a>
                        </div>

                        <div class="swiper-slide stay-box">
                            <a href="#">
                                <img src="//images.stayfolio.com/system/pictures/images/000/132/293/display/14b6cc0a7fe24e0ab119374961a5818a375272ce.jpg?1658394600"/>
                                <div class="e_date"></div>
                                <div class="name">온휴가</div>
                                <div class="other">제주/제주</div>
                                <div class="text">1박 2인<br>숙박권 이벤트</div>   
                            </a>
                        </div>

                        <div class="swiper-slide stay-box">
                            <a href="#">
                                <img src="//images.stayfolio.com/system/pictures/images/000/147/657/original/ff9236bb649baa3c6464feba185b7943b68ecf6f.jpg?1665707694"/>
                                <div class="e_date"></div>
                                <div class="name">선흘림</div>
                                <div class="other">제주/제주</div>
                                <div class="text">1박 4인<br>숙박권 이벤트</div>
                            </a>
                        </div>

                        <div class="swiper-slide stay-box">
                            <a href="#">
                                <img src="//images.stayfolio.com/system/pictures/images/000/120/916/display/337e491a01a57f6aa4fb3c85620e841aa0196044.jpg?1651474647"/>
                                <div class="e_date"></div>
                                <div class="name">시나몬</div>
                                <div class="other">강원/강릉</div>
                                <div class="text">1박 2인<br>숙박권 이벤트</div>
                            </a>
                        </div>

                        <div class="swiper-slide stay-box">
                            <a href="#">
                                <img src="//images.stayfolio.com/system/pictures/images/000/119/466/display/46c8f4d958eeac7e78f09e3bb2d70c25c8548d33.jpg?1650349372"/>
                                <div class="e_date"></div>
                                <div class="name">유온</div>
                                <div class="other">경북/경주</div>
                                <div class="text">1박 4인/숙박권 이벤트</div>
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
                                <h3 class="title">예이제<br>Yeije</h3>
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
                                <h3 class="title">Chill<br>Drive-in</h3>
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
                                <h3 class="title">Warm<br>than cold<br>Mansion</h3>
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
                                <h3 class="title">서리애<br>Seorier</h3>
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
                            <div class="img" style="background-image:url(https://images.prismic.io/stayfolio-production/e1765be7-12d8-4c86-b211-f95e0d55dde7_Main+banner_pc.jpg?auto=compress,format&rect=0,0,1800,850&w=1800&h=850"></div>
                            <div class="text">내면으로 이끄는<br>달빛을 따라가다</div>
                            <div class="other"><span>서울/종로</span></div>
                            <div class="more">Read more</div>
                        </a>
                    </li>
            

                    <li class="stay-box">
                        <a href="#">
                            <div class="img" style="background-image:url(https://images.stayfolio.com/system/pictures/images/000/149/246/original/adc58deccc741bb51635db278a750413558ce38a.jpg?1666661803)"></div>
                            <div class="text">차분하고 세심한<br>환대를 전하는</div>
                            <div class="other"><span>부산/중구</span></div>
                            <div class="more">Read more</div>
                        </a>
                    </li>
                    
                    <li class="stay-box">
                        <a href="#">
                            <div class="img" style="background-image:url(https://images.stayfolio.com/system/pictures/images/000/148/583/original/4c11fe3b141c63b19baaab5ff8f69b7ef96810ee.jpg?1666257238)"></div>
                            <div class="text">거닐기 좋은 산길<br>나무와 흙의 냄새</div>
                            <div class="other"><span>강원/강릉</span></div>
                            <div class="more">Read more</div>
                        </a>
                    </li>


                    <li class="stay-box">
                        <a href="#">
                             <div class="img" style="background-image:url(https://images.stayfolio.com/system/pictures/images/000/148/018/original/14ae80a922f2e590385dd813abb92bbd8cea20e0.jpg?1665772350)"></div>
                            <div class="text">계절의<br>아름다움이 깃든</div>
                            <div class="other"><span>제주/제주</span></div>
                            <div class="more">Read more</div>
                        </a>
                    </li>


                    <li class="stay-box">
                        <a href="#">
                            <div class="img" style="background-image:url(https://images.stayfolio.com/system/pictures/images/000/148/695/original/744c7bcdc9c328753ff0e1bcea55c087b21c8940.png?1666401701)"></div>
                            <div class="text">잔잔한 위로가<br>필요한 당신에게</div>
                            <div class="other"><span>서울/종로</span></div>
                            <div class="more">Read more</div>
                        </a>
                    </li>


                    <li class="stay-box">
                        <a href="#">
                            <div class="img" style="background-image:url(https://images.stayfolio.com/system/pictures/images/000/147/020/original/37728b0c88d7f0453cc134b9bd9ab72d9ddba6a2.jpg?1665195702)"></div>
                            <div class="info back">
                                <div class="text">육지 끝자락에서 즐기는<br>료칸 무드</div>
                                <div class="other"><span>경상/남해</span></div>
                                <div class="more">Read more</div>
                            </div>
                        </a>
                    </li>
                </ul>
         </div>
    <!-------- 메인 페이지 트래블 창 // END --------->
    
    <!-------- 메인 페이지 추천 창 // START @@ -->
    <div class="main-Tagthumb">
        <div class= "container" id="tagThumb-container">
            <div class="subject">
            모든 순간이 여행이 되도록
            </div>
            <div class="thumblist">
                <div class="row">
                    <a href="#" class="thumbbox thumb-0">
                        <img src="//images.stayfolio.com/system/pictures/images/000/088/744/original/0d06c72c85e6c5dc648b0a8c4b35282a79af4ecc.jpg?1629255695" />
                        <span class="tag">빔 프로젝터</span>
                    </a>

                    <a href="#" class="thumbbox thumb-1">
                        <img src="//images.stayfolio.com/system/pictures/images/000/088/745/original/2fd777fc17341806d2231b4abd26a247cc052772.jpg?1629255697" />
                        <span class="tag">턴테이블</span>
                    </a>

                    <a href="#" class="thumbbox thumb-2">
                        <img src="https://images.stayfolio.com/system/pictures/images/000/135/889/small/f14cfc7d85b36c23f274f10bf08c1a1c93a00ba4.jpg?1660626621" />
                        <span class="tag">노천탕</span>
                    </a>

                    <a href="#" class="thumbbox thumb-3">
                        <img src="//images.stayfolio.com/system/pictures/images/000/118/481/small/3c210ad8097af94bda97ff7a52bfd17ce992a6f9.jpg?1649237277" />
                        <span class="tag">도심 속 사색</span>
                    </a>

                    <a href="#" class="thumbbox thumb-4">
                        <img src="//images.stayfolio.com/system/pictures/images/000/089/336/small/a231b86747a1fe8233ae6042f05335ddfc6a5cc5.jpg?1629453497" />
                        <span class="tag">책의 세계로</span>
                    </a>
                </div>
            </div>


        </div>
    </div>
    <!-------- 메인 페이지 추천 창 // END --------->


    <!-------- 메인 페이지 홍보 창 //START --------->
    <div class="container main-recom">
        <div class="sec-title">
            <span class= "title1">지금 바로 떠나는</span>
            <br>
            <span class="title2">제주</span>
        </div>

        <div class="recom-container stay-list" id="recom-container">

            <div class="swiper-wrapper">
                <div class="swiper-slide stay-box">
                        <a href="#">
                            <img class="img" src="https://images.stayfolio.com/system/pictures/images/000/056/240/small/40db9aa6f6ecd37bafa52446e8b4e7184f42421a.jpg?1602986265" />
                            <div class="title">돌채</div>
                            <div class="subtitle">
                                <span>제주/제주</span>
                            </div>
                            <div class="other">
                                <span>우도 섬에서의<br>괜찮은 하루</span>
                            </div>
                        </a>
                </div>

                <div class="swiper-slide stay-box">
                        <a href="#">
                            <img src="https://images.stayfolio.com/system/pictures/images/000/067/454/small/f129c57606f5344fd7aa1625fff9ecbce5730b47.jpg?1617863139" />
                            <div class="title">스테이 쿠이디</div>
                            <div class="subtitle">
                                <span>제주/제주</span>
                            </div>
                            <div class="other">
                                <span>여행에서 만난<br>우리 집</span>
                            </div>
                        </a>
                </div>

                <div class="swiper-slide stay-box">
                        <a href="#">
                            <img src="https://images.stayfolio.com/system/pictures/images/000/107/068/small/625619ccd491cfa77ff029de3664c4d736f894c0.jpg?1640839677" />
                            <div class="title">두 번째 마음</div>
                            <div class="subtitle">
                                <span>제주/서귀포</span>
                            </div>
                            <div class="other">
                                <span>온기가 스며있는<br>당신의 두 번째 집</span>
                            </div>
                        </a>
                </div>

                <div class="swiper-slide stay-box">
                        <a href="#">
                            <img src="https://images.stayfolio.com/system/pictures/images/000/095/856/small/8074ccf4ff07ad66718147184eee206b75ce940f.jpg?1633575582" />
                            <div class="title">잔월</div>
                            <div class="subtitle">
                                <span>제주/제주</span>
                            </div>
                            <div class="other">
                                <span>하나의 지붕<br>청풍명월</span>
                            </div>
                        </a>
                </div>

                <div class="swiper-slide stay-box">
                    <a href="#">
                        <img src="https://images.stayfolio.com/system/pictures/images/000/132/917/small/ef9a14919a654ea6afb12e9e635be385dd18d0d5.jpg?1658810430" />
                        <div class="title">무디타 제주</div>
                        <div class="subtitle">
                            <span>제주/제주</span>
                        </div>
                        <div class="other">
                            <span>편안한 시간 속<br>살아나는 감각</span>
                        </div>
                    </a>
                </div>

                <div class="swiper-slide stay-box">
                    <a href="#">
                        <img src="https://images.stayfolio.com/system/pictures/images/000/123/803/original/2edd884b178f7c4db00d858ddd414707ca18d391.jpg?1653369122" />
                        <div class="title">포도호텔</div>
                        <div class="subtitle">
                            <span>제주/서귀포</span>
                        </div>
                        <div class="other">
                            <span>열림과 닫힘<br>그리고 자연</span>
                        </div>
                    </a>
                </div>


                <div class="swiper-slide stay-box">
                    <a href="#">
                        <img src="https://images.stayfolio.com/system/pictures/images/000/043/174/small/3846f44ac1d9b758987d477dddb850cec3c1d4de.jpg?1581920657" />
                        <div class="title">와온</div>
                        <div class="subtitle">
                            <span>제주/제주</span>
                        </div>
                        <div class="other">
                            <span>제주의 온기를 전하다</span>
                        </div>
                    </a>
                </div>

                <div class="swiper-slide stay-box">
                    <a href="#">
                        <img src="https://images.stayfolio.com/system/pictures/images/000/044/640/small/a222bc696d6313e07dd2962a5c07dd4a3a40c9f7.jpg?1584782495" />
                        <div class="title">탐라는일상</div>
                        <div class="subtitle">
                            <span>제주/서귀포</span>
                        </div>
                        <div class="other">
                            <span>신비로운 곶자왈과 맞닿다</span>
                        </div>
                    </a>
                </div>

                <div class="swiper-slide stay-box">
                    <a href="#">
                        <img src="https://images.stayfolio.com/system/pictures/images/000/147/330/small/3af0f5d0591eeeab963ad5bb4aff1bc745abfb31.jpg?1665535990" />
                        <div class="title">섭재</div>
                        <div class="subtitle">
                            <span>제주/제주</span>
                        </div>
                        <div class="other">
                            <span>바람을 타고<br>숲의 목소리</span>
                        </div>
                    </a>
                </div>

                <div class="swiper-slide stay-box">
                    <a href="#">
                        <img src="https://images.stayfolio.com/system/pictures/images/000/128/315/small/abd959fa7bb7df58ac1ad4395773b649fab78e5d.jpg?1656563519" />
                        <div class="title">아녹</div>
                        <div class="subtitle">
                            <span>제주/제주</span>
                        </div>
                        <div class="other">
                            <span>편안하고 조용히<br>'아녹'하다</span>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <!-------- 메인 페이지 홍보 창 // END --------->


</div>



<jsp:include page="layout/layout_footer.jsp" />