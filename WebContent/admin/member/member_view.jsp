<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../layout/layout_header.jsp" />



			<c:set var="dto" value="${List }" />
	<div align="center">
		<hr width="50%" color="red">
		<h3>${dto.getMember_name() } 회원님 상세 페이지</h3>
		<hr width="50%" color="red">
		<br>
		
	
		<form action="<%= request.getContextPath() %>/admin/member/member_modify.jsp" method="post">	
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
				
			
				
				<c:if test="${!empty dto }" />
					<tr>
							<%-- 회원 번호 --%>
						<td>${dto.getMember_no() }</td>		
						
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
							<td>${dto.getMember_photo() }</td>
						</c:if>
						<%-- 프로필 사진이 없으면 --%>
						<c:if test="${empty dto.getMember_photo() }">
							<td>X</td>
						</c:if>
						
						<td>${dto.getMember_joindate().substring(0, 10) }</td>	<%-- 가입일자 --%>
						
					</tr>
	
				<c:if test="${empty dto }">
					<tr>
						<td colspan="4" align="center">
							<h3>전체 게시물 리스트가 없습니다.....</h3>
						</td>
					</tr>
				</c:if>
	
				<tr>
					<%-- 회원 추가하는 버튼 --%>
					<td colspan="4" align="center"><input type="submit" value="회원 수정"></td>&nbsp;&nbsp;&nbsp;
					<td colspan="4" align="center"><input type="button" value="회원 삭제" onclick="location.href='deleteMember.do'"></td>
				</tr>
			</table>
		</form>
		
	 </div>	

<jsp:include page="../layout/layout_footer.jsp" />