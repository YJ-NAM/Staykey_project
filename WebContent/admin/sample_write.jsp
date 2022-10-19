<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="layout/layout_header.jsp" />




<div class="d-flex justify-content flex-wrap flex-md-nowrap align-items-center pt-4 pb-2 mb-4 border-bottom">
	<h2>페이지 목록</h2>
	<small>페이지 설명</small>
</div>




<div class="pb100">
	<form name="write_form" method="post" enctype="multipart/form-data" action="#">
	<h4 class="mb-2">섹션 타이틀</h4>
	<table class="table-form">
		<colgroup>
			<col width="130" />
			<col width="426" />
			<col width="130" />
			<col />
		</colgroup>
		<tr>
			<th>상품명 (한국어)</th>
			<td colspan="3"><input type="text" name="goods_name_kor" value="" class="form-control" required /></td>
		</tr>
		<tr>
			<th>상품명 (영어)</th>
			<td colspan="3"><input type="text" name="goods_name_eng" value="" class="form-control" /></td>
		</tr>

		<tr>
			<td colspan="4" class="space" nowrap="nowrap"></td>
		</tr>

		<tr>
			<th>상품구성 (한국어)</th>
			<td><input type="text" name="goods_ea_kor" value="" class="form-control" /></td>
			<th>상품구성 (영어)</th>
			<td><input type="text" name="goods_ea_eng" value="" class="form-control" /></td>
		</tr>
		<tr>
			<th>상품무게</th>
			<td><input type="text" name="goods_weight" value="" maxlength="11" class="form-control w-25" /></td>
			<th>바코드</th>
			<td><input type="text" name="goods_barcode" value="" class="form-control" /></td>
		</tr>
	</table>




	<h4 class="mb-2 mt-5">섹션 타이틀</h4>
	<table class="table-form">
		<colgroup>
			<col width="130" />
			<col width="426" />
			<col width="130" />
			<col />
		</colgroup>

		<tr>
			<th>상품 노출</th>
			<td>
				<div class="form-check-inline ml-1">
					<label class="form-check-label"><input type="radio" name="goods_display" value="Y" class="form-check-input" checked="checked" /> 노출</label>
				</div>
				<div class="form-check-inline">
					<label class="form-check-label"><input type="radio" name="goods_display" value="N" class="form-check-input" /> 숨김</label>
				</div>
			</td>
			<th>판매 상태</th>
			<td>
				<div class="form-check-inline ml-1">
					<label class="form-check-label"><input type="radio" name="goods_status" value="sale" class="form-check-input" checked="checked" /> 판매중</label>
				</div>
				<div class="form-check-inline">
					<label class="form-check-label"><input type="radio" name="goods_status" value="soldout" class="form-check-input" /> 품절</label>
				</div>
				<div class="form-check-inline">
					<label class="form-check-label"><input type="radio" name="goods_status" value="close" class="form-check-input" /> 단종</label>
				</div>
			</td>
		</tr>
		<tr>
			<th>상품 검색어</th>
			<td colspan="3">
				<input type="text" name="goods_search_keyword" value="" class="form-control" />
				<p class="text-primary mt-2">- 상품 검색어는 한글, 숫자, 영문 제한없이 2글자 이상 입력해주세요.</p>
				<p class="text-primary">- 각 검색어는 쉼표(,)로 구분하여 입력해주세요. (예: 다이어트,체지방)</p>
				<p class="text-primary">- 특수문자는 입력하지 말아주세요. 따옴표(',"), 꺽쇠(<,>), 역슬래시(\)</p>
			</td>
		</tr>
	</table>




	<h4 class="mb-2 mt-5">섹션 타이틀</h4>
	<table class="table-form">
		<colgroup>
			<col width="130" />
			<col />
		</colgroup>
		<tr>
			<th>목록 이미지<br />(한국어)</th>
			<td><input type="file" name="goods_photo_s_kor" class="form-control w-40" id="goods_photo_s_kor_file" /></td>
		</tr>
	</table>




	<h4 class="mb-2 mt-5">상품 설명 (한국어)</h4>
	<table class="table-form">
		<tr>
			<td>
				<textarea id="goods_detail_kor" name="goods_detail_kor" cols="80" rows="10"></textarea>
			</td>
		</tr>
	</table>

	<script type="text/javascript">
	CKEDITOR.disableAutoInline = true;
	CKEDITOR.replace('goods_detail_kor', {
		height: "400px"
	});
	</script>



	<div class="gw-button">
		<div class="gwb-wrap">
			<div class="gwb-left"></div>

			<div class="gwb-center">
				<button type="submit" class="btn btn-lg btn-success"><i class="fa fa-save"></i> 수정하기</button>
				<button type="submit" class="btn btn-lg btn-primary"><i class="fa fa-pencil"></i> 상품추가</button>
				<a href="#" class="btn btn-lg btn-outline-secondary ml-1"><i class="fa fa-bars"></i> 목록보기</a>
			</div>

			<div class="gwb-right">
				<a href="#" class="btn btn-lg btn-outline-danger" onclick="return confirm('이 상품을 삭제하시겠습니까?');"><i class="fa fa-trash-o"></i> 상품삭제</a>
			</div>
		</div>
	</div>
	</form>
</div>


<jsp:include page="layout/layout_footer.jsp" />