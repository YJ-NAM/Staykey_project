<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../layout/layout_header.jsp" />

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="list" value="${List}" />


<script type="text/javascript">$("#nav-magazine").addClass("now");</script>
<div class="d-flex justify-content flex-wrap flex-md-nowrap align-items-center pt-4 pb-2 mb-4 border-bottom">
    <h2>매거진 목록</h2>
    <small>등록된 매거진 게시물들을 확인하고 관리 할 수 있습니다.</small>
</div>


<div>
    <form name="search_form" method="post" action="magazineList.do">
    <input type="hidden" name="ps_order" value="${map.ps_order}" />
    <table class="table-form ml-0 mb-3 border rounded-lg">
        <colgroup>
            <col width="10%" />
            <col width="22%" />
            <col width="10%" />
            <col width="22%" />
            <col width="10%" />
            <col />
        </colgroup>
      
        <tr>
            <th>숙소 번호</th>
            <td><input type="text" name="mg_stayno" value="${map.mg_stayno}" maxlength="50" class="form-control w-90" /></td>
            <th>작성일자</th>
            <td><input type="text" name="mg_date" value="${map.mg_date}" maxlength="30" class="form-control w-90" /></td>
            <th>제목</th>
            <td><input type="text" name="mg_title" value="${map.mg_title}" maxlength="255" class="form-control w-90" /></td>
        </tr>
    </table>

    <div class="text-center mb-5">
        <a href="<%=request.getContextPath()%>/admin/magazineList.do" class="btn btn-outline-secondary"><i class="fa fa-power-off"></i> 검색 초기화</a>
        <button type="submit" class="btn btn-secondary mx-2"><i class="fa fa-search"></i> 매거진 검색</button>
    </div>
    </form>





    <div class="table-top clear">
        <div class="tt-left">총 <b><fmt:formatNumber value="${listCount}" /></b> 개의 매거진</div>
        <div class="tt-right">
            <select name="ps_order" class="form-select" onChange="location.href='<%=request.getContextPath()%>/admin/magazineList.do?ps_type=${map.ps_type}&ps_name=${map.ps_name}&ps_id=${map.ps_id}&ps_email=${map.ps_email}&ps_order='+this.value;">
                <option value="bbs_date_desc"<c:if test="${map.ps_order == 'bbs_date_desc'}"> selected="selected"</c:if>>등록일 최신</option>
                <option value="bbs_date_asc"<c:if test="${map.ps_order == 'bbs_date_asc'}"> selected="selected"</c:if>>등록일 예전</option>
                <option value="" disabled="disabled">---------------</option>
                <option value="bbs_stayno_desc"<c:if test="${map.ps_order == 'bbs_stayno_desc'}"> selected="selected"</c:if>>숙소번호 역순</option>
                <option value="bbs_stayno_asc"<c:if test="${map.ps_order == 'bbs_stayno_asc'}"> selected="selected"</c:if>>숙소번호 순</option>
                <option value="" disabled="disabled">---------------</option>
            </select>
        </div>
    </div>
    
       

<table class="table-list hover">
        <colgroup>
            <col width="5%">
            <col width="10%">
            <col width="15%">
            <col width="20%">
            <col width="10%">
            <col width="10%">
            <col width="10%">
            <col width="5%">
            <col width="15%">
            <col />
            <col width="10%">
        </colgroup>


        <thead>
            <tr>
          
           	    <th> No. </th>
				<th>작성자/아이디</th>
				<th> 제목</th>
				<th> 내용</th>
				<th>첨부파일1</th>
				<th>숙소 번호</th>
				<th>작성일자</th>
				<th>조회수</th>
				<th>기능</th>
           
            </tr>
        </thead>



  <tbody>  
            <c:choose>
            <c:when test="${!empty list }">
            console.log('didi');
            <c:forEach items="${list}" var="dto">
            <tr> 
                <td>${dto.bbs_no }
                    <a href="<%=request.getContextPath()%>/admin/magazineView.do?id=${dto.bbs_writer_id }">
                    </a>
                 </td>

      
                <td>
                        <a href="<%=request.getContextPath()%>/admin/magazineView.do?stayno=${dto.bbs_stayno }">
                       <p><b>${dto.bbs_writer_id }</b></p>
                        <p>${dto.bbs_writer_name }</p>
                    </a>
                </td>
                
                <td>${dto.bbs_title }</td>
                <td>${dto.bbs_content }</td>


                <td class="photo">
                    <a href="<%=request.getContextPath()%>/admin/magazineView.do?stayno=${dto.bbs_stayno }">
                        <c:choose>
                        <c:when test="${!empty dto.bbs_file1 }"><img src="<%=request.getContextPath()%>${dto.bbs_file1 }" alt="" /></c:when>
                        <c:otherwise>
                      
                  
                        <svg class="bd-placeholder-img" width="60" height="60" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img">
                            <title>${dto.bbs_stayno}</title>
                            <rect width="100%" height="100%" fill="#eee"></rect>
                            <text x="48%" y="54%" fill="#888" dy=".1em">no img</text>
                        </svg>
                        
                        
                        </c:otherwise>
                        </c:choose>
                    </a>
                </td>


                <td>${dto.bbs_stayno }</td>
                <td>${dto.bbs_date.substring(0,10) }</td>
                <td>${dto.bbs_hit }</td>
     
                <td>
                <a href="<%=request.getContextPath()%>/admin/magazineModify.do?id=${dto.bbs_stayno}" class="btn btn-sm btn-outline-primary m-1">수정</a>
                <a href="<%=request.getContextPath()%>/admin/magazineDeleteOk.do?id=${dto.bbs_stayno}" class="btn btn-sm btn-outline-danger m-1" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
                </td>                
                
            </tr>
            </c:forEach>
            </c:when>




            <c:otherwise>
            <tr>
                <td colspan="10" class="nodata">등록된 회원이 없습니다.</td>
            </tr>
            </c:otherwise>
            </c:choose>
        </tbody>




		<!-- 하단 부분 -->
        <tfoot>
            <tr>
                <td colspan="10">
                    <table class="paging-table">
                        <colgroup>
                            <col width="120">
                            <col>
                            <col width="120">
                        </colgroup>
                        <tbody>
                            <tr>
                                <td class="text-left"></td>

                                <td class="text-center">
                                    ${map.pagingWrite}
                                </td>

                                <td class="text-right"><a href="<%=request.getContextPath()%>/admin/magazineWrite.do" class="btn btn-primary"><i class="fa fa-pencil"></i> 매거진 등록</a></td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
        </tfoot>
    </table>
</div>




<jsp:include page="../layout/layout_footer.jsp" />