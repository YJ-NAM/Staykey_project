<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../layout/layout_header.jsp" />

<c:set var="stay" value="${stayList}" />

<script type="text/javascript">
	$("#nav-magazine").addClass("now");
</script>



<div
	class="d-flex justify-content flex-wrap flex-md-nowrap align-items-center pt-4 pb-2 mb-4 border-bottom">
	<h2>매거진 등록</h2>
	<small>매거진을 추가 할 수 있습니다.</small>
</div>


<div class="pb100">
	<form name="write_form" method="post" enctype="multipart/form-data"
		action="<%=request.getContextPath()%>/admin/magazineWriteOk.do">
		<input type="hidden" name="mag_writer_name" value="hyunjin" /> <input
			type="hidden" name="mag_writer_id" value="user1234" /> <input
			type="hidden" name="mag_writer_pw" value="1234" />

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
					maxlength="255" class="form-control" required /></td>
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
				<td colspan="3">
					<div class="row m-0">
						<input type="text" name="mag_youtube" value=""
							class="form-control w-20" />
						<div class="ml-3">
							<p class="text-primary">* 유튜브 동영상 주소의 뒷부분을 적어주세요.</p>
							<p class="text-primary">
								&nbsp; 예) https://www.youtube.com/watch?v=<b class="text-danger">dLGVvC0MMDw</b>
							</p>
						</div>
					</div>
				</td>
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
				<td colspan="3"><textarea name="mag_content1"
						class="form-control" cols="80" rows="10"></textarea></td>
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
				<td colspan="3"><textarea name="mag_content2"
						class="form-control" cols="80" rows="10"></textarea></td>
			</tr>

			<tr>
				<td colspan="4" class="space" nowrap="nowrap"></td>
			</tr>

			<tr>
				<th>지도<br /> <a href="https://www.google.com/maps"
					target="_blank">(구글 맵)</a></th>
				<td colspan="3"><textarea name="mag_map" class="form-control"
						cols="80" rows="6"></textarea></td>
			</tr>

			<tr>
				<th>글 내용3</th>
				<td colspan="3"><textarea name="mag_content3"
						class="form-control" cols="80" rows="10"></textarea></td>
			</tr>

			<tr>
				<td colspan="4" class="space" nowrap="nowrap"></td>
			</tr>

			<tr>
				<th>숙소 번호</th>
				<td colspan="3">
					<div class="row m-0">
						<input type="text" name="mag_stayno" value="" id="test"
							class="form-control w-30" maxlength="255" />
						<button type="button" class="btn btn-sm btn-warning ml-2"
							data-toggle="modal" data-target="#modalCategory">
							<i class="fa fa-exclamation"></i> 숙소 지정하기
						</button>
					</div>
				</td>
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

<!-- 모달 크기 조정 --> 
<style>
#modalCategory {
	display: flex;
	width: 80%;
	height: 80%;
	justify-content: space-between;
}
</style>

<div class="modal fade" id="modalCategory" tabindex="-1" type="default"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">
					<i class="fa fa-exclamation"></i> 숙소 지정하기
				</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>

			</div>

			<div class="modal-body">
			


				<!-- 숙소 지정 내용 -->
				<!-- ================================================================== -->


				<!-- 검색 설정 : 글 제목, 작성자로 검색 가능 -->

				<div>
					<h2>숙소 검색</h2>
					<small>등록할 숙소를 검색해 보세요.</small> <br> <br>

					<tr>
						<th>숙소 번호</th>
						<td><input type="text" name="mg_stayno"
							value="${map.mg_stayno}" class="form-control w-90" /></td>
						<th>숙소 이름</th>
						<td><input type="text" name="mg_name" value="${map.mg_name}"
							 class="form-control w-90" /></td>
					</tr>
					<br>
				</div>

				<!-- 검색 버튼 -->
				<div class="text-center mb-5">

					<button type="submit" class="btn btn-secondary mx-2">
						<i class="fa fa-search"></i> 숙소 검색
					</button>
				</div>


				<c:choose>
					<c:when test="${!empty stay }">
						<c:forEach items="${stay}" var="list">


							<c:choose>

								<c:when test="${!empty list.stay_file1}">
									<img src="<%=request.getContextPath()%>${list.stay_file1}"
										alt="" width="60" height="60" />
								</c:when>

								<c:otherwise>
									<!-- 이미지가 없는 경우 기본 이미지 -->
									<svg class="bd-placeholder-img" width="60" height="60"
										xmlns="http://www.w3.org/2000/svg"
										preserveAspectRatio="xMidYMid slice" focusable="false"
										role="img">
					                            <title>${dto.bbs_no}</title>
					                            <rect width="100%" height="100%"
											fill="#eee"></rect>
					                            <text x="48%" y="54%" fill="#888"
											dy=".1em">no img</text>
					                        </svg>
								</c:otherwise>
								
							</c:choose>

							<button class="staynobtn" onclick="test('${list.stay_no}')">
								숙소 번호 : <b> ${list.stay_no} </b> / 숙소 이름 : <b>
									${list.stay_name}</b>
							</button>
							<br> <br> 


						</c:forEach>
					</c:when>
				</c:choose>


			</div>


			<div class="modal-footer text-center">
				<button type="button" class="btn btn-secondary btn-close"
					data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<script>
	function test(stayno) {
		let this_val = $("#test").val();
		let add_val = this_val;

		if (this_val.length > 0) {
			if (this_val.indexOf("/" + stayno + "/") == -1) {
				add_val = this_val + stayno + "/";
			}
		} else {
			add_val = this_val + "/" + stayno + "/";
		}

		$("#test").val(add_val);
	}
</script>

<jsp:include page="../layout/layout_footer.jsp" />