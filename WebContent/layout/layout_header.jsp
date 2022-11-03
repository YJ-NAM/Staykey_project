<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% long time = System.currentTimeMillis(); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>스테이키 (StayKey)</title>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Content-Script-Type" content="text/javascript" />
    <meta http-equiv="Content-Style-Type" content="text/css" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <meta name="robots" content="noindex">

    <link rel="shortcut icon" href="<%=request.getContextPath()%>/asset/images/favicon.ico" type="image/x-icon" />
    <link rel="icon" href="<%=request.getContextPath()%>/asset/images/favicon.ico" type="image/x-icon" />
 
    <link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/asset/images/favicon_72x72.png" />
    <link rel="apple-touch-icon-precomposed" sizes="57x57" href="<%=request.getContextPath()%>/asset/images/favicon_57x57.png" />
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="<%=request.getContextPath()%>/asset/images/favicon_72x72.png" />
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="<%=request.getContextPath()%>/asset/images/favicon_114x114.png" />
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="<%=request.getContextPath()%>/asset/images/favicon_144x144.png" />


    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />


    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/asset/css/jquery-ui.min.css" />
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/asset/css/bootstrap.min.css" />
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/asset/css/font_awesome.css" />
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/asset/css/simple-line-icons.css" />
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/asset/css/swiper.min.css" />
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/asset/css/style.css?<%=time%>" />

    <script language="javascript" src="<%=request.getContextPath()%>/asset/js/jquery-ui.min.js"></script>
    <script language="javascript" src="<%=request.getContextPath()%>/asset/js/bootstrap.min.js"></script>
    <script language="javascript" src="<%=request.getContextPath()%>/asset/js/swiper.min.js"></script>
    <script language="javascript" src="<%=request.getContextPath()%>/asset/js/script.js?<%=time%>"></script>
</head>
<body>
    <!-- #ajax-loader //START -->
    <div id="ajax-loader">
        <div class="stripes">
            <div class="rect1"></div>
            <div class="rect2"></div>
            <div class="rect3"></div>
            <div class="rect4"></div>
            <div class="rect5"></div>
        </div>
        <div class="bg"></div>
    </div>
    <!-- #ajax-loader //END -->



    <!-- header //START -->
    <header class="header">
        <div class="h-wrap">
            <div class="h-logo flex-grow-1">
                <h2><a href="<%=request.getContextPath()%>"><img src="<%=request.getContextPath()%>/asset/images/staykey_logo.png" alt="StayKey" /></a></h2>
            </div>


            <div class="h-location flex-grow-1">
                <button type="button"><i class="icon-location-pin"></i>어디로 갈까요?</button>
                <button type="button"><i class="icon-calendar"></i>언제 떠날까요?</button>
            </div>


            <div class="h-gnb">
                <div class="h-nav">
                    <ul class="h-menu">
                        <li><a href="<%=request.getContextPath()%>/stayList.do" id="nav-stay">살펴보기</a></li>
                        <li><a href="<%=request.getContextPath()%>/eventList.do" id="nav-event">함께하기</a></li>
                        <li><a href="<%=request.getContextPath()%>/magazineList.do" id="nav-magazine">읽어보기</a></li>
                    </ul>
                </div>

                <div class="menu-etc">
                    <c:choose>
                        <c:when test="${!empty login_id}">
                        <a href="<%=request.getContextPath()%>/mypageReservList.do" class="mypage-link">MyPage</a>
                        <ul class="mypage-menu">
                            <li><a href="<%=request.getContextPath()%>/mypageReservList.do">예약 정보</a></li>
                            <li><a href="<%=request.getContextPath()%>/mypageWish.do">관심 스테이</a></li>
                            <li><a href="<%=request.getContextPath()%>/mypageQnaList.do">1:1 문의</a></li>
                            <li><a href="<%=request.getContextPath()%>/mypageInfo.do">회원정보 수정</a></li>
                        </ul>
                        <a href="<%=request.getContextPath()%>/memberLogout.do" onClick="return confirm('로그아웃 하시겠습니까?');">LogOut</a>
                        </c:when>
                        <c:otherwise>
                        <a href="<%=request.getContextPath()%>/memberLogin.do">Log-in</a>
                        <a href="<%=request.getContextPath()%>/memberJoin.do">Join</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </header>
    <!-- header //END -->



    <!-- #container //START -->
    <main role="main" id="container">


