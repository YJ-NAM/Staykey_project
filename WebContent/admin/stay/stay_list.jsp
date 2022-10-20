<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../layout/layout_header.jsp" />
<c:set var="stayList" value="${ stayList }" />
<script>
	$(function() {
		$(".btn").click(function() {
			let button = $(".btn").index(this);
			if(button == 0) { // 등록하기
				location.href='stay/stay_write.jsp';
			}else if(button == 1){ // 삭제하기
				location.href='';
			}
		})
	})
</script>


<script type="text/javascript">$("#nav-stay").addClass("now");</script>

<div>
	<hr />
	<h4>숙소 전체 목록 조회</h4>
	<hr />
	<table>
		<tr>
			<th>숙소 번호</th> 
			<th>숙소 이름</th> 
			<th>간략 설명</th> 
			<th>숙소 위치</th> 
			<th>숙소 주소</th> 
			<th>숙소 조회수</th> 
			<th>숙소 예약수</th> 
			<th>숙소 등록일자</th> 
		</tr>
		<c:choose>
			<c:when test="${ !empty stayList }">
				<c:forEach items="${ stayList }" var="list">
	 			<tr>
					<td>${ list.stay_no }</td> 
					<td><a href="${ pageContext.request.contextPath }/admin/stayView.do?stay_no=${ list.stay_no }">${ list.stay_name }</a></td> 
					<td>${ list.stay_desc }</td> 
					<td>${ list.stay_location }</td> 
					<td>${ list.stay_addr }</td> 
					<td>${ list.stay_hit }</td> 
					<td>${ list.stay_reserv }</td> 
					<td>${ list.stay_date.substring(0,10) }</td> 
				</tr> 
				</c:forEach>
			</c:when>
			<c:otherwise>
			<tr>
				<td colspan="31">조회된 목록이 없습니다...</td>
			</tr>
			</c:otherwise>
		</c:choose>
		<tr>
			<td colspan="31">
				<button type="button" class="btn">등록하기</button>
				<button type="button" class="btn">삭제하기</button>
			</td>
		</tr>
	</table>
	<br />
	<form action="${ pageContext.request.contextPath }/staySearch.do">
		<div>
			<select name="search" id="">
				<option value="all" <c:if test='${ search eq "all"}'> selected="selected"</c:if>>전체</option>
				<option value="name" <c:if test='${ search eq "name"}'> selected="selected"</c:if>>숙소명</option>
				<option value="location" <c:if test='${ search eq "location"}'> selected="selected"</c:if>>위치</option>
				<option value="description" <c:if test='${ search eq "description"}'> selected="selected"</c:if>>설명</option>
				<option value="name" <c:if test='${ search eq "name"}'> selected="selected"</c:if>>내용</option>
			</select>
			<input type="text" name="keyword"/>
			<input type="submit" value="검색" />
		</div>
	</form>
</div>

<jsp:include page="../layout/layout_footer.jsp" />