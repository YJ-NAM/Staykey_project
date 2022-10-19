<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../layout/layout_header.jsp" />
<c:set var="stayRoomList" value="${ stayRoomList }" />
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
	</table>
</div>

<jsp:include page="../layout/layout_footer.jsp" />