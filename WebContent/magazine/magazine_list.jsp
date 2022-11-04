<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<% long time = System.currentTimeMillis(); %>
<jsp:include page="../layout/layout_header.jsp" />
<script type="text/javascript">$("#nav-magazine").addClass("now");</script>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/asset/css/magazine.css?<%=time%>" />
<script language="javascript" src="<%=request.getContextPath()%>/asset/js/magazine.js?<%=time%>"></script>
<c:set var="magazine" value="${ magazineList }"/>


<div class="container page-title">
    <h2>JOURNAL</h2>
    <h4>스테이:키의 관점으로 스테이를 조명합니다.</h4>
</div>

<div class="container-wide">

    <div class="container list-container">
        <ul class="journal-list"> 
        <c:if test="${ !empty magazine }">
            <c:forEach items="${ magazine }" var="mgz">
                <li class="journal-box">
                    <a href="<%=request.getContextPath()%>/magazineView.do?bbs_no=${mgz.bbs_no }">
                        <img src="<%=request.getContextPath()%>${mgz.bbs_top_img}" />
                        <div class="journal-info">
                            <p class="name"><c:forTokens items="${ mgz.bbs_title }" delims="<" var="desc" begin="0" end="0">${ desc }</c:forTokens></p>
                            <p class="more">Read more</p>
                        </div>
                    </a>
                </li>
            </c:forEach>  
         </c:if>
        </ul>
    </div>
${map.pagingWrite}
</div>



<jsp:include page="../layout/layout_footer.jsp" />