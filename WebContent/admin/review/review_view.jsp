<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../layout/layout_header_popup.jsp" />

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="dto" value="${member}" />


<c:if test="${empty dto}"><script>alert('존재하지 리뷰입니다.'); window.close();</script></c:if>
<style type="text/css">body { padding: 0 30px !important; }</style>
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
					
					<div>
	                    <h2 class="text-muted"> 
	                    	<i class="fa fa-home " aria-hidden="true"></i>${dto.review_stayname}
	                    	<span> (${dto.review_roomname})</span>
	                   	</h2>
					</div>
					
                    <div class="d-flex py-2 border-bottom vfb-info">
                        <div class="col text-left">
                        	<i class="fa fa-user text-primary" aria-hidden="true"></i> <b class="text-primary">작성자 </b><b>: ${dto.review_name} &nbsp; &nbsp;</b>  
                        	<b class="text-primary"> ID </b><b>: ${dto.review_id}</b>
                        </div>

                        <div class="col text-right">
                        	<i class="icon-calendar"></i> 등록일 : ${dto.review_date}
                        </div>
                    </div>

                    <div class="d-flex py-2 border-bottom vfb-info">
                        <div class="col text-left">
                        	<b> 세부 평점 : 접근성</b> : ${dto.review_point1} / <b>서비스</b> : ${dto.review_point2} / <b>객실시설</b> : ${dto.review_point3} / <b>부대시설</b> : ${dto.review_point4} / <b>식음료</b> : ${dto.review_point5} / <b>만족도</b> : ${dto.review_point6}
                        </div>

                        <div class="col text-right">
                        	<div class="pl-3 text-danger"><b>합계 평점 : ${dto.review_point_total}점</b></div>
                        </div>
                    </div>
                    

                    
                    <div class="d-flex py-2 border-bottom vfb-info ">   
		              	<div> <span class="h4 text-primary">리뷰 내용</span> <br>
		              		${dto.review_content}
		                </div>
                    </div>

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
        <button type="button" class="btn btn-outline-secondary" onclick="window.print();"><i class="fa fa-print"></i> 인쇄하기</button>
        <button type="button" class="btn btn-secondary ml-2" onclick="window.close();"><i class="fa fa-times"></i> 창닫기</button>
    </div>
    <!-- 버튼 //END -->
</div>



<jsp:include page="../layout/layout_footer.jsp" />