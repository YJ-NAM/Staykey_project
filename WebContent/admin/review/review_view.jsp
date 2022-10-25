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

                    <table class="table-form">
                        <colgroup>
                            <col width="16%" />
                            <col width="34%" />
                            <col width="16%" />
                            <col width=""/>
                        </colgroup>

                       


                        <tr>
                            <th>숙소명</th>
                            <td colspan="1"> <h5>${dto.review_stayname}</h5></td>
                            <td colspan="3">(${dto.review_roomname})</td>
                        </tr>
                        
                        <tr>
                            <td colspan="4" class="space" nowrap="nowrap"></td>
                        </tr>
                        						
                        <tr>
                            <th>작성자 이름</th>
                            <td>${dto.review_name}</td>
                            <th>작성자 아이디</th>
                            <td>${dto.review_id}</td>
                        </tr>
                        
                        <tr>
                            <td colspan="4" class="space" nowrap="nowrap"></td>
                        </tr>
                        
                        <tr>
                            <th>평점</th>
                            <td colspan="1"><b>${dto.review_point_total}점</b></td>

							<th>세부 평점</th>
			                <td colspan="3">
			              		 <p><b>접근성</b> : ${dto.review_point1}점, <b>서비스</b> : ${dto.review_point2}점, <b>객실시설</b> : ${dto.review_point3}점</p>
			              		 <p><b>부대시설</b> : ${dto.review_point4}점, <b>식음료</b> : ${dto.review_point5}점, <b>만족도</b> : ${dto.review_point6}점</p>
			                </td>
                        </tr>
                        
                        <tr> 
							<th>리뷰 내용</th>
                        	<td colspan="4">${dto.review_content }</td>
                        </tr>
						
						<c:if test="${!empty dto.review_file}">
                        <tr>
                            <th>리뷰 사진</th>
                            <td colspan="4"><img src="<%=request.getContextPath()%>${dto.review_file}" style="max-width: 400px;" alt="" /></td>
                        </tr>
                       	</c:if>
                       	
                      
                        
                    </table>

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