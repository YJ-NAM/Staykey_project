<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../layout/layout_header.jsp" />

<c:set var="dto" value="${magazineModify}" />

<script type="text/javascript">$("#nav-magazine").addClass("now");</script>
	
<div class="d-flex justify-content flex-wrap flex-md-nowrap align-items-center pt-4 pb-2 mb-4 border-bottom">
	<h2>매거진 수정</h2>
	<small>매거진을 수정 할 수 있습니다.</small>
</div>


<div class="pb100">
	<form name="write_form" method="post" enctype="multipart/form-data" action="<%=request.getContextPath()%>/admin/magazineModifyOk.do">
		<input type="hidden" name="mag_no" value="${dto.bbs_no}" />
		<input type="hidden" name="mag_writer_name" value="${dto.bbs_writer_name}" />
		<input type="hidden" name="mag_writer_id" value="${dto.bbs_writer_id}" />
		<input type="hidden" name="mag_writer_pw" value="${dto.bbs_writer_pw}" />

		<table class="table-form mt-3">
			<colgroup>
				<col width="16%" />
				<col width="34%" />
				<col width="16%" />
				<col />
			</colgroup>

			<tr>
				<th>제목</th>
				<td colspan="3"><input type="text" name="mag_title" value="${dto.bbs_title}" maxlength="255" class="form-control" required /></td>
			</tr>

			<tr>
				<td colspan="4" class="space" nowrap="nowrap"></td>
			</tr>

			<tr>
				<th>목록 이미지</th>
				<td colspan="3">
					<input type="file" name="mag_list_img" class="form-control w-50" />
					<c:if test="${!empty dto.bbs_list_img}"><p class="mt-2"><img src="<%=request.getContextPath()%>${dto.bbs_list_img}" style="max-height: 250px;" alt="" /></p></c:if>
				</td>
			</tr>

			<tr>
				<td colspan="4" class="space" nowrap="nowrap"></td>
			</tr>

			<tr>
				<th>상단 이미지</th>
				<td colspan="3">
					<input type="file" name="mag_top_img" class="form-control w-50" />
					<c:if test="${!empty dto.bbs_top_img}"><p class="mt-2"><img src="<%=request.getContextPath()%>${dto.bbs_top_img}" style="max-height: 250px;" alt="" /></p></c:if>
				</td>
			</tr>

			<tr>
				<td colspan="4" class="space" nowrap="nowrap"></td>
			</tr>

			<tr>
				<th>유튜브</th>
				<td colspan="3">
					<div class="row m-0">
						<input type="text" name="mag_youtube" value="${dto.bbs_youtube}" class="form-control w-20" />
						<div class="ml-3">
							<p class="text-primary">* 유튜브 동영상 주소의 뒷부분을 적어주세요.</p>
							<p class="text-primary">&nbsp; 예) https://www.youtube.com/watch?v=<b class="text-danger">dLGVvC0MMDw</b></p>
						</div>
					</div>
				</td>
			</tr>	

			<tr>
				<td colspan="4" class="space" nowrap="nowrap"></td>
			</tr>

			<tr>
				<th>상세 이미지1</th>
				<td colspan="3">
					<input type="file" name="mag_detail_img1" class="form-control w-50" />
					<c:if test="${!empty dto.bbs_detail_img1}"><p class="mt-2"><img src="<%=request.getContextPath()%>${dto.bbs_detail_img1}" style="max-height: 250px;" alt="" /></p></c:if>
				</td>
			</tr>

			<tr>
				<th>글 내용1</th>
				<td colspan="3"><textarea name="mag_content1" class="form-control" cols="80" rows="10">${dto.bbs_content1}</textarea></td>
			</tr>

			<tr>
				<td colspan="4" class="space" nowrap="nowrap"></td>
			</tr>

			<tr>
				<th>상세 이미지2</th>
				<td colspan="3">
					<input type="file" name="mag_detail_img2" class="form-control w-50" />
					<c:if test="${!empty dto.bbs_detail_img2}"><p class="mt-2"><img src="<%=request.getContextPath()%>${dto.bbs_detail_img2}" style="max-height: 250px;" alt="" /></p></c:if>
				</td>
			</tr>

			<tr>
				<th>글 내용2</th>
				<td colspan="3"><textarea name="mag_content2" class="form-control" cols="80" rows="10">${dto.bbs_content2}</textarea></td>
			</tr>

			<tr>
				<td colspan="4" class="space" nowrap="nowrap"></td>
			</tr>

			<tr>
				<th>지도<br /><a href="https://www.google.com/maps" target="_blank">(구글 맵)</a></th>
				<td colspan="3"><textarea name="mag_map" class="form-control" cols="80" rows="6">${dto.bbs_map}</textarea></td>
			</tr>

			<tr>
				<th>글 내용3</th>
				<td colspan="3"><textarea name="mag_content3" class="form-control" cols="80" rows="10">${dto.bbs_content3}</textarea></td>
			</tr>

			<tr>
				<td colspan="4" class="space" nowrap="nowrap"></td>
			</tr>

			<tr>
				<th>숙소 번호</th>
				<td colspan="3">
					<div class="row m-0">
						<input type="text" name="mag_stayno" value="${dto.bbs_stayno}" class="form-control w-30" maxlength="255" />
						<button type="button" class="btn btn-sm btn-warning ml-2" data-toggle="modal" data-target="#modalCategory"><i class="fa fa-exclamation"></i> 숙소 지정하기</button>
					</div>
				</td>
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



<div class="modal fade" id="modalCategory" tabindex="-1" type="default" aria-hidden="true">
	<div class="modal-dialog modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title"><i class="fa fa-exclamation"></i> 숙소 지정하기</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
			</div>
			<div class="modal-body">
			HFDFGDGFDFGD

			</div>
			<div class="modal-footer text-center">
				<button type="button" class="btn btn-secondary btn-close" data-dismiss="modal">닫기</button>
				<!-- $("#modalCategory .btn-close").trigger("click") -->
			</div>
		</div>
	</div>
</div>
	


	
<jsp:include page="../layout/layout_footer.jsp" />