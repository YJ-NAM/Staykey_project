<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% long time = System.currentTimeMillis(); %>
<jsp:include page="layout/layout_header.jsp" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/asset/css/main.css?<%=time%>" />
<c:set var="stay" value="${ stayRandom }"/>
<c:set var="selectedStay" value="${ selectedStay }"/>
<c:set var="keyword" value="${ keyword }"/>
<c:set var="event" value="${ eventList }"/>
<c:set var="magazine" value="${ magazineList }"/>
<c:set var="stayName" value="${ stayName }"/>

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
                	<c:choose>
                	<c:when test="${ !empty list.stay_file1 }">
                    <a href="<%=request.getContextPath()%>/stayView.do?stay_no=${ list.stay_no }" style="background-image: url('<%=request.getContextPath()%>${list.stay_file1}');">
                    </c:when>
                    <c:when test="${ !empty list.stay_file2 }">
                    <a href="<%=request.getContextPath()%>/stayView.do?stay_no=${ list.stay_no }" style="background-image: url('<%=request.getContextPath()%>${list.stay_file2}');">
                    </c:when>
                    </c:choose>
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
                  <c:forEach items="${ stay }" var="list" begin="0" end="3">                
	                    <c:choose>
	                	<c:when test="${ !empty list.stay_file2}">
	                    <a href="<%=request.getContextPath()%>/stayView.do?stay_no=${ list.stay_no }">
                            <img class="img" src="<%=request.getContextPath()%>${list.stay_file2}" />
	                    </c:when>
	                    <c:when test="${ !empty list.stay_file3}">
	                    <a href="<%=request.getContextPath()%>/stayView.do?stay_no=${ list.stay_no }">
                            <img class="img" src="<%=request.getContextPath()%>${list.stay_file3}" />
	                    </c:when>
	                    </c:choose>
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
    

    <!-------- 메인 페이지 프로모션 창 : 이벤트 // START  -------------->
     <div class="main-promo">
        <div class="container">
        <!-------- 프로모션 창 타이틀 --------->
            <div class="sec-title" id="pro-title"><strong>PROMOTION</strong></div>
        <!-------- 프로모션 창 목록 --------->
            <div class= "promo-container swiper-container" id="promo-container">
                    <ul class="swiper-wrapper">
                     <c:forEach items="${ event }" var="event">
                        <li class="swiper-slide">
                            <a href="<%=request.getContextPath()%>/eventList.do?bbs_no=${ event.bbs_no }">
                                <div class="promo-title">
                                    <p class="text">${ event.bbs_title }</p>
                                    <p class="small">${ event.bbs_stayno }</p>
                                </div>
                                <div class="e_date"></div>
                                <img src="<%=request.getContextPath()%>${event.bbs_file1}"/>
                            </a>
                        </li>
					</c:forEach>                        
                    </ul>
                <div class="swiper-pagination"></div>
                <div class="fa fa-chevron-left"></div>
                <div class="fa fa-chevron-right"></div>
                <div class="clear"></div>
            </div>
        </div>
    </div>
    <!-------- 메인 페이지 프로모션 창 // End  -------------->


   <!-------- 메인 페이지 이벤트 창 : 조인 필요 // start --------->
   <div class="container main-event">
            <div class="sec-title">EVENT</div>
        <div class="event-container stay-list" id="event-container">
            <div class="swiper-wrapper">
           		 <c:forEach items="${ event }" var="eventStay">
                     <div class="swiper-slide stay-box">
                         <a href="#">
                             <img src="//images.stayfolio.com/system/pictures/images/000/117/566/display/6e562fe56d75731318ae0c7cb4d3dc380a1d459d.jpg?1648778979"/>
                             <div class="e_date"></div>
                             <div class="name">멜로우 맨션</div>
                             <div class="other">인천/강화</div>
                             <div class="text">1박 2인<br>숙박권 이벤트</div>
                         </a>
                     </div>
                 </c:forEach>
            </div>
        </div>
    </div>
    <!-------- 메인 페이지 이벤트 창 // end --------->


    <!-------- 메인 페이지 매거진 창 // start --------->
    <div class="main-magazine">
        <div class="swiper-container" id="magazine-container">
            <ul class="swiper-wrapper">
            	<c:forEach items="${ magazine }" var="mgz">
                    <li class="swiper-slide">
                    
                      <a href="<%=request.getContextPath()%>/stayView.do?stay_no=${ list.stay_no }" style="background-image: url('<%=request.getContextPath()%>${mgz.bbs_list_img}');">
                        <div class="stay-info">
                                <h3 class="title"><c:forTokens items="${ mgz.bbs_title }" delims="<" var="title" begin="1" end="1">${ title }</c:forTokens></h3>
                                <p class="text"><c:forTokens items="${ mgz.bbs_title }" delims="<" var="desc" begin="0" end="0">${ desc }</c:forTokens> </p>
                                <p class="magazine">MAGAZINE</p>
                                <p class="more">Read more</p>
                            </div>
                        </a>                    
                    </li>
                </c:forEach>                
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
			<c:forEach items="${ stay }" var="list">
				<li class="stay-box">
                    <c:choose>
                            <c:when test="${ !empty list.stay_file3 }">
                            <a href="<%=request.getContextPath()%>/stayView.do?stay_no=${ list.stay_no }">
                                <img class="img" src="<%=request.getContextPath()%>${list.stay_file3}" />
                            </c:when>
                            <c:when test="${ !empty list.stay_file4 }">
                            <a href="<%=request.getContextPath()%>/stayView.do?stay_no=${ list.stay_no }">
                                <img class="img" src="<%=request.getContextPath()%>${list.stay_file4}" />
                            </c:when>
                    </c:choose>
                        <div class="text">${ list.stay_desc }</div>
                        <div class="other">
                            <span>${ list.stay_location }</span>
                        </div>
                        <div class="more">Read more</div> 
                    </a>
				</li>
			</c:forEach>
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
            <span class="title2">${ keyword }</span>
        </div>

        <div class="recom-container stay-list" id="recom-container">

            <div class="swiper-wrapper">
            	<c:forEach items="${ selectedStay }" var="list">
                <div class="swiper-slide stay-box">
	               	 <c:choose>
		               	  <c:when test="${ !empty list.stay_file4 }">
							 <a href="<%=request.getContextPath()%>/stayView.do?stay_no=${ list.stay_no }">
	                            <img class="img" src="<%=request.getContextPath()%>${list.stay_file4}" />	                      
                          </c:when>
	                      <c:when test="${ !empty list.stay_file5 }">
							 <a href="<%=request.getContextPath()%>/stayView.do?stay_no=${ list.stay_no }">
	                            <img class="img" src="<%=request.getContextPath()%>${list.stay_file5}" />	                      
                          </c:when>
	                      <c:when test="${ !empty list.stay_file1 }">
							 <a href="<%=request.getContextPath()%>/stayView.do?stay_no=${ list.stay_no }">
	                            <img class="img" src="<%=request.getContextPath()%>${list.stay_file1}" />	                      
                          </c:when>
	                  </c:choose>
                      <div class="title">${ list.stay_name }</div>
                      <div class="subtitle">
                          <span>${ list.stay_location }</span>
                      </div>
                      <div class="other">
                          <span>${ list.stay_desc }</span>
                      </div>
                      </a>
                </div>
				</c:forEach>                
            </div>
        </div>
    </div>
    <!-------- 메인 페이지 홍보 창 // END --------->


</div>



<jsp:include page="layout/layout_footer.jsp" />