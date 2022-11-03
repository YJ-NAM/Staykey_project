<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../layout/layout_header.jsp" />
<jsp:include page="../mypage/mypage_header.jsp" />

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="dto" value="${qna}" />
<c:set var="qList" value="${List}" />

<script type="text/javascript">$("#mymenu-qna").addClass("now");</script>



<div class="qna-view">


    <!-- 내용 //START -->
    <div class="row vf-body">
        <div class="col-lg mb-4">
        <form action="<%=request.getContextPath()%>/admin/qnaModifyOk.do?no=${dto.bbs_no}" method="post">
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
		                	<c:if test="${dto.bbs_status == 'send'}"><span class="text-primary">답변 대기중</span></c:if>
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
            </form>
        </div>
    </div>
    <!-- 내용 //END -->
    


    <!-- 문의글 정보 //START -->
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
                        <th>제목</th>
                        <td colspan="3">${dto.bbs_title}</td>
                    </tr>
                    <tr> 
                        <th>내용</th>
                        <td colspan="3" >${dto.bbs_content}</td>
                    </tr>
                    <tr>
                        <th>첨부파일</th>
                        <c:if test="${empty dto.bbs_file1 && empty dto.bbs_file2}"><td colspan="3" class="text-primary">파일 없음</td></c:if>
                        <c:if test="${!empty dto.bbs_file1 || !empty dto.bbs_file2}">
                        <td colspan="2">
							<img src="<%=request.getContextPath()%>${dto.bbs_file1}" style="max-width: 250px;" alt="" />
							<img src="<%=request.getContextPath()%>${dto.bbs_file2}" style="max-width: 250px;" alt="" />
                        </td>
                        </c:if>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <!-- 문의글 정보 //END -->
	
	
	
	
	
	
	
	
    <!-- 답글 내역 //START -->
    <div class="row vf-article">
        <div class="col-lg mb-4">
            <div class="card input-form">
                <div class="card-body p-4">
                    <h4>댓글 목록</h4>
                    <table class="table-form mt-2">
                        <colgroup>
                            <col width="18%" />
                            <col />
                            <col width="15%" />
                            <col width="30%" />
                        </colgroup>	

                        <thead>
                            <tr>
                                <th>작성자</th>
                                <th>내용</th>
                                <th>작성일</th>
                                <th>기능</th>
                            </tr>
                        </thead>

                        <tbody>
                            <c:choose>
                            <c:when test="${!empty qList }">
                            <c:forEach items="${qList}" var="qdto">
                            <c:set var="comment_qnano" value="${qdto.comment_qnano}"/>
                            <tr>
                                <td class="text-center"><b>${qdto.comment_writer_name}</b></td>
                                <td class="text-left">${qdto.comment_content}</td>
                                <td class="text-center">${qdto.comment_date}</td>

	                        <c:if test="${dto.bbs_status == 'send'}">
	                           	<td class="text-center">
	                    			<a href="<%=request.getContextPath()%>/mypageQnaDelete.do?no=${qdto.comment_no}&qna_no=${dto.bbs_no}" class="btn btn-sm btn-outline-danger m-1" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
	                    			<a href="<%=request.getContextPath()%>/mypageQnaModify.do?no=${qdto.comment_no}&qna_no=${dto.bbs_no}" class="btn btn-sm btn-outline-danger m-1">수정</a>
	                			</td>
							</c:if>	 
                            </tr>
                            </c:forEach>
                            </c:when>
                
                            <c:otherwise>
                            <tr>
                                <td colspan="4" class="nodata border-bottom-0">답변이 없습니다.</td>
                            </tr>
                            </c:otherwise>
                            </c:choose>
        					
                         </tbody>
                    </table>
                    <c:if test="${dto.bbs_status == 'ing' || dto.bbs_status == 'send'}">
                     <form name="write_form" method="post" action="<%=request.getContextPath() %>/mypageQnaCommentOk.do?no=${comment_qnano}">
                     <table class="table-form mt-2">
                     	<colgroup>
                            <col width="18%" />
                            <col />
                            <col width="25%" />
                     	</colgroup>
					    <tr> 
					        <th>댓글 내용</th>										
							<td> 
								<textarea name="comment_content" cols="20" rows="3" class="form-control" ></textarea></td>
                            <td class="text-center">
                                <button type="submit" class="btn btn-lg btn-primary w-100 h-100"><i class="fa fa-pencil"></i>쓰기</button>
                            </td>
					    </tr> 
			   		</table>
			   		</form>	
			   		</c:if>
			   		
                </div>
            </div>
        </div>
    </div>

  
	



    <!-- 버튼 //START -->
    <div class="d-flex justify-content-center mb-3">
        <button type="button" class="btn btn-outline-secondary" onclick="window.print();"><i class="fa fa-print"></i> 인쇄하기</button>
        <button type="button" class="btn btn-secondary ml-2" onclick="window.close();"><i class="fa fa-times"></i> 창닫기</button>
    </div>
    <!-- 버튼 //END -->

</div>



<jsp:include page="../mypage/mypage_footer.jsp" />
<jsp:include page="../layout/layout_footer.jsp" />