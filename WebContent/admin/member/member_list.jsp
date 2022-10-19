<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../layout/layout_header.jsp" />


<style>
.page-paging {
	display: inline-block;
	padding: 0;
	text-align: center;
	font-size: 0;
	line-height: 0;
}

.page-paging ol {
	display: inline-block;
	vertical-align: top;
	margin: 0;
	padding: 0;
}

.page-paging span, .page-paging ol li {
	display: inline-block;
	margin-left: -1px;
	background: #fefefe;
	line-height: 36px;
	letter-spacing: -1px;
	color: #6c757d;
	vertical-align: top;
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	border-left: 1px solid #ccc;
}

.page-paging span {
	width: 38px;
	font-size: 16px;
	overflow: hidden;
}

.page-paging span.nolink {
	width: 38px;
	height: 38px;
	text-align: center;
	box-sizing: border-box;
}

.page-paging span:first-child {
	margin-left: 0;
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	border-left: 1px solid #ccc;
	-webkit-border-top-left-radius: 5px;
	-webkit-border-bottom-left-radius: 5px;
	-moz-border-radius-topleft: 5px;
	-moz-border-radius-bottomleft: 5px;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
}

.page-paging span:last-child {
	margin-left: 0;
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	border-right: 1px solid #ccc;
	-webkit-border-top-right-radius: 5px;
	-webkit-border-bottom-right-radius: 5px;
	-moz-border-radius-topleft: 5px;
	-moz-border-radius-bottomleft: 5px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
}

.page-paging a {
	display: block;
	width: 38px;
	text-align: center;
	font-family: verdana;
	font-size: 14px;
	color: #007bff;
	text-decoration: none;
	letter-spacing: -1px;
}

.page-paging span a {
	width: 38px;
	height: 36px;
	font-size: 16px;
	text-decoration: none;
	letter-spacing: -1px;
}

.page-paging a:hover {
	color: #000;
	background: #f3f3f3;
	text-decoration: none;
}

.page-paging li.now {
	width: 38px;
	height: 38px;
	color: #fff;
	background: #007bff;
	border-top: 1px solid #007bff;
	border-bottom: 1px solid #007bff;
	font-family: verdana;
	font-size: 13px;
	text-align: center;
	box-sizing: border-box;
}
</style>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
회원관리 목록


	<div align="center">
		<hr width="50%" color="red">
		<h3>회원 테이블 게시물 전체 리스트 페이지</h3>
		<hr width="50%" color="red">
		<br>
		<table border="1" cellspacing="0" width="1000">
			<tr>
				<th>회원 번호</th>
				<th>유형(user/admin)</th>
				<th>아이디</th>
				<th>이름</th>
				<th>이메일</th>
				<th>전화번호</th>
				<th>적립금</th>
				<th>예약횟수</th>
				<th>프로필 사진</th>
				<th>가입 일자</th>
				
			</tr>
			<c:set var="list" value="${List }" />
			<c:if test="${!empty list }" />

			<c:forEach items="${list }" var="dto">

				<tr>
				
					<td>		<%-- 회원 번호 --%>
						<a href="<%= request.getContextPath() %>/admin/memberView.do?no=${dto.getMember_no() }">${dto.getMember_no() }</a>	
					</td>		
					
					<%-- 회원의 아이디가 user면 회원 저장 --%>
					<c:if test="${dto.getMember_type() == 'user'}">
						<td>회원</td>
					</c:if>
					
					<%-- 회원의 아이디가 admin면 관리자로 저장 --%>
					<c:if test="${dto.getMember_type() == 'admin'}">
						<td>관리자</td>			
					</c:if>
					
					<td>${dto.getMember_id() }</td>			<%-- 아이디 --%>
					<td>${dto.getMember_name() }</td>		<%-- 이름 --%>
					<td>${dto.getMember_email() }</td>		<%-- 이메일 --%>
					<td>${dto.getMember_phone() }</td>		<%-- 전화번호 --%>
					<td>${dto.getMember_point() }</td>		<%-- 적립금 --%>
					<td>${dto.getMember_reserv() }</td>		<%-- 예약 횟수 --%>
					
					<%-- 프로필 사진이 있으면 --%>
					<c:if test="${!empty dto.getMember_photo() }">
						<td>X</td>
					</c:if>
					<%-- 프로필 사진이 없으면 --%>
					<c:if test="${empty dto.getMember_photo() }">
						<td>X</td>
					</c:if>
					
					<td>${dto.getMember_joindate().substring(0, 10) }</td>	<%-- 가입일자 --%>
					
				</tr>
			</c:forEach>

			<c:if test="${empty list }">
				<tr>
					<td colspan="4" align="center">
						<h3>전체 게시물 리스트가 없습니다.....</h3>
					</td>
				</tr>
			</c:if>

			<tr>
				<%-- 회원 추가하는 버튼 --%>
				<td colspan="4" align="center"><input type="button" value="회원 추가"
					onclick="location.href='writeMember.do'"></td>
			</tr>
		</table>
	
				<%-- 검색 페이징 처리 영역 --%>

		<div align="center">
			<div class="page-paging">
				<c:if test="${startBlock > 1}">
					<span><a href="board_search.do?page=1&search_field=${field}&search_keyword=${keyword}">&lt;&lt;</a></span>
				</c:if>
				<c:if test="${startBlock <= 1}">
					<span class="nolink">&lt;&lt;</span>
				</c:if>

				<c:if test="${page > 1}">
					<span><a href="board_search.do?page=${page - 1}&search_field=${field}&search_keyword=${keyword}">&lt;</a></span>
				</c:if>
				<c:if test="${page <= 1}">
					<span class="nolink">&lt;</span>
				</c:if>

				<ol>
					<c:forEach begin="${startBlock}" end="${endBlock}" var="i">
						<c:if test="${i == page}">
							<li class="now">${i}</li>
						</c:if>
						<c:if test="${i != page}">
							<li><a
								href="board_search.do?page=${i}&search_field=${field}&search_keyword=${keyword}">${i}</a></li>
						</c:if>
					</c:forEach>
				</ol>

				<c:if test="${page < allPage}">
					<span><a href="board_search.do?page=${page + 1}&search_field=${field}&search_keyword=${keyword}">&gt;</a></span>
				</c:if>
				<c:if test="${page >= allPage}">
					<span class="nolink">&gt;</span>
				</c:if>

				<c:if test="${endBlock < allPage}">
					<span><a href="board_search.do?page=${allPage}&search_field=${field}&search_keyword=${keyword}">&gt;&gt;</a></span>
				</c:if>
				<c:if test="${endBlock >= allPage}">
					<span class="nolink">&gt;&gt;</span>
				</c:if>
			</div>
		</div>
		
 		<br>
 		<hr width="50%" color="red">
 		<br>
 		
 		
		<%-- 검색 기능 처리 --%>
		
		<form action="<%= request.getContextPath() %>/admin/memberSearch.do" method="post">
			
			<select name="search_field">
				<option value="type">유형</option>
				<option value="id">아이디</option>
				<option value="name">이름</option>
			</select>
			
			<input name="search_keyword">&nbsp;&nbsp;
			<input type="submit" value="검색">		
		
		</form>	
	


<jsp:include page="../layout/layout_footer.jsp" />