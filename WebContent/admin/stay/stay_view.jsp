<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../layout/layout_header.jsp" />
<c:set var="list" value="${ stayView }" />

<script>
	
	$(function() {
		$(".btn").click(function() {
			let button = $(".btn").index(this);
			if(button == 0) { // Room 구성 보기
				location.href='stayRoomList.do?stay_no=${ list.stay_no }';
			}else if(button == 1){ // 수정하기
				location.href='stayModify.do?stay_no=${ list.stay_no }';
			}else if(button == 2){ // 삭제하기
				location.href='';
			}
		})
	})

</script>
<div>
	<hr />
	<h4>About <b>${ stayView.stay_name }</b></h4>
	<hr />
	<table>
		<tr>
			<th>숙소 번호</th> 
			<th>숙소 이름</th> 
			<th>간략 설명</th> 
			<th>숙소 위치</th> 
			<th>숙소 주소</th> 
			<th>내용 컨텐츠1</th> 
			<th>내용 컨텐츠2</th> 
			<th>내용 컨텐츠3</th> 
			<th>안내사항 1</th> 
			<th>안내사항 2</th> 
			<th>안내사항 3</th> 
			<th>소개 사진 1</th> 
			<th>소개 사진 2</th> 
			<th>소개 사진 3</th> 
			<th>소개 사진 4</th> 
			<th>소개 사진 5</th>
			<th>옵션1 이름</th> <th>옵션1 가격</th> <th>옵션1 설명</th> <th>옵션1 사진</th> 
			<th>옵션2 이름</th> <th>옵션2 가격</th> <th>옵션2 설명</th> <th>옵션2 사진</th> 
			<th>옵션3 이름</th> <th>옵션3 가격</th> <th>옵션3 설명</th> <th>옵션3 사진</th> 
			<th>숙소 조회수</th> 
			<th>숙소 예약수</th> 
			<th>숙소 등록일자</th> 
		</tr>
		<c:choose>
			<c:when test="${ !empty list }">
				<tr>
					<td>${ list.stay_no }</td> 
					<td>${ list.stay_name }</td> 
					<td>${ list.stay_desc }</td> 
					<td>${ list.stay_location }</td> 
					<td>${ list.stay_addr }</td> 
					<td>${ list.stay_content1 }</td> 
					<td>${ list.stay_content2 }</td> 
					<td>${ list.stay_content3 }</td>
					<td>${ list.stay_info1 }</td> 
					<td>${ list.stay_info2 }</td> 
					<td>${ list.stay_info3 }</td> 
					<td>${ list.stay_file1 }</td> 
					<td>${ list.stay_file2 }</td> 
					<td>${ list.stay_file3 }</td> 
					<td>${ list.stay_file4 }</td> 
					<td>${ list.stay_file5 }</td>
					<td>${ list.stay_option1_name }</td> <td>${ list.stay_option1_price }</td> <td>${ list.stay_option1_desc }</td> <td>${ list.stay_option1_photo }</td> 
					<td>${ list.stay_option2_name }</td> <td>${ list.stay_option2_price }</td> <td>${ list.stay_option2_desc }</td> <td>${ list.stay_option2_photo }</td> 
					<td>${ list.stay_option3_name }</td> <td>${ list.stay_option3_price }</td> <td>${ list.stay_option3_desc }</td> <td>${ list.stay_option3_photo }</td> 
					<td>${ list.stay_hit }</td> 
					<td>${ list.stay_reserv }</td> 
					<td>${ list.stay_date.substring(0,10) }</td> 
				</tr> 
			</c:when>
			<c:otherwise>
			<tr>
				<td colspan="31">조회된 목록이 없습니다...</td>
			</tr>
			</c:otherwise>
		</c:choose>
		<tr>
			<td colspan="31">
				<button type="button" class="btn">Rooms(방 목록)</button>
				<button type="button" class="btn">수정하기</button>
				<button type="button" class="btn">삭제하기</button>
			</td>
		</tr>
	</table>
</div>