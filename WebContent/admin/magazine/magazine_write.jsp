<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="<c:url value="/ckeditor/ckeditor.js" />"></script>
	
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
			
			<input type="hidden" name="mag_writer_name" />
			<input type="hidden" name="mag_writer_id" />
			<input type="hidden" name="mag_writer_pw" />
			
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
					<td colspan="3"><textarea name="mag_content1" cols="80" rows="5"></textarea></td>
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
					<td colspan="3"><textarea name="mag_content2" cols="80" rows="5"></textarea></td>
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
					<td colspan="3"><textarea name="mag_content3" cols="80" rows="5"></textarea></td>
				</tr>
				
				<tr>
					<td colspan="4" class="space" nowrap="nowrap"></td>
				</tr>
		
	
				<tr>
					<th>숙소 번호</th>
					<td colspan="3"><input type="text" name="mag_stayno" value=""
						maxlength="50" required /></td>
				</tr>
	
	
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
	
	<jsp:include page="../layout/layout_footer.jsp" />