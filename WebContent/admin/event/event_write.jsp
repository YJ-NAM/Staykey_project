<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../layout/layout_header.jsp" />

<c:set var="stay" value="${stayList}" />

<script type="text/javascript">
	$("#nav-event").addClass("now");
</script>



<div
	class="d-flex justify-content flex-wrap flex-md-nowrap align-items-center pt-4 pb-2 mb-4 border-bottom">
	<h2>이벤트 등록</h2>
	<small>이벤트를 추가할 수 있습니다.</small>
</div>


<div class="pb100">
	<form name="write_form" method="post" enctype="multipart/form-data"
		action="<%=request.getContextPath()%>/admin/eventWriteOk.do">
		
		<!-- 작성자, 아이디, 비밀번호 hidden으로 넘기기. -->
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
				<td colspan="3"><input type="text" name="ev_title"
					maxlength="255" class="form-control" required /></td>
			</tr>

			<tr>
				<td colspan="4" class="space" nowrap="nowrap"></td>
			</tr>

			<tr>
				<th>글 내용</th>
				<td colspan="3"><textarea name="ev_content"
						class="form-control" cols="80" rows="10"></textarea></td>
			</tr>

			<tr>
				<td colspan="4" class="space" nowrap="nowrap"></td>
			</tr>

			<tr>
				<th>이미지 파일1</th>
				<td colspan="3"><input type="file" name="ev_file1"
					class="form-control w-50" /></td>
			</tr>

			<tr>
				<td colspan="4" class="space" nowrap="nowrap"></td>
			</tr>

			<tr>
				<th>이미지 파일2</th>
				<td colspan="3"><input type="file" name="ev_file2"
					class="form-control w-50" /></td>
			</tr>

			<tr>
				<td colspan="4" class="space" nowrap="nowrap"></td>
			</tr>

			<tr>
				<th>이미지 파일3</th>
				<td colspan="3"><input type="file" name="ev_file3"
					class="form-control w-50" /></td>
			</tr>

			<tr>
				<td colspan="4" class="space" nowrap="nowrap"></td>
			</tr>

			<tr>
				<th>이미지 파일4</th>
				<td colspan="3"><input type="file" name="ev_file4"
					class="form-control w-50" /></td>
			</tr>

			<tr>
				<td colspan="4" class="space" nowrap="nowrap"></td>
			</tr>

			<tr>
				<th>이미지 파일5</th>
				<td colspan="3"><input type="file" name="ev_file5"
					class="form-control w-50" /></td>
			</tr>

			<tr>
				<td colspan="4" class="space" nowrap="nowrap"></td>
			</tr>

			 <tr>
				<th>숙소 번호</th>
				<td colspan="3">
					<div class="row m-0">
						<input type="text" name="ev_stayno" value="" id="test"
							class="form-control w-30" maxlength="255" />
						<button type="button" class="btn btn-sm btn-warning ml-2"
							data-toggle="modal" data-target="#modalCategory">
							<i class="fa fa-exclamation"></i> 숙소 지정하기
						</button>
					</div>
				</td>
			</tr>
		
			<tr>
				<td colspan="4" class="space" nowrap="nowrap"></td>
			</tr> 

			 	<tr>
                        <th>이벤트 기간</th>
                        <td colspan="3">
                            <div class="row">
                                <div class="col-4">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                        </div>
                                        <input type="text" name="ev_start" id="startDt" class="form-control text-center eng" />
                                    </div>
                                </div>

                                <div class="pt-2">~</div>

                                <div class="col-4">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                                        </div>
                                        <input type="text" name="ev_end" id="endDt" class="form-control text-center eng" />
                                    </div>
                                </div>
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




<!-- 모달 창 -->
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
		</div>
				
			<div class="modal-body">
			


				<!-- 숙소 지정 내용 -->
				<!-- ================================================================== -->


				<!-- 검색 설정 : 글 제목, 작성자로 검색 가능 -->


				<div>
					<h2>숙소 검색</h2>
					<small>등록할 숙소를 검색해 보세요.</small> <br> <br>
				
				
				<!-- 검색 기능 처리 -->

				<form  method="post" onsubmit="return search(this);">
				<select name="search_field">
					<option value="no" selected="selected">숙소 번호</option>
					<option value="name">숙소 이름</option>
			
				</select>
		
				<input type="text" name="search_keyword">
				<input type="submit" value="검색">
				<br><br>
				</form>




				<c:choose>
					<c:when test="${!empty stay }">
					<ul class="mb-4" id="search-result">
						<c:forEach items="${stay}" var="list">
						<li class="my-2">

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
			
						
							<button class="staynobtn" id="staynobtn" onclick="test('${list.stay_no}'); close();" data-dismiss="modal">
								숙소 번호 : <b> ${list.stay_no} </b> / 숙소 이름 : <b>
									${list.stay_name}</b>
							</button>
							</li>


						</c:forEach>
					</ul>
					</c:when>
				</c:choose>


			</div>
			<div class="modal-footer text-center">
				<button type="button" id="btn btn-secondary btn-close"
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
	

	function search(el) {
			$.ajax({
				type : "post",
				url : "magazineStaySearch.do",
				datatype : "jsp",
				data: {
					type : $(el).find("select[name='search_field']").val(),
					search  : $(el).find("input[name='search_keyword']").val()
				},
				success : function(data) {
					$("#search-result").html(data);
				},
				
				error : function(data) {
					alert("데이터 통신 오류입니다~~~");
				}
			});
			return false;
		}

	
	
		</script>


<jsp:include page="../layout/layout_footer.jsp" />