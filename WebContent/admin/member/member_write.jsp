<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../layout/layout_header.jsp" />


<script type="text/javascript">$("#nav-member").addClass("now");</script>

	<div align="center">
		<hr width="50%" color="red">
			<h3>회원 등록 페이지</h3>	
		<hr width="50%" color="red">
		<br>
		
		<form action="<%= request.getContextPath() %>/admin/memberWrite.do" method="post" enctype="multipart/form-data">
		
			<table border="1" cellspacing="0" width="350"> 
				<tr> 
					<th>회원 유형</th>
					<td> 
						<select name="type">
							<option value="user">유저</option>
							<option value="admin">관리자</option>
						</select>
					</td>
				</tr>
			
				<tr> 
					<th>회원 아이디</th>
					<td> 
						<input name="id">
					</td>
				</tr>
			
				<tr> 
					<th>비밀번호</th>
					<td> 
						<input type="password" name="pw">
					</td>
				</tr>
			
				<tr> 
					<th>이름</th>
					<td> 
						<input name="name">
					</td>
				</tr>
				
				<tr> 
					<th>이메일</th>
					<td> 
						<input name="email">
					</td>
				</tr>
			
				<tr> 
					<th>연락처</th>
					<td> 
						<input name="phone">
					</td>
				</tr>
			
				<tr> 
					<th>프로필 사진</th>
					<td> 
						<input name="photo" type="file">
					</td>
				</tr>
			
				<tr> 
					<td colspan="2" align="center">
						<input type="submit" value="유저 등록">
						&nbsp;&nbsp;&nbsp;
						<input type="reset" value="다시작성">
					</td>	
				</tr>
				
			</table>
		
		</form>
		
	</div>







<jsp:include page="../layout/layout_footer.jsp" />