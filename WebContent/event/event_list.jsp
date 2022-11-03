<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% long time = System.currentTimeMillis(); %>
<jsp:include page="../layout/layout_header.jsp" />
<script type="text/javascript">$("#nav-event").addClass("now");</script>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/asset/css/event.css?<%=time%>" />
<script language="javascript" src="<%=request.getContextPath()%>/asset/js/event.js?<%=time%>"></script>



<div class="container page-title">
    <h2>PROMOTION</h2>
    <h4>스테이:키가 제안하는 여행 레시피</h4>
</div>

<div class="container-full main-event">
    <div class="container-wide event-visual">
        <a href="#">
            <div class= "img" style="background-image: url(//images.stayfolio.com/system/pictures/images/000/148/148/original/e8525a7fc7d249af9de4b7d775c31ed19f68cbff.jpg?1665989518);"></div>
            <div class="house-info">
                <p class="text">나와 피부에게 주는<br>오늘의 회복</p>
                <p class="event">PROMOTION</p>
                <p class="more">Read more</p>
            </div>
        </a>
    </div>

    <div class="container promo-box">

        <div class="sec-title">PROMOTION</div>

        <div class="promo-list">
                <div class="swiper-wrapper">

                    <div class="swiper-slide">
                        <img src="" alt="">
                        <div class="e_date"></div>
                        <div class="info">
                            <p class="small-title"></p>
                            <p class="title" role="presentation">

                            </p>
                            <p class="text"></p>
                            <p class="more"></p>
                        </div>
                    </div>


                    <div class="swiper-slide">
                        <img src="" alt="">
                        <div class="e_date"></div>
                        <div class="info">
                            <p class="small-title"></p>
                            <p class="title" role="presentation">

                            </p>
                            <p class="text"></p>
                            <p class="more"></p>
                        </div>
                    </div>
                </div>
            </ul>
        </div>

    </div>

    <div class="container event-box">
        <div class="sec-title">EVENT</div>

        <div class="swiper-container">

            <div class="swiper-wrapper">

                <div class="swiper-slide">

                    <a href="">
                        <img src="" alt="">

                        <div class="e-date"></div>
                        <div class="name"></div>

                        <div class="other">
                            <span> </span>
                        </div>

                        <div class="text"></div>
                        <div class="more">Read more</div>
                    </a>

                </div>


                <div class="swiper-slide">
                    <a href="">
                        <img src="" alt="">

                        <div class="e-date"></div>
                        <div class="name"></div>

                        <div class="other">
                            <span> </span>
                        </div>

                        <div class="text"></div>
                        <div class="more">Read more</div>
                    </a>
                    
                </div>

                <div class="swiper-slide">
                    <a href="">
                        <img src="" alt="">

                        <div class="e-date"></div>
                        <div class="name"></div>

                        <div class="other">
                            <span> </span>
                        </div>

                        <div class="text"></div>
                        <div class="more">Read more</div>
                    </a>
                </div>


                <div class="swiper-slide">
                    <a href="">
                        <img src="" alt="">

                        <div class="e-date"></div>
                        <div class="name"></div>

                        <div class="other">
                            <span> </span>
                        </div>

                        <div class="text"></div>
                        <div class="more">Read more</div>
                    </a>
                </div>


                <div class="swiper-slide">
                    <a href="">
                        <img src="" alt="">

                        <div class="e-date"></div>
                        <div class="name"></div>

                        <div class="other">
                            <span> </span>
                        </div>

                        <div class="text"></div>
                        <div class="more">Read more</div>
                    </a>
                </div>
            
            </div>

        </div>

    </div>
</div>





<jsp:include page="../layout/layout_footer.jsp" />