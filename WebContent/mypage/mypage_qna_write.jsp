<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../layout/layout_header.jsp" />
<jsp:include page="../mypage/mypage_header.jsp" />
<script type="text/javascript">$("#mymenu-qna").addClass("now");</script>



<div class="qna-write">
    <form name="write_form" method="post" enctype="multipart/form-data" action="<%=request.getContextPath() %>/mypageQnaWriteOk.do" onsubmit="return join_check();">
    <table class="table-form mt-3">
        <colgroup>
            <col width="16%" />
            <col width="34%" />
            <col />
        </colgroup>

        <tr>
            <th>제목</th>
            <td colspan="2">
                <input type="text" name="bbs_title" value="" maxlength="30" class="form-control d-inline w-30" required />
            </td>
        </tr>
       
        <tr>
            <th>내용</th>
            <td colspan="2">
            	<textarea name="bbs_content" class="form-control" cols="80" rows="10"></textarea>
            </td>
            
        </tr>
       

        <tr>
            <td colspan="3" class="space" nowrap="nowrap"></td>
        </tr>

        <tr>
            <th>첨부 파일1</th>
            <td colspan="2"><input type="file" name="bbs_file1" class="form-control w-50" /></td>
        </tr>
        
        <tr>
            <th>첨부 파일2</th>
            <td colspan="2"><input type="file" name="bbs_file2" class="form-control w-50" /></td>
        </tr>
    </table>



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



<jsp:include page="../mypage/mypage_footer.jsp" />
<jsp:include page="../layout/layout_footer.jsp" />