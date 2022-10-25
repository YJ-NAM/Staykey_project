<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../layout/layout_header.jsp" />

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="dto" value="${member}" />
<c:set var="pList" value="${point}" />


<script type="text/javascript">$("#nav-member").addClass("now");</script>
<div class="d-flex justify-content flex-wrap flex-md-nowrap align-items-center pt-4 pb-2 mb-4 border-bottom">
    <h2>회원 상세 정보</h2>
    <small>등록된 회원/관리자의 정보를 확인 할 수 있습니다.</small>
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
                            <col />
                        </colgroup>
                        <tr>
                            <th>회원 유형</th>
                            <td colspan="3">
                                <c:choose>
                                <c:when test="${dto.getMember_type() == 'admin'}">관리자</c:when>
                                <c:otherwise>일반회원</c:otherwise>
                                </c:choose>
                            </td>
                        </tr>

                        <tr>
                            <td colspan="4" class="space" nowrap="nowrap"></td>
                        </tr>

                        <tr>
                            <th>아이디</th>
                            <td colspan="3">${dto.getMember_id()}</td>
                        </tr>

                        <tr>
                            <td colspan="4" class="space" nowrap="nowrap"></td>
                        </tr>

                        <tr>
                            <th>이름</th>
                            <td colspan="3">${dto.getMember_name()}</td>
                        </tr>
                        <tr>
                            <th>이메일</th>
                            <td>${dto.getMember_email()}</td>
                            <th>연락처</th>
                            <td>${dto.getMember_phone()}</td>
                        </tr>

                        <c:if test="${!empty dto.getMember_photo()}">
                        <tr>
                            <td colspan="4" class="space" nowrap="nowrap"></td>
                        </tr>

                        <tr>
                            <th>프로필 사진</th>
                            <td colspan="3"><img src="<%=request.getContextPath()%>${dto.getMember_photo()}" style="max-width: 400px;" alt="" /></td>
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
        <a href="<%=request.getContextPath()%>/admin/memberDeleteOk.do?id=${dto.getMember_id()}" class="btn btn-danger" onclick="return confirm('정말 삭제하시겠습니까?\n되돌릴 수 없습니다.');"><i class="fa fa-trash-o"></i> 삭제하기</a>
        <a href="<%=request.getContextPath()%>/admin/memberModify.do?id=${dto.getMember_id()}" class="btn btn-primary mx-2"><i class="fa fa-pencil"></i> 수정하기</a>
        <a href="javascript:history.back();" class="btn btn-secondary"><i class="fa fa-bars"></i> 목록보기</a>
    </div>
    <!-- 버튼 //END -->




    <!-- 적립금 내역 //START -->
    <div class="row vf-article">
        <div class="col-lg mb-4">
            <div class="card input-form">
                <div class="card-body p-4">
                    <h4>적립금 내역</h4>
                    <table class="table-form">
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
                                <td colspan="4" class="nodata">적립금 내역이 없습니다.</td>
                            </tr>
                            </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <!-- 목록 //END -->
</div>




<jsp:include page="../layout/layout_footer.jsp" />