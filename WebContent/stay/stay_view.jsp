<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% long time = System.currentTimeMillis(); %>
<jsp:include page="../layout/layout_header.jsp" />
<script type="text/javascript">$("#nav-stay").addClass("now");</script>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/asset/css/stay.css?<%=time%>" />
<script language="javascript" src="<%=request.getContextPath()%>/asset/js/stay.js?<%=time%>"></script>




<div class="container-full stay-view">

    <h2 class="sv-name">제주스테이 비우다</h2>


    <!-- 숙소 상단정보 //START -->
    <div class="sv-top">
        <div class="svt-info">
            <div class="name">제주스테이 비우다<small>제주 / 서귀포시</small></div>
            <div class="desc">온전히 비우다 그리고 제주의 온기와 에너지로 채우다</div>
            <button type="button" class="wish on" onclick="alert('찜하기 Ajax 액션');"><i class="fa fa-heart-o"></i> 찜하기</button>
        </div>

        <div class="svt-photo">
            <button type="button" class="swiper-button-prev"><i class="fa fa-angle-left"></i></button>
            <button type="button" class="swiper-button-next"><i class="fa fa-angle-right"></i></button>
            <ul class="swiper-wrapper">
                <li class="swiper-slide"><div class="img" style="background-image: url('https://images.stayfolio.com/system/pictures/images/000/059/609/original/a30d90ce8b987caa059e1eafb3e49305e2fc207c.jpg');"></div></li>
                <li class="swiper-slide"><div class="img" style="background-image: url('https://images.stayfolio.com/system/pictures/images/000/077/909/original/7a4d6e601c1b249dac001d1bf5c432376f97194a.jpg');"></div></li>
                <li class="swiper-slide"><div class="img" style="background-image: url('https://images.stayfolio.com/system/pictures/images/000/077/907/original/45481fde7ab2dc0c051176de0157427ddb91c3b6.jpg');"></div></li>
                <li class="swiper-slide"><div class="img" style="background-image: url('https://images.stayfolio.com/system/pictures/images/000/077/908/original/5c5c6a60eed39fe342427065924a9a1a1b82b8cf.jpg');"></div></li>
            </ul>
        </div>
    </div>
    <!-- 숙소 상단정보 //START -->





    <!-- 숙소 Room목록 //START -->
    <div class="sv-room">
        <div class="svr-info container">
            <div class="tit">ROOMS</div>
            <div class="txt">온전히 비우다 그리고 제주의 온기로 채우다</div>
            <div class="swiper-button">
                <button type="button" class="swiper-button-prev"><i class="fa fa-angle-left"></i></button>
                <button type="button" class="swiper-button-next"><i class="fa fa-angle-right"></i></button>
            </div>
        </div>


        <div class="svr-list">
            <ul class="swiper-wrapper">
                <li class="swiper-slide">
                    <a href="<%=request.getContextPath()%>/stayRoom.do?stay_no=123&room_no=23" style="background-image: url('https://images.stayfolio.com/system/pictures/images/000/062/024/original/ef3c52c8dac8c09c1fa832cb18275195e352ff13.jpg');">
                        <div class="room-info">
                            <p class="name">스탠다드 베이직<small>기본형</small></p>
                            <p class="price">₩220,000~</p>
                            <p class="etc">
                                <span>기준 2명 (최대 2명)</span>
                                <span>침구 2개</span>
                            </p>
                            <p class="reserv">예약하기</p>
                        </div>
                    </a>
                </li>


                <li class="swiper-slide">
                    <a href="<%=request.getContextPath()%>/stayRoom.do?stay_no=123&room_no=23" style="background-image: url('https://images.stayfolio.com/system/pictures/images/000/062/054/original/b5af0afa0caa9356fb29fa9e0275c4f0fc820f4c.jpg');">
                        <div class="room-info">
                            <p class="name">스탠다드 프리미엄<small>기본형</small></p>
                            <p class="price">₩270,000~</p>
                            <p class="etc">
                                <span>기준 2명 (최대 2명)</span>
                                <span>침구 2개</span>
                            </p>
                            <p class="reserv">예약하기</p>
                        </div>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <!-- 숙소 Room목록 //START -->





    <!-- 숙소 상세정보 //START -->
    <div class="sv-detail">

        <div class="stay-view-cont">
            <!-- 내용 컨텐츠 1 (소개) //start -->
            <div>
