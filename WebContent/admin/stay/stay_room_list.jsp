<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../layout/layout_header.jsp" />
<c:set var="stayRoomList" value="${ stayRoomList }" />
<c:set var="stayNo" value="${ stayNo }" /> <!-- 숙소 번호 넘겨준 인자값! 필수 -->
<script>
	$(function() {
		$(".btn").click(function() {
			let button = $(".btn").index(this);
			if(button == 0) { // 방 등록하기
				location.href='stay/stayRoom_write.jsp?room_stayno=${ stayNo }'; // 경로 확인 완 - 숙소 번호 get으로 넘겨줌
			}else if(button == 1){ // 방 수정하기 - 경로 재확인 필요
				location.href='stayRoomModify.do?stay_no=${ list.room_stayno }';
			}else if(button == 2){ // 방 삭제하기 - 경로 재확인 필요
				location.href='';
			}
		})
	});
</script>
<div>
	<hr />
	<h4>방 전체 목록</h4>
	<hr />
	<table>
		<tr>
			<th>방 번호</th> 
			<th>숙소 번호</th> 
			<th>방 이름</th> 
			<th>간략 설명</th> 
			<th>체크인 시간</th> 
			<th>체크아웃 시간</th> 
			<th>기준인원</th> 
			<th>최대인원</th> 
			<th>방 크기</th> 
			<th>방 특징</th> 
			<th>어메니티</th> 
			<th>서비스</th> 
			<th>방 사진1</th> 
			<th>방 사진2</th> 
			<th>방 사진3</th>
			<th>방 사진4</th>
			<th>방 사진5</th>
		</tr>
		<c:choose>
			<c:when test="${ !empty stayRoomList }">
				<c:forEach items="${ stayRoomList }" var="list">
	 			<tr>
					<td>${ list.room_no }</td> 
					<td>${ list.room_stayno }</td> 
					<td>${ list.room_name }</td> 
					<td>${ list.room_desc }</td> 
					<td>${ list.room_checkin }</td> 
					<td>${ list.room_checkout }</td> 
					<td>${ list.room_people_min }</td>
					<td>${ list.room_people_max }</td> 
					<td>${ list.room_size }</td> 
					<td>${ list.room_features }</td> 
					<td>${ list.room_amenities }</td> 
					<td>${ list.room_service }</td> 
					<td>${ list.room_photo1 }</td> 
					<td>${ list.room_photo2 }</td> 
					<td>${ list.room_photo3 }</td>
					<td>${ list.room_photo4 }</td> 
					<td>${ list.room_photo5 }</td> 
				</tr> 
				</c:forEach>
			</c:when>
			<c:otherwise>
			<tr>
				<td colspan="17">조회된 목록이 없습니다...</td>
			</tr>
			</c:otherwise>
		</c:choose>
		<tr>
			<td colspan="17">
			<button type="submit"></button>
				<button class="btn btn-primary">hgfhgfhgf</button>
				<input type="button" class="btn" value="방 추가하기" />
				<input type="button" class="btn" value="방 수정하기" />
				<input type="button" class="btn" value="방 삭제하기" />
			</td>
		</tr>
	</table>
</div>

<jsp:include page="../layout/layout_footer.jsp" />