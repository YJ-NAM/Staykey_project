<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../layout/layout_header_popup.jsp" />

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="dto" value="${qna}" />

<style type="text/css">body { padding: 0 30px !important; }</style>
<div class="d-flex justify-content flex-wrap flex-md-nowrap align-items-center pt-4 pb-2 mb-4 border-bottom">
    <h2>문의글 상세 정보</h2>
    <small>일대일 문의글의 정보를 확인 할 수 있습니다.</small>
</div>



<div class="view-form">
    <!-- 내용 //START -->
    <div class="row vf-body">
        <div class="col-lg mb-4">
            <table class="table-form w-100">
                <colgroup>
                    <col width="17%" />
                    <col width="32%" />
                    <col width="17%" />
                    <col />
                </colgroup>

                <tbody>
                    <tr>
                        <th>상태</th>
                        <td colspan="3">
	                        <c:if test="${dto.bbs_status == 'done'}"><span class="text-danger">답변 완료</span></c:if>
		                	<c:if test="${dto.bbs_status == 'ing'}"><span class="text-success">답변 처리중</span></c:if>
		                	<c:if test="${dto.bbs_status == 'send'}"><span class="text-primary">답변 대기</span></c:if>
                        </td>
                    </tr>
                    <tr>
                        <th>댓글갯수</th>
                        <td class="eng">${dto.bbs_comment}</td>
                        <th>조회수</th>
                        <td class="eng">${dto.bbs_hit}</td>
                    </tr>
                    <tr>
                        <th>작성일자</th>
                        <td colspan="3">${dto.bbs_date}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <!-- 내용 //END -->
    
    
    
    

    <!-- 문의자 정보 //START -->
    <div class="row vf-body">
        <div class="col-lg mb-4">
            <h4>문의자 정보</h4>

            <table class="table-form w-100">
                <colgroup>
                    <col width="17%" />
                    <col width="32%" />
                    <col width="17%" />
                    <col />
                </colgroup>

                <tbody>
                    <tr>
                        <th>이름</th>
                        <td class="eng">${dto.bbs_writer_name}</td>
                        <th>아이디</th>
                        <td class="eng">${dto.bbs_writer_id}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <!-- 예약자 정보 //END -->





    <!-- 문의글 정보 //START -->
    <div class="row vf-body">
        <div class="col-lg mb-4">
            <h4>문의 정보</h4>

            <table class="table-form w-100">
                <colgroup>
                    <col width="17%" />
                    <col width="32%" />
                    <col width="17%" />
                    <col />
                </colgroup>

                <tbody>
                    <tr>
                        <th>문의제목</th>
                        <td class="eng">${dto.bbs_title}</td>
                        <th>문의내용</th>
                        <td class="eng">${dto.bbs_content}</td>
                    </tr>
                    <tr>
                        <th>첨부파일</th>
                        <td colspan="3">
							<img src="<%=request.getContextPath()%>${dto.bbs_file1}" style="max-width: 400px;" alt="" />
							<img src="<%=request.getContextPath()%>${dto.bbs_file2}" style="max-width: 400px;" alt="" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <!-- 예약자 정보 //END -->
	
	
    <!-- 답글 내역 //START -->
<%--     <div class="row vf-article">
        <div class="col-lg mb-4">
            <div class="card input-form">
                <div class="card-body p-4">
                    <h4>답글 내역</h4>
                    <table class="table-form mt-2">
                        <colgroup>
                            <col width="8%" />
                            <col width="20%" />
                            <col />
                            <col width="20%" />
                        </colgroup>

                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>금액</th>
                                <th>내용</th>
                                <th>일자</th>
                            </tr>
                        </thead>

                        <tbody>
                            <c:choose>
                            <c:when test="${!empty pList }">
                            <c:forEach items="${pList}" var="pdto">
                            <tr>
                                <td class="text-center">${pdto.getPoint_no()}</td>
                                <td class="text-center">
                                    <c:choose>
                                    <c:when test="${pdto.getPoint_type() == 'plus'}"><span class="text-primary">+ ${pdto.getPoint_value()}</span></c:when>
                                    <c:otherwise><span class="text-danger">- ${pdto.getPoint_value()}</span></c:otherwise>
                                    </c:choose>
                                </td>
                                <td class="text-center">${pdto.getPoint_content()}</td>
                                <td class="text-center">${pdto.getPoint_date()}</td>
                            </tr>
                            </c:forEach>
                            </c:when>
                
                            <c:otherwise>
                            <tr>
                                <td colspan="4" class="nodata border-bottom-0">적립금 내역이 없습니다.</td>
                            </tr>
                            </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
 --%>    <!-- 답글목록 //END -->
	
	
	



    <!-- 버튼 //START -->
    <div class="d-flex justify-content-center mb-3">
        <a href="<%=request.getContextPath()%>/admin/reviewModify.do?id=${dto.review_no}" class="btn btn-outline-primary">답변추가</a>
        <a href="<%=request.getContextPath()%>/admin/reviewModify.do?id=${dto.review_no}" class="btn btn-outline-primary">답변수정</a>
        <a href="<%=request.getContextPath()%>/admin/reviewDeleteOk.do?id=${dto.review_no}" class="btn btn-outline-danger ml-2" onclick="return confirm('정말 삭제하시겠습니까?');">답변삭제</a>
    
        <button type="button" class="btn btn-outline-secondary" onclick="window.print();"><i class="fa fa-print"></i>답변완료</button>
        <button type="button" class="btn btn-outline-secondary ml-2" onclick="window.print();"><i class="fa fa-print"></i> 답변수정</button>
        <button type="button" class="btn btn-secondary ml-2" onclick="window.close();"><i class="fa fa-times"></i> 창닫기</button>
    </div>
    <!-- 버튼 //END -->

</div>



<jsp:include page="../layout/layout_footer.jsp" />