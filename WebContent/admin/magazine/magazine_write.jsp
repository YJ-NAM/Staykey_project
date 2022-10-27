<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
	
	<jsp:include page="../layout/layout_header.jsp" />
	
	<script type="text/javascript">$("#nav-magazine").addClass("now");</script>
	
	<div
		class="d-flex justify-content flex-wrap flex-md-nowrap align-items-center pt-4 pb-2 mb-4 border-bottom">
		<h2>매거진 등록</h2>
		<small>매거진을 추가 할 수 있습니다.</small>
	</div>
	
	
	<div class="pb100">
		<form name="write_form" method="post" enctype="multipart/form-data"
			action="<%=request.getContextPath()%>/admin/magazineWriteOk.do">
			
			<input type="hidden" name="mag_writer_name" value="hyunjin" />
			<input type="hidden" name="mag_writer_id" value="user1234" />
			<input type="hidden" name="mag_writer_pw" value="1234" />
			
			<table class="table-form mt-3">
				<colgroup>
					<col width="16%" />
					<col width="34%" />
					<col width="16%" />
					<col />
				</colgroup>
	
				
				<tr>
					<th>제목</th>
					<td colspan="3"><input type="text" name="mag_title" value=""
						maxlength="50" class="form-control w-40" required /></td>
				</tr>
	
				<tr>
					<td colspan="4" class="space" nowrap="nowrap"></td>
				</tr>
				
				<tr>
					<th>목록 이미지</th>
					<td colspan="3"><input type="file" name="mag_list_img"
						class="form-control w-50" /></td>
				</tr>
		
				<tr>
					<td colspan="4" class="space" nowrap="nowrap"></td>
				</tr>
				
				<tr>
					<th>상단 이미지</th>
					<td colspan="3"><input type="file" name="mag_top_img"
						class="form-control w-50" /></td>
				</tr>
				
				<tr>
					<td colspan="4" class="space" nowrap="nowrap"></td>
				</tr>
		
				<tr>
					<th>유튜브</th>
					<td colspan="3"><textarea name="mag_youtube" cols="80" rows="5"></textarea></td>
				</tr>	
							
				<tr>
					<td colspan="4" class="space" nowrap="nowrap"></td>
				</tr>
				
				<tr>
					<th>상세 이미지1</th>
					<td colspan="3"><input type="file" name="mag_detail_img1"
						class="form-control w-50" /></td>
				</tr>
				
				<tr>
					<th>글 내용1</th>
					<td colspan="3"><textarea id="mag_content1" name="mag_content1" cols="80" rows="5"></textarea></td>
				</tr>
	
			<tr>
					<td colspan="4" class="space" nowrap="nowrap"></td>
				</tr>
				
				<tr>
					<th>상세 이미지2</th>
					<td colspan="3"><input type="file" name="mag_detail_img2"
						class="form-control w-50" /></td>
				</tr>
				
				<tr>
					<th>글 내용2</th>
					<td colspan="3"><textarea id="mag_content2" name="mag_content2" cols="80" rows="5"></textarea></td>
				</tr>
	
				<tr>
					<td colspan="4" class="space" nowrap="nowrap"></td>
				</tr>
	
				<tr>
					<th>지도</th>
					<td colspan="3"><textarea name="mag_map" cols="80" rows="5"></textarea></td>
				</tr>
				
				<tr>
					<th>글 내용3</th>
					<td colspan="3"><textarea id="mag_content3" name="mag_content3" cols="80" rows="5"></textarea></td>
				</tr>
				
				<tr>
					<td colspan="4" class="space" nowrap="nowrap"></td>
				</tr>
		
	
				<tr>
					<th>숙소 번호</th>
					<td colspan="3">
						<input type="text" name="mag_stayno" value="" maxlength="50" required />
						<button type="button" class="btn btn-sm btn-warning" data-toggle="modal" data-target="#modalCategory"><i class="fa fa-exclamation"></i> 등록할 분류 선택</button>
					</td>
				</tr>
	
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
			
			</table>
			

			<div class="gw-button">
				<div class="gwb-wrap">
					<div class="gwb-left"></div>
	
					<div class="gwb-center">
						<button type="button" class="btn btn-lg btn-outline-secondary mx-1"
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
	
	
	
<div class="modal fade" id="modalCategory" tabindex="-1" type="default" aria-hidden="true" style="display: none;">
	<div class="modal-dialog modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title"><i class="fa fa-exclamation"></i> 상품 분류 선택</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
			</div>
			<div class="modal-body">
			HFDFGDGFDFGD
			</div>
			<div class="modal-footer text-center" style="display: block;">
				<button type="button" class="btn btn-secondary btn-close" data-dismiss="modal">닫기</button>
				<!-- $("#modalCategory .btn-close").trigger("click") -->;
			</div>
		</div>
	</div>
</div>
	
	
	<jsp:include page="../layout/layout_footer.jsp" />