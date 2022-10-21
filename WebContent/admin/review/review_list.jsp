<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../layout/layout_header.jsp" />


후기 관리 페이지 메인
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="list" value="${List }" />

<div align="center">

	<table border="1" cellspacing="0" width="1000">

		<tr>
			<th>리뷰 번호</th>
			<th>숙소 번호</th>
			<th>평점 접근성</th>
			<th>평점 서비스</th>
			<th>평점 객실시설</th>
			<th>평점 부대시설</th>
			<th>평점 식음료</th>
			<th>평점 만족도</th>
			<th>리뷰 내용</th>
			<th>리뷰 파일이름</th>
			<th>작성자 아이디</th>
			<th>작성자 비번</th>
			<th>작성자 이름</th>
			<th>리뷰 작성일</th>


		</tr>

		<c:if test="${!empty list}">
			<c:forEach items="${list }" var="dto">
				<tr>
					<td>${dto.getReview_no() }</td>
					<td>${dto.getReview_stayno() }</td>
					<td>${dto.getReview_point1() }</td>
					<td>${dto.getReview_point2() }</td>
					<td>${dto.getReview_point3() }</td>
					<td>${dto.getReview_point4() }</td>
					<td>${dto.getReview_point5() }</td>
					<td>${dto.getReview_point6() }</td>
					<td>${dto.getReview_content() }</td>
					<td>${dto.getReview_file() }</td>
					<td>${dto.getReview_id() }</td>
					<td>${dto.getReview_pw() }</td>
					<td>${dto.getReview_name() }</td>
					<td>${dto.getReview_date().substring(0, 10) }</td>
				</tr>
			</c:forEach>
		</c:if>
		<c:if test="${empty list}">
			<tr>
				<td>
					<h3>작성된 후기가 없습니다.</h3>
				</td>
			</tr>
		</c:if>

	</table>


</div>


<jsp:include page="../layout/layout_footer.jsp" />