<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../layout/layout_header_popup.jsp" />

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="dto" value="${qna}" />
<c:set var="qList" value="${List}" />


<style type="text/css">body { padding: 0 30px !important; }</style>
<div class="d-flex justify-content flex-wrap flex-md-nowrap align-items-center pt-4 pb-2 mb-4 border-bottom">
    <h2>문의글 상세 정보</h2>
    <small>일대일 문의글의 정보를 확인 할 수 있습니다.</small>
</div>



<div class="view-form">
    <!-- 내용 //START -->
    <div class="row vf-body">
        <div class="col-lg mb-4">
        <form method="post" action="<%=request.getContextPath() %>/admin/memberModifyOk.do" onsubmit="return join_check();">
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
                        	<select name="bbs_status" class="form-select">
                        		<option value="ing" class="text-danger">처리중</option>
                        		<option value="done" class="text-success">완료</option>
                        		<option value="send" class="text-primary">대기</option>
                        	</select>
 							<a href="<%=request.getContextPath()%>/admin/qnaModifyOk.do?no=${dto.bbs_no}" class="btn btn-sm btn-outline-success m-1">수정</a>
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
    <!-- 문의자 정보 //END -->


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
                        <td colspan="3">${dto.bbs_title}</td>
                    </tr>
                    <tr> 
                        <th>문의내용</th>
                        <td colspan="3">${dto.bbs_content}</td>
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
    <!-- 문의글 정보 //END -->
	
	
	
	
	
	
	
	
    <!-- 답글 내역 //START -->
    <div class="row vf-article">
        <div class="col-lg mb-4">
            <div class="card input-form">
                <div class="card-body p-4">
                    <h4>댓글 목록</h4>
                    <table class="table-form mt-2">
                        <colgroup>
                            <col width="8%" />
                            <col />
                            <col width="15%" />
                            <col width="10%" />
                            <col width="25%" />
                        </colgroup>

                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>내용</th>
                                <th>작성자</th>
                                <th>작성일자</th>
                                <th>기능</th>
                            </tr>
                        </thead>

                        <tbody>
                            <c:choose>
                            <c:when test="${!empty qList }">
                            <c:forEach items="${qList}" var="qdto">
                            <c:set var="comment_qnano" value="${qdto.comment_qnano}"/>
                            <tr>
                                <td class="text-center">${qdto.comment_no}</td>
                                <td class="text-left">${qdto.comment_content}</td>
                                <td class="text-center">
	                                <p><b>${qdto.comment_writer_name}</b></p>
	                				<p class="eng">(${qdto.comment_writer_id})</p>
                                </td>
                                <td class="text-center">${qdto.comment_date.substring(0, 10)}<br />${qdto.comment_date.substring(11)}</td>
                                <td class="text-center">
                                	<a href="<%=request.getContextPath()%>/admin/qnaCommentModify.do?no=${qdto.comment_no}" class="btn btn-sm btn-outline-primary m-1">수정</a>
                    				<a href="<%=request.getContextPath()%>/admin/qnaCommentDeleteOk.do?no=${dqdto.comment_no}" class="btn btn-sm btn-outline-danger m-1" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
                                </td>
                            </tr>
                            </c:forEach>
                            </c:when>
                
                            <c:otherwise>
                            <tr>
                                <td colspan="5" class="nodata border-bottom-0">댓글이 없습니다.</td>
                            </tr>
                            </c:otherwise>
                            </c:choose>
        					
                         </tbody>
                    </table>
                    
                    
                     <form name="write_form" method="post" action="<%=request.getContextPath() %>/admin/qnaCommentOk.do?no=${comment_qnano}">
                   		<%-- 이름, 아이디, 비밀번호 임시로 받음. --%>
                   		<input type="hidden" name="comment_writer_name" value="rock" />
						<input type="hidden" name="comment_writer_id" value="admin1234" />
						<input type="hidden" name="comment_writer_pw" value="1234" />
                     <table class="table-form mt-2">
                     <tbody>
					    <tr> 
					        <th>답변 내용</th>										
							<td colspan="3"> 
								<textarea name="comment_content" cols="20" rows="4" class="form-control" ></textarea></td>
                            <td class="text-center">
                                <button type="submit" class="btn btn-default btn-primary mx-1"><i class="fa fa-pencil"></i>추가</button>
                            </td>
					    </tr>
					</tbody>    
			   		</table>
			   		</form>	
			   		
			   		
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



<jsp:include page="../layout/layout_footer.jsp" />