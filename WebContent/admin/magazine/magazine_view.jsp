<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../layout/layout_header.jsp" />

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="dto" value="${magazine }" />


<script type="text/javascript">$("#nav-magazine").addClass("now");</script>
<div class="d-flex justify-content flex-wrap flex-md-nowrap align-items-center pt-4 pb-2 mb-4 border-bottom">
    <h2>매거진 상세 정보</h2>
    <small>등록된 매거진의 상세 정보를 확인 할 수 있습니다.</small>
</div>


<div class="view-form" align="center">

    <!-- 내용 //START -->
    
    <div class="row vf-body">
        <div class="col-lg mb-4">
            <div class="card">
                <div class="card-body p-4">

                    <h2> <br>
                    	${dto.bbs_title} <br>
                    <br></h2>
                   	

                    <div class="d-flex py-2 border-bottom vfb-info">
                    
      					 <%--    <div class="col text-left">
                        
                        	
                        </div> --%>
						
                        <div class="col text-right" >
                         	<i class="fa fa-user" aria-hidden="true"></i> 작성자 : <b>${dto.bbs_writer_name}</b>
							(아이디 : <b> ${dto.bbs_writer_id}</b>) <br>
                        	<i class="icon-calendar"></i> 등록일 : ${dto.bbs_date} <br>
                        	<i class="fa fa-info" aria-hidden="true"></i> 숙소 번호 : <b>${dto.bbs_stayno}</b> <br>
                        	<i class="icon-magnifier"></i> 조회 <b><fmt:formatNumber value="${dto.bbs_hit}" /></b>&nbsp;
                      		 
                 		</div>
                    
                    </div>


                    <c:if test="${!empty dto.bbs_file1 or !empty dto.bbs_file2 or !empty dto.bbs_file3 or !empty dto.bbs_file4 or !empty dto.bbs_file5}">
                    <div class="d-flex py-3 border-bottom" align="center">
                        <div class="col">
                        	<ul class="stay-view-photo"> <br>
                        		<c:if test="${!empty dto.bbs_file1}"><li><img src="<%=request.getContextPath()%>${dto.bbs_file1}" alt="" /></li></c:if>
                        		<c:if test="${!empty dto.bbs_file2}"><li><img src="<%=request.getContextPath()%>${dto.bbs_file2}" alt="" /></li></c:if>
                        		<c:if test="${!empty dto.bbs_file3}"><li><img src="<%=request.getContextPath()%>${dto.bbs_file3}" alt="" /></li></c:if>
                        		<c:if test="${!empty dto.bbs_file4}"><li><img src="<%=request.getContextPath()%>${dto.bbs_file4}" alt="" /></li></c:if>
                        		<c:if test="${!empty dto.bbs_file5}"><li><img src="<%=request.getContextPath()%>${dto.bbs_file5}" alt="" /></li></c:if>
                        	<br><br>
                        	</ul>
                        </div>
                    </div>
                    </c:if>
                    
                    
                     
                        <table> 
                        	     
                        <tr> <!-- 유튜브 -->
                       <td align="center">${dto.bbs_youtube}</td> 
                        </tr>
                        
      
        
                        <tr class="m-auto"> <!-- 글 내용 -->
                      	<td align="center">${dto.bbs_content} </td>
                    	</tr>
      
            
                                                
                        <tr> <!-- 지도 -->
                         <td align="center">${dto.bbs_map}</td>
                        </tr>
                        
        
						</table>

                </div>
            </div>
        </div>
    </div>
    <!-- 내용 //END -->



    <!-- 버튼 //START -->
    <div class="d-flex justify-content-center mb-4">
        <a href="<%=request.getContextPath()%>/admin/magazineDeleteOk.do?bbs_no=${dto.bbs_no}" class="btn btn-danger" onclick="return confirm('정말 삭제하시겠습니까?\n되돌릴 수 없습니다.');"><i class="fa fa-trash-o"></i> 삭제하기</a>
        <a href="<%=request.getContextPath()%>/admin/magazineModify.do?bbs_no=${dto.bbs_no}" class="btn btn-primary mx-2"><i class="fa fa-pencil"></i> 수정하기</a>
        <a href="javascript:history.back();" class="btn btn-secondary"><i class="fa fa-bars"></i> 목록보기</a>
    </div>
    <!-- 버튼 //END -->
</div>




<jsp:include page="../layout/layout_footer.jsp" />