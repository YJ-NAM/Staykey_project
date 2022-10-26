<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../layout/layout_header.jsp" />

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="dto" value="${member}" />


<script type="text/javascript">$("#nav-review").addClass("now");</script>
<div class="d-flex justify-content flex-wrap flex-md-nowrap align-items-center pt-4 pb-2 mb-4 border-bottom">
    <h2>후기 상세 정보</h2>
    <small>등록된 후기의 정보를 확인 할 수 있습니다.</small>
</div>



<div class="view-form">
    <!-- 내용 //START -->
    <div class="row vf-body">
        <div class="col-lg mb-4">
            <div class="card">
                <div class="card-body p-4">

                    <h2>
                    	<p><i class="fa fa-home" aria-hidden="true"></i>${dto.review_stayname}</p>
                    	<span>${dto.review_roomname}</span>
                   	</h2>

                    <div class="d-flex py-2 border-bottom vfb-info">
                        <div class="col text-left">
                        	<i class="fa fa-user" aria-hidden="true"></i> ${dto.review_name}
                        	Id : ${dto.review_id}
                        </div>

                        <div class="col text-right">
                        	<i class="icon-calendar"></i> 등록일 : ${dto.review_date}
                        </div>
                    </div>

                    <div class="d-flex py-2 border-bottom vfb-info">
                        <div class="col text-left">
                        	<i class="icon-magnifier"></i><b>평점 : ${dto.review_point_total}점</b>
                        </div>

                        <div class="col text-right">
                        	<i class="fa fa-bar-chart" aria-hidden="true"></i> 세부 평점 : <b>접근성</b> : ${dto.review_point1}점, <b>서비스</b> : ${dto.review_point2}점, <b>객실시설</b> : ${dto.review_point3}점 <b>부대시설</b> : ${dto.review_point4}점, <b>식음료</b> : ${dto.review_point5}점, <b>만족도</b> : ${dto.review_point6}점
                        </div>
                    </div>
                    
                                       
                    <h2 class="col text-right">          	
    	                <p>리뷰 내용</p>
	                    <span>${dto.review_content}</span>
                    </h2>

					<c:if test="${!empty dto.review_file}">
                    <div class="d-flex py-3 border-bottom">
                        <div class="col">
                        	<ul class="stay-view-photo">
                        		<li><img src="<%=request.getContextPath()%>${dto.review_file}" style="max-width: 400px;" alt="" /></li>
                        	</ul>
                        </div>
                    </div>
                    </c:if>
						
                </div>
            </div>
        </div>
    </div>
    <!-- 내용 //END -->


    <!-- 버튼 //START -->
    <div class="d-flex justify-content-center mb-4">
        <a href="<%=request.getContextPath()%>/admin/reviewDeleteOk.do?id=${dto.review_no}" class="btn btn-danger" onclick="return confirm('정말 삭제하시겠습니까?\n되돌릴 수 없습니다.');"><i class="fa fa-trash-o"></i> 삭제하기</a>
        <a href="<%=request.getContextPath()%>/admin/reviewModify.do?id=${dto.review_no}" class="btn btn-primary mx-2"><i class="fa fa-pencil"></i> 수정하기</a>
        <a href="javascript:history.back();" class="btn btn-secondary"><i class="fa fa-bars"></i> 목록보기</a>
    </div>
    <!-- 버튼 //END -->
</div>



<jsp:include page="../layout/layout_footer.jsp" />