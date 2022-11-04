<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../layout/layout_header.jsp" />
<jsp:include page="../mypage/mypage_header.jsp" />

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="dto" value="${comment}" />
<c:set var="qna_no" value="${qna_no}" />

<script type="text/javascript">$("#mymenu-qna").addClass("now");</script>



<div class="qna-write">
    <form name="write_form" method="post" action="<%=request.getContextPath() %>/mypageQnaModifyOk.do" onsubmit="return join_check();">
	    <input type="hidden" name="qna_no" value="${qna_no}" />
	    <input type="hidden" name="comment_no" value="${dto.comment_no}" />
	    <table class="table-form mt-3">
	        <colgroup>
	            <col width="16%" />
	            <col width="34%" />
	            <col width="16%" />
	            <col />
	        </colgroup>
	        
        <tr>
            <th>요청 사항</th>
            <td colspan="3"><textarea name="comment_content" cols="20" rows="4" class="form-control">${dto.comment_content}</textarea></td>
        </tr>
	        
    	</table>



	    <div class="gw-button">
	        <div class="gwb-wrap">
	            <div class="gwb-left"></div>
	
	            <div class="gwb-center">
	                <button type="button" class="btn btn-lg btn-outline-secondary mx-1" onclick="history.back();"><i class="fa fa-bars"></i> 취소하기</button>
	                <button type="submit" class="btn btn-lg btn-success mx-1"><i class="fa fa-save"></i> 수정하기</button>
	            </div>
	
	            <div class="gwb-right"></div>
	        </div>
	    </div>
    </form>
</div>



<jsp:include page="../mypage/mypage_footer.jsp" />
<jsp:include page="../layout/layout_footer.jsp" />