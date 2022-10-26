<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../layout/layout_header.jsp" />



<script type="text/javascript">$("#nav-magazine").addClass("now");</script>
<div class="d-flex justify-content flex-wrap flex-md-nowrap align-items-center pt-4 pb-2 mb-4 border-bottom">
    <h2>매거진 등록</h2>
    <small>매거진을 추가 할 수 있습니다.</small>
</div>




<div class="pb100">
    <form name="write_form" method="post" enctype="multipart/form-data" action="<%=request.getContextPath() %>/admin/magazineWriteOk.do">
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
                <input type="text" name="mag_title" value="" maxlength="50" class="form-control w-40" required />
            </td>
        </tr>
        
        <tr>
            <td colspan="4" class="space" nowrap="nowrap"></td>
        </tr>
        
         <tr>
            <th>내용</th>
            <td colspan="3"><textarea name="mag_content" cols="80" rows="5"></textarea></td>
        </tr>

        <tr>
            <td colspan="4" class="space" nowrap="nowrap"></td>
        </tr>



        <tr>
            <th>유튜브 주소</th>
                 <td colspan="3"><textarea name="mag_youtube" cols="80" rows="5"></textarea></td>
        </tr>
        
    
    
    	<tr>
            <td colspan="4" class="space" nowrap="nowrap"></td>
        </tr>
    
    
    	<tr>
            <th>파일 1</th>
            <td colspan="3"><input type="file" name="mag_file1" class="form-control w-50" /></td>
        </tr>
    
    	<tr>
            <th>파일 2</th>
            <td colspan="3"><input type="file" name="mag_file2" class="form-control w-50" /></td>
        </tr>
    
    	<tr>
            <th>파일 3</th>
            <td colspan="3"><input type="file" name="mag_file3" class="form-control w-50" /></td>
        </tr>
    
    	<tr>
            <th>파일 4</th>
            <td colspan="3"><input type="file" name="mag_file4" class="form-control w-50" /></td>
        </tr>
    
    	<tr>
            <th>파일 5</th>
            <td colspan="3"><input type="file" name="mag_file5" class="form-control w-50" /></td>
        </tr>
    
        <tr>
            <td colspan="4" class="space" nowrap="nowrap"></td>
        </tr>
       
        
        <tr>
            <th>숙소 번호</th>
            <td colspan="3">
                <input type="text" name="mag_stayno" value="" maxlength="50" required />
            </td>
        </tr>
        
        <tr>
            <td colspan="4" class="space" nowrap="nowrap"></td>
        </tr>
        
        <tr>
            <th>지도</th>
                 <td colspan="3"><textarea name="mag_map" cols="80" rows="5"></textarea></td>
        </tr>
        
        
        <tr>
            <td colspan="4" class="space" nowrap="nowrap"></td>
        </tr>
        
        <tr>
            <th>작성자</th>
            <td colspan="3">
                <input type="text" name="mag_name" value="" maxlength="50" required />
            </td>
        </tr>
        
        <tr>
            <td colspan="4" class="space" nowrap="nowrap"></td>
        </tr>

        <tr>
            <th>아이디</th>
            <td colspan="3">
                <input type="text" name="mag_id" value="" maxlength="50" required />
            </td>
        </tr>

        <tr>
            <th>비밀번호</th>
            <td colspan="3">
                <input type="password" name="mag_pw" value="" maxlength="50" required />
            </td>
        </tr>
   
   
    </table>
    <script type="text/javascript">
    CKEDITOR.disableAutoInline = true;
    CKEDITOR.replace('mag_content'', { height: "250px" });
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