<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="layout/layout_header.jsp" />



<div id="container" class="container">
   <div class="container-main">
        <div class="container-main-swiper">
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
            <ul class= "swiper-wrapper">
                <li><a href="#"><img class="img" src="asset/images/leegunhee.jpeg">
                    <div class="stay-info">
                    <p class="logo"></p>
                    <p class="text">어느 수집가의 초대</p>
                    <p class="event"> MMCA 이건희컬렉션 특별전: 한국미술명작 </p>
                    <p class="more">Read more</p></div>
                </a></li>
                <li><a href="#"><img class="img" src="asset/images/fearlove.jpeg">
                    <div class="stay-info">
                    <p class="logo"></p>
                    <p class="text">두려움일까 사랑일까</p>
                    <p class="event">서울미술관 개관 10주년 기념전</p>
                    <p class="more">Read more</p></div>
                </a></li>
                <li><a href="#"><img class="img" src="asset/images/whanki.jpeg">
                    <div class="stay-info">
                    <p class="logo"></p>
                    <p class="text">우리끼리의 얘기</p>
                    <p class="event">환기미술관 개관 30주년 기념전</p>
                    <p class="more">Read more</p></div>
                </a></li>
                <li><a href="#"><img class="" src="">
                    <div class="stay-info">
                    <p class="logo"></p>
                    <p class="text"></p>
                    <p class="event">전어회</p>
                    <p class="more">Read more</p></div>
                </a></li>
                <li><a href="#"><img class="" src="">
                    <div class="stay-info">
                    <p class="logo"></p>
                    <p class="text"></p>
                    <p class="event">악수회</p>
                    <p class="more">Read more</p></div>
                </a></li></ul>
            <div class="swiper-pagination"></div>
            <div class="bg_paper"></div>
        </div>
   <div class="container-main-new">
        <div class="new-title">Stay:Key로 여는 경험들</div>
    <div class="new-stay-list"></div>
        <div class="new-button-prev"></div>
        <div class="new-button-next"></div>
     <div class="new-list-pagination">
        <span class="new-list-current">1</span> /
        <span class="new-list-total">5</span></div>
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

   <div class="container-main-banner">
        <a href="#"><div class="banner-wrap"><span>여가를 여는 열쇠 Stay:Key</span><br><br></div></span></div></a></div>
    
    <div class="container-main-event">
        <div class="event-title">Luc:Key</div>

         <div class="event-stay-list">
                 <div class="event-button-prev"></div>
                 <div class="event-button-next"></div>
         <div class="event-swiper-pagination">
             <span></span>
             <span></span></div>
         </div>
        <div class="event-swiper-wrapper">
         <div class="event-swiper-wrapper-slide"></div>
         <div class="event-swiper-wrapper-slide-staybox"></div>
         <div class="event-swiper-wrapper-slide-staybox"></div>
         <div class="event-swiper-wrapper-slide-staybox"></div>
        </div>
        <br>
        <br>
        <br>
    </div>

   <div class="container-main-magazine">
    <div class="main-magazine-banner" id="main-magazine-banner">
        <div class="magazine-button-prev"></div>
        <div class="magazine-button-next"></div>
            <ul class="swiper-wrapper">
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li></ul>
    <div class="main-magazine-pagination">
        <span class="magazine-pagination-current"></span>
        <span class="magazine-pagination-total"></span></div>

    <div class="main-magazine-bg-paper"></div>
     </div>
     </div> 

   <div class="container-main-tagthumb"></div>
   <div class="container-main-contact"></div>
</div>





<jsp:include page="layout/layout_footer.jsp" />