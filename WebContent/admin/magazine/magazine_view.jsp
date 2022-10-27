<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../layout/layout_header_popup.jsp" />

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="dto" value="${magazine}" />

<c:if test="${empty dto}">
	<script>
		alert('존재하지 않는 게시물입니다.');
		window.close();
	</script>
</c:if>
<style type="text/css">
body {
	padding: 0 30px !important;
}
</style>
<div
	class="d-flex justify-content flex-wrap flex-md-nowrap align-items-center pt-4 pb-2 mb-4 border-bottom">
	<h2>매거진 상세 정보</h2>
	<small>등록된 매거진의 상세 정보를 확인 할 수 있습니다.</small>
</div>


<div class="view-form" align="center">

	<!-- 내용 //START -->

	<div class="row vf-body">
		<div class="col-lg mb-4">
			<div class="card">
				<div class="card-body p-4">

					<h2>
						<br> ${dto.bbs_title} <br> <br>
					</h2>



					<%-- <div class="d-flex py-2 border-bottom vfb-info">
                    
      					    <div class="col text-left">
                        
                        </div> --%>

					<div class="col text-right">
						<br> <i class="fa fa-user" aria-hidden="true"></i>  작성자 : <b>${dto.bbs_writer_name}</b>
						(아이디 : <b> ${dto.bbs_writer_id}</b>) <br> <i
							class="icon-calendar"></i> 등록일 : ${dto.bbs_date} <br> <i
							class="fa fa-info" aria-hidden="true"></i> 숙소 번호 : <b>${dto.bbs_stayno}</b>
						<br> <i class="icon-magnifier"></i> 조회 <b>   <fmt:formatNumber
								value="${dto.bbs_hit}" /></b> <br> &nbsp;

					</div>

				</div>


				<table>

					<tr>
						<c:if test="${!empty dto.bbs_top_img}">
						<td align="center"> <img src="<%=request.getContextPath()%>${dto.bbs_top_img}" alt="" /></td>
						</c:if>
					</tr>
					
					<tr>
						 <td align="center">  <br>  ${dto.bbs_youtube}  <br> </td> 
					</tr>
					
					<tr>
						<c:if test="${!empty dto.bbs_detail_img1}">
						<td align="center"> <br> <img src="<%=request.getContextPath()%>${dto.bbs_detail_img1}" alt="" /> <br> </td>
						</c:if>
					</tr>
					
					<tr class="m-auto">
						<td align="center"><br> ${dto.bbs_content1} <br></td>
					</tr>

					<tr>
						<c:if test="${!empty dto.bbs_detail_img2}">
						<td align="center"> <br> <img src="<%=request.getContextPath()%>${dto.bbs_detail_img2}" alt="" /> <br> </td>
						</c:if>
					</tr>
					
					<tr class="m-auto">
						<td align="center"> <br> ${dto.bbs_content2} <br> </td>
					</tr>

					<tr>
						<td align="center"> <br> ${dto.bbs_map} <br> </td>
					</tr>

					<tr class="m-auto">
						<td align="center"> <br> ${dto.bbs_content3} <br> </td>
					</tr>


				</table>

			</div>
		</div>
	</div>
</div>
<!-- 내용 //END -->



<!-- 버튼 //START -->
<div class="d-flex justify-content-center mb-4">
	<button type="button" class="btn btn-outline-secondary"
		onclick="window.print();">
		<i class="fa fa-print"></i> 인쇄하기
	</button>
	<button type="button" class="btn btn-secondary ml-2"
		onclick="window.close();">
		<i class="fa fa-times"></i> 창닫기
	</button>
</div>
<!-- 버튼 //END -->
</div>




<jsp:include page="../layout/layout_footer.jsp" />