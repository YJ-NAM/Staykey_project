<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="layout/layout_header.jsp" />



<script type="text/javascript">$("#nav-member").addClass("now");</script>
<div class="d-flex justify-content flex-wrap flex-md-nowrap align-items-center pt-4 pb-2 mb-4 border-bottom">
	<h2>페이지 목록</h2>
	<small>페이지 설명</small>
</div>



<div>

	<form name="search_form" method="post" action="<?=$PHP_SELF?>">
	<table class="table-form ml-0 mb-3 border rounded-lg">
		<colgroup>
			<col width="130" />
			<col width="350" />
			<col width="130" />
			<col />
		</colgroup>
		<tr>
			<th>상품 노출</th>
			<td>
				<div class="form-check form-check-inline ml-1">
					<label class="form-check-label"><input type="radio" name="ps_display" value="" class="form-check-input" checked="checked" /> 전체</label>
				</div>
				<div class="form-check form-check-inline">
					<label class="form-check-label"><input type="radio" name="ps_display" value="Y" class="form-check-input" /> 노출</label>
				</div>
				<div class="form-check form-check-inline">
					<label class="form-check-label"><input type="radio" name="ps_display" value="N" class="form-check-input" /> 숨김</label>
				</div>
			</td>	
			<th>판매 상태</th>
			<td>
				<div class="form-check form-check-inline ml-1">
					<label class="form-check-label"><input type="radio" name="ps_status" value="" class="form-check-input" checked="checked" /> 전체</label>
				</div>
				<div class="form-check form-check-inline">
					<label class="form-check-label"><input type="radio" name="ps_status" value="sale" class="form-check-input" /> 판매중</label>
				</div>
				<div class="form-check form-check-inline">
					<label class="form-check-label"><input type="radio" name="ps_status" value="soldout" class="form-check-input" /> 품절</label>
				</div>
				<div class="form-check form-check-inline">
					<label class="form-check-label"><input type="radio" name="ps_status" value="close" class="form-check-input" /> 단종</label>
				</div>
			</td>
		</tr>
		<tr>
			<th>상품명</th>
			<td><input type="text" name="ps_name" value="" class="form-control w-50" /></td>
			<th>바코드</th>
			<td><input type="text" name="ps_barcode" value="" maxlength="11" class="form-control w-50" /></td>
		</tr>
	</table>

	<div class="text-center mb-5">
		<a href="sample_list.jsp" class="btn btn-outline-secondary"><i class="fa fa-power-off"></i> 검색초기화</a>
		<button type="submit" class="btn btn-secondary mx-2"><i class="fa fa-search"></i> 상품검색</button>
	</div>
	</form>





	<div class="table-top clear">
		<div class="tt-left">총 <b>123</b> 개의 상품</div>
		<div class="tt-right">
            <select name="ps_order" class="form-select" onChange="location.href='sample_list.jsp?ps_order='+this.value;">
            	<option value="register_desc">등록일 최신</option>
            	<option value="register_asc">등록일 예전</option>
            	<option value="" disabled="disabled">---------------</option>
            	<option value="modify_desc">수정일 최신</option>
            	<option value="modify_asc">수정일 예전</option>
            	<option value="" disabled="disabled">---------------</option>
            	<option value="name_desc">상품명 역순</option>
            	<option value="name_asc">상품명 순</option>
            	<option value="" disabled="disabled">---------------</option>
            	<option value="price_desc">판매가 높은</option>
            	<option value="price_asc">판매가 낮은</option>
            	<option value="" disabled="disabled">---------------</option>
            	<option value="count_desc">조회수 높은</option>
            	<option value="count_asc">조회수 낮은</option>
            </select>
		</div>
	</div>



	<table class="table-list hover">
		<colgroup>
			<col width="75">
			<col />
			<col width="90">
			<col width="200">
			<col width="120">
			<col width="120">
		</colgroup>

		<thead>
			<tr>
				<th>이미지</th>
				<th>상품명</th>
				<th>상품옵션</th>
				<th>가격</th>
				<th>조회수</th>
				<th>등록일</th>
			</tr>
		</thead>

		<tbody>
			<tr>
				<td><a href="#">이미지</a></td>
				<td class="text-left"><a href="#">상품명</a></td>
				<td>옵션</td>
				<td>12,000원</td>
				<td>123</td>
				<td>2022/10/31 16:32:04</td>
			</tr>
			<tr>
				<td colspan="6" class="nodata">등록된 상품이 없습니다.</td>
			</tr>
		</tbody>


		<tfoot>
			<tr>
				<td colspan="6">
					<table class="paging-table">
						<colgroup>
							<col width="300">
							<col>
							<col width="300">
						</colgroup>
						<tbody>
							<tr>
								<td class="text-left">
						            <form name="search_form" method="post" action="#">
						                <div class="input-group">
						                    <select name="search_field" class="custom-select col-sm-4">
						                        <option value="title">제목</option>
						                        <option value="cont">내용</option>
						                        <option value="title_cont">제목+내용</option>
						                        <option value="writer">작성자</option>
						                    </select>
						                    <input type="text" name="search_keyword" value="" class="form-control col-sm-5" />
						                    <button type="submit" class="btn btn-secondary"><i class="fa fa-search"></i> 검색</button>
						                </div>
						            </form>
								</td>

								<td class="text-center">
						            <div class="page-paging">
						                <span><a href="#?page=1"><i class="fa fa-angle-double-left"></i></a></span>
						                <span><a href="#?page=${page - 1}"><i class="fa fa-angle-left"></i></a></span>

						                <ol>
						                    <li><a href="#?page=1">1</a></li>
						                    <li><a href="#?page=2">2</a></li>
						                	<li class="now">3</li>
						                    <li><a href="#?page=1">4</a></li>
						                    <li><a href="#?page=2">5</a></li>
						                </ol>

						                <span><a href="#?page=${page + 1}"><i class="fa fa-angle-right"></i></a></span>
						                <span class="nolink"><i class="fa fa-angle-double-right"></i></span>
						            </div>
								</td>

								<td class="text-right"><a href="#" class="btn btn-primary"><i class="fa fa-pencil"></i> 상품등록</a></td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
		</tfoot>

	</table>


</div>




<jsp:include page="layout/layout_footer.jsp" />