<div class="container fdetail_text"><div class="fdetail_title">감귤농장 창고를 모티브로 완성된 건축작품 속에서 머물다
모던 감성의 힐링 스테이<small>제주스테이 비우다</small></div><div class="txt1">제주 자연 속에 숨겨진 보물 같은 건축 작품 속에서의 하룻밤.<br>밤하늘에 쏟아지는 별빛과 바람, 풀벌레 소리 속에 잠들고 새들의 지저귐 소리에 눈을 뜨는 아침</div><div class="txt2">자연과 맞닿아 있는 제주스테이 비우다는 이제껏 경험하지 못한 제주의 새로운 모습을 소개합니다. 
호스트의 세심한 배려와 자연 속 편안함을 통해 힐링의 시간을 기대해보세요.</div></div>
            </div>
            <!-- 내용 컨텐츠 1 (소개) //end -->


            <!-- 내용 컨텐츠 2 (스페셜) //start -->
            <div>
<div class="container_full fdetail_special" style="background-image:url(https://images.stayfolio.com/system/pictures/images/000/059/582/original/17c1776d630192fd9ca9f804c54913278d1637fa.jpg?1607070447);background-repeat:no-repeat;background-position:center;background-size:cover"><div class="container special_wrap"><div class="special_tit"><small>SPECIAL</small></div><div class="special_list"><li><i><img src="https://images.stayfolio.com/system/pictures/images/000/100/795/original/99949dd2d082f058ff7069370040079f43909e2d.png?1637026194" alt="special_img_1"></i><div class="tit">CAFE&amp;DINING</div><div class="desc">카페 앤 다이닝 채우다는 비우다의 사이트 속 복합문화공간 중 하나로 머무는 동안 세미조식이 서비스되는 공간입니다. 세미조식 서비스는 가벼운 스타일로 매일다른 데일리 샌드위치가 커피 또는 티와 함께 서비스됩니다.
Service Hour : 8:00-10:00 (last order 9:30)</div></li><li><i><img src="https://images.stayfolio.com/system/pictures/images/000/100/797/original/f99900523beba2df17e6378f5486a57ddf206667.png?1637026216" alt="special_img_1"></i><div class="tit">ART SPACE  NANUDA</div><div class="desc">문화예술을 품고 나누는 제주의 아트 플랫폼 ‘나누다’입니다. 다양한 분야의 예술가와 디자이너 그리고 문화예술기획자들이 함께 만들어나가는 아트 스페이스에서 함께 만들어가는 예술을 만나보세요.</div></li><li><i><img src="https://images.stayfolio.com/system/pictures/images/000/100/798/original/259f21a99468142aa10263ffd15f2ed1b293916c.png?1637026221" alt="special_img_1"></i><div class="tit">GARDEN &amp; FARM PUMEUN</div><div class="desc">가든 앤 팜 ‘품은'은 보다 나은 자연스러운 삶을 가꾸어 나가기 위한 가든 농장입니다.  산책로 &lt;느리게 걷기&gt;에서 비우며 걷고 걸으며 비워보세요. 제주의 햇빛과 바람이 키운 허브들이 가득한 정원에서 쉼을 누려보세요.
</div></li></div></div></div>
            </div>
            <!-- 내용 컨텐츠 2 (스페셜) //end -->


            <!-- 내용 컨텐츠 3 (구글맵) //start -->
            <div class="fdetail_map">
                <div class="map_tit">
                    <div class="title">
                        <p>HELLO.</p>
                        <p>제주스테이<br />비우다</p>
                    </div>
                    <div class="desc">
                        <p>제주특별자치도 서귀포시 색달중앙로121번길 45</p>
                        <p>064-739-5003</p>
                        <p>saida600@naver.com</p>
                    </div>
                </div>

<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d3336.0520619523004!2d126.40986869311523!3d33.265129320998064!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xc627781fed330689!2z7KCc7KO87Iqk7YWM7J2067mE7Jqw64uk!5e0!3m2!1sko!2skr!4v1667194481471!5m2!1sko!2skr" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
            <!-- 내용 컨텐츠 3 (구글맵) //end -->
        </div>

    </div>
    <!-- 숙소 상세정보 //START -->





    <!-- 숙소 안내사항 //START -->
    <div class="sv-caution">
        <div class="container">
            <div class="faq_tit">
                <div class="left">안내사항</div>
                <div class="right">숙소 이용에 대한 상세한 안내를 확인해 보세요.</div>
            </div>

            <div class="faq_cont">
                <ul class="left tab_btn">
                    <li class="active">예약 안내</li>
                    <li class="">이용 안내</li>
                    <li class="">환불규정</li>
                </ul>

                <div class="right tab_cont">
                    
                </div>
            </div>
        </div>
    </div>
    <!-- 숙소 안내사항 //START -->

</div>




<jsp:include page="../layout/layout_footer.jsp" />