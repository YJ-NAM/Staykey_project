<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<jsp:include page="../layout/layout_header.jsp" />

<c:set var="dto" value="${ magazineModify }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<script type="text/javascript">$("#nav-magazine").addClass("now");</script>
<div class="d-flex justify-content flex-wrap flex-md-nowrap align-items-center pt-4 pb-2 mb-4 border-bottom">
    <h2>매거진 수정</h2>
    <small>매거진을 수정 할 수 있습니다.</small>
</div>


    <!-- 내용 //START -->
<div class="pb100">
    <form name="modify_form" method="post" enctype="multipart/form-data" action="<%=request.getContextPath() %>/admin/magazineModifyOk.do">
    
    <input type="hidden" name="bbs_no" value="${dto.bbs_no }" />
    
    <table class="table-form mt-3">
   
        <colgroup>
            <col width="16%" />
            <col width="34%" />
            <col width="16%" />
            <col />
        </colgroup>
      

        <tr>
            <th>제목</th>
            <td colspan="3">
                <input type="text" name="mag_name" value="${dto.bbs_title }" required />
            </td>
        </tr>
        
        <tr>
            <td colspan="4" class="space" nowrap="nowrap"></td>
        </tr>
        
        <tr>
            <th>내용</th>
            <td colspan="3"><textarea name="mag_content" cols="80" rows="5">${dto.bbs_content }</textarea></td>
        </tr>

        <tr>
            <td colspan="4" class="space" nowrap="nowrap"></td>
        </tr>

        <tr>
            <th>위치/주소</th>
            <td colspan="3">
                <input type="text" name="stay_location" value="${ stayModify.stay_location }" maxlength="50" class="form-control d-inline w-20" required />
                <input type="text" name="stay_addr" value="${ stayModify.stay_addr }" maxlength="100" class="form-control d-inline w-70 ml-3" required />
            </td>
        </tr>
        <tr>
            <th>연락처</th>
            <td><input type="text" name="stay_phone" value="${ stayModify.stay_phone }" maxlength="15" class="form-control" required /></td>
            <th>이메일</th>
            <td><input type="text" name="stay_email" value="${ stayModify.stay_email }" maxlength="100" class="form-control" required /></td>
        </tr>

        <tr>
            <td colspan="4" class="space" nowrap="nowrap"></td>
        </tr>
        
        <tr>
            <th>숙소 사진 1</th>
            <td colspan="3">
			<c:if test="${ !empty stayModify.stay_file1 }">
				<p><img src="${ pageContext.request.contextPath }/${ stayModify.stay_file1 }" alt="" width="100px" height="100px"/></p>
           	</c:if>
           		<input type="file" name="stay_file1" class="form-control w-50" />
            </td>
        </tr>
        <tr>
            <th>숙소 사진 2</th>
            <td colspan="3">
			<c:if test="${ !empty stayModify.stay_file2 }">
				<p><img src="${ pageContext.request.contextPath }/${ stayModify.stay_file2 }" alt="" width="100px" height="100px"/></p>
           	</c:if>
           		<input type="file" name="stay_file2" class="form-control w-50" />
            </td>
        </tr>
        <tr>
            <th>숙소 사진 3</th>
            <td colspan="3">
			<c:if test="${ !empty stayModify.stay_file3 }">
				<p><img src="${ pageContext.request.contextPath }/${ stayModify.stay_file3 }" alt="" width="100px" height="100px"/></p>
           	</c:if>
           		<input type="file" name="stay_file3" class="form-control w-50" />
            </td>
        </tr>
        <tr>
            <th>숙소 사진 4</th>
            <td colspan="3">
			<c:if test="${ !empty stayModify.stay_file4 }">
				<p><img src="${ pageContext.request.contextPath }/${ stayModify.stay_file4 }" alt="" width="100px" height="100px"/></p>
           	</c:if>
           		<input type="file" name="stay_file4" class="form-control w-50" />
            </td>
        </tr>
        <tr>
            <th>숙소 사진 5</th>
            <td colspan="3">
			<c:if test="${ !empty stayModify.stay_file5 }">
				<p><img src="${ pageContext.request.contextPath }/${ stayModify.stay_file5 }" alt="" width="100px" height="100px"/></p>
           	</c:if>
           		<input type="file" name="stay_file5" class="form-control w-50" />
            </td>
        </tr>

        <tr>
            <td colspan="4" class="space" nowrap="nowrap"></td>
        </tr>



        <tr>
            <td colspan="4" class="space" nowrap="nowrap"></td>
        </tr>




        <tr>
            <td colspan="4" class="space" nowrap="nowrap"></td>
        </tr>

        <tr>
            <th>안내사항 1<br />(예약안내)</th>
            <td colspan="3"><textarea id="stay_info1" name="stay_info1" cols="80" rows="5">${ stayModify.stay_info1 }</textarea></td>
        </tr>

        <tr>
            <th>안내사항 2<br />(이용안내)</th>
            <td colspan="3"><textarea id="stay_info2" name="stay_info2" cols="80" rows="5">${ stayModify.stay_info2 }</textarea></td>
        </tr>

        <tr>
            <th>안내사항 3<br />(환불규정)</th>
            <td colspan="3"><textarea id="stay_info3" name="stay_info3" cols="80" rows="5">${ stayModify.stay_info3 }</textarea></td>
        </tr>

    </table>
    <script type="text/javascript">
    CKEDITOR.disableAutoInline = true;
    CKEDITOR.replace('stay_content1', { height: "250px" });
    CKEDITOR.replace('stay_content2', { height: "250px" });
    CKEDITOR.replace('stay_content3', { height: "250px" });
    CKEDITOR.replace('stay_info1', { height: "250px" });
    CKEDITOR.replace('stay_info2', { height: "250px" });
    CKEDITOR.replace('stay_info3', { height: "250px" });
    </script>



    <div class="gw-button">
        <div class="gwb-wrap">
            <div class="gwb-left"></div>

            <div class="gwb-center">
                <button type="button" class="btn btn-lg btn-outline-secondary mx-1" onclick="history.back();"><i class="fa fa-bars"></i> 목록보기</button>
                <button type="submit" class="btn btn-lg btn-primary mx-1"><i class="fa fa-pencil"></i> 등록하기</button>
            </div>

            <div class="gwb-right"></div>
        </div>
    </div>
    </form>
</div>




<jsp:include page="../layout/layout_footer.jsp" />


</body>
</html>