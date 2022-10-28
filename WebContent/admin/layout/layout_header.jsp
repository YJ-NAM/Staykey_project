<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% long time = System.currentTimeMillis(); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>관리자 모드 :: 스테이키 (StayKey)</title>

    <meta http-equiv="CONTENT-TYPE" content="text/html;charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Content-Script-Type" content="text/javascript">
    <meta http-equiv="Content-Style-Type" content="text/css">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=1200">

    <meta name="robots" content="noindex">

    <link rel="shortcut icon" href="<%=request.getContextPath()%>/asset/images/favicon.ico" type="image/x-icon" />
    <link rel="icon" href="<%=request.getContextPath()%>/asset/images/favicon.ico" type="image/x-icon" />
 
    <link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/asset/images/favicon_72x72.png" />
    <link rel="apple-touch-icon-precomposed" sizes="57x57" href="<%=request.getContextPath()%>/asset/images/favicon_57x57.png" />
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="<%=request.getContextPath()%>/asset/images/favicon_72x72.png" />
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="<%=request.getContextPath()%>/asset/images/favicon_114x114.png" />
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="<%=request.getContextPath()%>/asset/images/favicon_144x144.png" />

    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/admin/asset/css/jquery-ui.min.css" />
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/admin/asset/css/bootstrap-reboot.min.css" />
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/admin/asset/css/bootstrap.min.css" />
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/admin/asset/css/bootstrap-utilities.min.css" />
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/admin/asset/css/bootstrap-grid.min.css" />
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/admin/asset/css/bootstrap-colorpicker.css?<%=time%>" />
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/admin/asset/css/font_awesome.css" />
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/admin/asset/css/simple-line-icons.css" />
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/admin/asset/css/swiper.min.css" />
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/admin/asset/css/style.css?<%=time%>" />


    <script language="javascript" src="<%=request.getContextPath()%>/admin/asset/js/jquery-3.5.1.min.js"></script>
    <script language="javascript" src="<%=request.getContextPath()%>/admin/asset/js/jquery-ui.min.js"></script>
    <script language="javascript" src="<%=request.getContextPath()%>/admin/asset/js/bootstrap.min.js"></script>
    <script language="javascript" src="<%=request.getContextPath()%>/admin/asset/js/bootstrap.bundle.min.js"></script>
    <script language="javascript" src="<%=request.getContextPath()%>/admin/asset/js/bs-custom-file-input.min.js"></script>
    <script language="javascript" src="<%=request.getContextPath()%>/admin/asset/js/bootstrap-colorpicker.min.js"></script>
    <script src="https://cdn.ckeditor.com/4.16.0/standard-all/ckeditor.js"></script>
    <script language="javascript" src="<%=request.getContextPath()%>/admin/asset/js/swiper.min.js"></script>
    <script language="javascript" src="<%=request.getContextPath()%>/admin/asset/js/script.js?<%=time%>"></script>
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



    <!-- #header // START -->
    <header class="fixed-top">
        <div class="container-xl top-info">
            <h1 class="mr-auto"><a href="<%=request.getContextPath()%>/admin/reservList.do"><img src="<%=request.getContextPath()%>/admin/asset/images/logo.png" alt="StayKey" /></a></h1>
            <a class="nav-link" href="<%=request.getContextPath()%>/" target="_blank"><i class="icon-globe"></i> 사이트보기</a>
            <a class="nav-link" href="<%=request.getContextPath()%>/memberLogout.do" onClick="return confirm('로그아웃 하시겠습니까?');"><i class="icon-power"></i> 로그아웃</a>
        </div>

        <div class="navbar navbar-expand-md navbar-dark bg-dark">
            <div class="container-xl">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsCont" aria-controls="navbarsCont" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarsCont">
                    <ul class="navbar-nav justify-content-between w-100">
                        <li id="nav-stay" class="nav-item px-3"><a class="nav-link" href="<%=request.getContextPath()%>/admin/stayList.do"><i class="icon-home"></i> 숙소관리</a><span class="tri"></span></li>
                        <li id="nav-reserv" class="nav-item px-3"><a class="nav-link" href="<%=request.getContextPath()%>/admin/reservList.do"><i class="icon-plane"></i> 예약관리</a><span class="tri"></span></li>
                        <li id="nav-member" class="nav-item px-3"><a class="nav-link" href="<%=request.getContextPath()%>/admin/memberList.do"><i class="icon-people"></i> 회원관리</a><span class="tri"></span></li>
                        <li id="nav-review" class="nav-item px-3"><a class="nav-link" href="<%=request.getContextPath()%>/admin/reviewList.do"><i class="icon-note"></i> 후기관리</a><span class="tri"></span></li>
                        <li id="nav-qna" class="nav-item px-3"><a class="nav-link" href="<%=request.getContextPath()%>/admin/qnaList.do"><i class="icon-speech"></i> 문의관리</a><span class="tri"></span></li>
                        <li id="nav-magazine" class="nav-item px-3"><a class="nav-link" href="<%=request.getContextPath()%>/admin/magazineList.do"><i class="icon-book-open"></i> 매거진관리</a><span class="tri"></span></li>
                        <li id="nav-event" class="nav-item px-3"><a class="nav-link" href="<%=request.getContextPath()%>/admin/eventList.do"><i class="icon-event"></i> 이벤트관리</a><span class="tri"></span></li>
                    </ul>
                </div>
            </div>
        </div>
    </header>
    <!-- #header // END -->



    <!-- #contents // START -->
    <main role="main" class="container">


