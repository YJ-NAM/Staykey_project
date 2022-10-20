<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../layout/layout_header.jsp" />



<script type="text/javascript">
$("#nav-member").addClass("now");


</script>



<div class="d-flex justify-content flex-wrap flex-md-nowrap align-items-center pt-4 pb-2 mb-4 border-bottom">
    <h2>회원 등록</h2>
    <small>회원/관리자를 추가 할 수 있습니다.</small>
</div>




<div class="pb100">
    <form name="write_form" method="post" enctype="multipart/form-data" action="<%= request.getContextPath() %>/admin/memberWriteOk.do">
    <table class="table-form">
        <colgroup>
            <col width="16%" />
            <col width="34%" />
            <col width="16%" />
            <col />
        </colgroup>
        <tr>
            <th>회원 유형</th>
            <td colspan="3">
                <div class="form-check form-check-inline">
                    <label class="form-check-label"><input type="radio" name="member_type" value="user" class="form-check-input" checked="checked" /> 일반회원</label>
                </div>
                <div class="form-check form-check-inline">
                    <label class="form-check-label"><input type="radio" name="member_type" value="admin" class="form-check-input" /> 관리자</label>
                </div>
            </td>
        </tr>

        <tr>
            <td colspan="4" class="space" nowrap="nowrap"></td>
        </tr>

        <tr>
            <th>아이디</th>
            <td colspan="3">
                <input type="text" name="member_id" value="" class="form-control d-inline w-30" required />
                <div id="idchk-txt" class="d-inline ml-2"><span class="text-danger">* 이미 등록된 아이디입니다.</span></div>
            </td>
        </tr>
        <tr>
            <th>비밀번호</th>
            <td><input type="password" name="member_pw" value="" class="form-control w-80" required /></td>
            <th>비밀번호 확인</th>
            <td><input type="password" name="member_pw_re" value="" class="form-control w-80" required /></td>
        </tr>

        <tr>
            <td colspan="4" class="space" nowrap="nowrap"></td>
        </tr>

        <tr>
            <th>이름</th>
            <td colspan="3"><input type="text" name="member_name" value="" class="form-control w-30" required /></td>
        </tr>
        <tr>
            <th>이메일</th>
            <td><input type="text" name="member_email" value="" class="form-control" required /></td>
            <th>연락처</th>
            <td><input type="text" name="member_phone" value="" class="form-control" /></td>
        </tr>

        <tr>
            <td colspan="4" class="space" nowrap="nowrap"></td>
        </tr>

        <tr>
            <th>프로필 사진</th>
            <td colspan="3"><input type="file" name="member_photo" class="form-control w-50" /></td>
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





<jsp:include page="../layout/layout_footer.jsp" />