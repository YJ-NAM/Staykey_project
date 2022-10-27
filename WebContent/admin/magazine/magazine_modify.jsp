<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../layout/layout_header.jsp" />

<c:set var="dto" value="${magazineModify}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<script type="text/javascript">
		$("#nav-magazine").addClass("now");
	</script>
	<div
		class="d-flex justify-content flex-wrap flex-md-nowrap align-items-center pt-4 pb-2 mb-4 border-bottom">
		<h2>매거진 수정</h2>
		<small>매거진을 수정 할 수 있습니다.</small>
	</div>


	<!-- 내용 //START -->
	<div class="pb100">
		<form name="modify_form" method="post" enctype="multipart/form-data"
			action="<%=request.getContextPath()%>/admin/magazineModifyOk.do">

			<input type="hidden" name="mag_no" value="${dto.bbs_no}" />

			<table class="table-form mt-3">

				<colgroup>
					<col width="16%" />
					<col width="34%" />
					<col width="16%" />
					<col />
				</colgroup>


				<tr>
					<th>제목</th>
					<td colspan="3"><input type="text" name="mag_title"
						value="${dto.bbs_title}" required /></td>
				</tr>

				<tr>
					<td colspan="4" class="space" nowrap="nowrap"></td>
				</tr>
				
				<tr>
					<th>목록 이미지</th>
					<td colspan="3"><c:if test="${!empty dto.bbs_list_img}">
							<p>
								<img src="${pageContext.request.contextPath}/${dto.bbs_list_img}"
									alt="" width="100px" height="100px" />
							</p>
						</c:if> 
						<input type="file" name="mag_list_img" class="form-control w-50" />
					</td>
				</tr>

				<tr>
					<td colspan="4" class="space" nowrap="nowrap"></td>
				</tr>
				
				<tr>
					<th>상단 이미지</th>
					<td colspan="3"><c:if test="${!empty dto.bbs_top_img}">
							<p>
								<img src="${pageContext.request.contextPath}/${dto.bbs_top_img}"
									alt="" width="100px" height="100px" />
							</p>
						</c:if> 
						<input type="file" name="mag_top_img" class="form-control w-50" />
					</td>
				</tr>
				
				<tr>
					<td colspan="4" class="space" nowrap="nowrap"></td>
				</tr>
				
				<tr>
					<th>유튜브</th>
					<td colspan="3"><textarea name="mag_youtube" cols="80"
							rows="5">${dto.bbs_youtube}</textarea></td>
				</tr>					
				
				<tr>
					<td colspan="4" class="space" nowrap="nowrap"></td>
				</tr>			
			
				<tr>
					<th>상세 이미지1</th>
					<td colspan="3"><c:if test="${ !empty dto.bbs_detail_img1}">
							<p>
								<img src="${pageContext.request.contextPath }/${dto.bbs_detail_img1}"
									alt="" width="100px" height="100px" />
							</p>
						</c:if> 
						<input type="file" name="mag_detail_img1" class="form-control w-50" />
					</td>
				</tr>
				
				<tr>
					<th>글 내용1<br />(예약안내)
					</th>
					<td colspan="3"><textarea id="bbs_content1" name="mag_content1"
					cols="80" rows="5">${dto.bbs_content1}</textarea></td>
				</tr>
				
				<tr>
					<td colspan="4" class="space" nowrap="nowrap"></td>
				</tr>
			
				<tr>
					<th>상세 이미지2</th>
					<td colspan="3"><c:if test="${ !empty dto.bbs_detail_img2}">
							<p>
								<img src="${pageContext.request.contextPath }/${dto.bbs_detail_img2}"
									alt="" width="100px" height="100px" />
							</p>
						</c:if> 
						<input type="file" name="mag_detail_img2" class="form-control w-50" />
					</td>
				</tr>
				
				<tr>
					<th>글 내용2<br />(예약안내)
					</th>
					<td colspan="3"><textarea id="bbs_content2" name="mag_content2"
					cols="80" rows="5">${dto.bbs_content2}</textarea></td>
				</tr>
				
				<tr>
					<td colspan="4" class="space" nowrap="nowrap"></td>
				</tr>

				<tr>
					<th>지도</th>
					<td colspan="3"><textarea name="mag_map" cols="80" rows="5">${dto.bbs_map}</textarea></td>
				</tr>	

				<tr>
					<th>글 내용3<br />(예약안내)
					</th>
					<td colspan="3"><textarea id="bbs_content3" name="mag_content3"
					cols="80" rows="5">${dto.bbs_content3}</textarea></td>
				</tr>
				
				<tr>
					<td colspan="4" class="space" nowrap="nowrap"></td>
				</tr>

				<tr>
					<th>숙소 번호</th>
					<td colspan="3"><input type="text" name="mag_stayno"
						value="${dto.bbs_stayno}" required /></td>
				</tr>
	
				<tr>
					<td colspan="4" class="space" nowrap="nowrap"></td>
				</tr>

				<tr>
					<th>작성자</th>
					<td colspan="3"><input type="text" name="mag_writer_name"
						value="${dto.bbs_writer_name}" required /></td>
				</tr>
	
				<tr>
					<td colspan="4" class="space" nowrap="nowrap"></td>
				</tr>

				<tr>
					<th>아이디</th>
					<td colspan="3"><input type="text" name="mag_writer_id"
						value="${dto.bbs_writer_id}" required /></td>
				</tr>
	
				<tr>
					<td colspan="4" class="space" nowrap="nowrap"></td>
				</tr>

				<tr>
					<th>비밀번호</th>
					<td colspan="3"><input type="text" name="mag_writer_pw"
						value="${dto.bbs_writer_pw}" required /></td>
				</tr>


			</table>
			

			<script type="text/javascript">
				CKEDITOR.disableAutoInline = true;
				CKEDITOR.replace('mag_content1', {
					height : "250px"
				});
				CKEDITOR.replace('mag_content2', {
					height : "250px"
				});
				CKEDITOR.replace('mag_content3', {
					height : "250px"
				});
			</script>



			<div class="gw-button">
				<div class="gwb-wrap">
					<div class="gwb-left"></div>

					<div class="gwb-center">
						<button type="button"
							class="btn btn-lg btn-outline-secondary mx-1"
							onclick="history.back();">
							<i class="fa fa-bars"></i> 목록보기
						</button>
						<button type="submit" class="btn btn-lg btn-primary mx-1">
							<i class="fa fa-pencil"></i> 등록하기
						</button>
					</div>

					<div class="gwb-right"></div>
				</div>
			</div>
		</form>
	</div>




	<jsp:include page="../layout/layout_footer.jsp" />


</body>
</html>