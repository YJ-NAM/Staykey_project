<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% long time = System.currentTimeMillis(); %>
<jsp:include page="../layout/layout_header.jsp" />
<script type="text/javascript">$("#nav-magazine").addClass("now");</script>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/asset/css/magazine.css?<%=time%>" />
<script language="javascript" src="<%=request.getContextPath()%>/asset/js/magazine.js?<%=time%>"></script>



<div class="container page-title">
    <h2>JOURNAL</h2>
    <h4>스테이:키의 관점으로 스테이를 조명합니다.</h4>
</div>

<div class="container-wide">

    <div class="container list-container">
        <ul class="journal-list"> 
            <li class="journal-box">
                <a href="#">
                    <img src="https://images.stayfolio.com/system/pictures/images/000/149/873/large/e9cf0c73b1aef9bbfd106398604be0bb8f579b34.jpg?1666846469" alt="예이제"/>

                    <div class= "journal-info">
                        <p class="number">Chapter 1</p>
                        <p class="name">육지의 섬에서<br>완전한 자유를 얻다</p>
                        <p class="text">예이제</p>
                        <p class="more">Read more</p>
                    </div>
                </a>
            </li>


            <li class="journal-box">
                <a href="#">
                    <img src="https://images.stayfolio.com/system/pictures/images/000/145/826/large/bc815acc9623f367c7b010624d79c9828a7edecb.jpg?1664501604" alt="칠 드라이브인"/>
                    
                    <div class= "journal-info">
                        <p class="number">Chapter 2</p>
                        <p class="name">가능한 한 Chill하게<br>그러나 즐겁게</p>
                        <p class="text">칠 드라이브-인</p>
                        <p class="more">Read more</p>
                    </div>
                </a>
            </li>


            <li class="journal-box">
                <a href="#">
                    <img src="https://images.stayfolio.com/system/pictures/images/000/141/785/large/124b19d1039d240d2b5631d67de23672911d1dd9.jpg?1663121337" alt="웜댄콜드맨션"/>
                    
                    <div class= "journal-info">
                        <p class="number">Chapter 3</p>
                        <p class="name">한 척의 우주선 혹은<br>비일상의 궤도에 올라</p>
                        <p class="text">웜댄콜드맨션</p>
                        <p class="more">Read more</p>
                    </div>
                </a>
            </li>


            <li class="journal-box">
                <a href="#">
                    <img src="https://images.stayfolio.com/system/pictures/images/000/135/519/large/c780e088500ac3ffea85a0dc6e2685bc40565312.jpg?1660610871" alt="서리애"/>
                    
                    <div class= "journal-info">
                        <p class="number">Chapter 4</p>
                        <p class="name">마음에 서리는<br>시간의 기억들</p>
                        <p class="text">서리애</p>
                        <p class="more">Read more</p>
                    </div>
                </a>
            </li>
        </ul>
    </div>

</div>


<jsp:include page="../layout/layout_footer.jsp" />