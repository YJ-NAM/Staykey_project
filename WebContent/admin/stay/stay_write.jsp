<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../layout/layout_header.jsp" />

<div>
	<hr />
	<h4>숙소 등록하기</h4>
	<hr />
	<form action="${ pageContext.request.contextPath }/admin/stayWrite.do" enctype="multipart/form-data" method="post">
	<table>
		<tr>
			<th>숙소명</th><td><input type="text" name="name" /></td>
		</tr>
		<tr>
			<th>간략 설명</th><td><textarea name="" id="" cols="30" rows="10" ></textarea></td>
		</tr>
		<tr>
			<th>체크인 시간</th><td><input type="time" name="checkIn" /></td>
		</tr>
		<tr>	
			<th>체크아웃 시간</th><td><input type="time" name="checkOut" /></td>
		</tr>
		<tr>	
			<th>기준인원</th><td><input type="number" min="1" max="15" name="standardNumber" /></td>
		</tr>
		<tr>	
			<th>최대인원</th><td><input type="number" min="1" max="15" name="maxNumber" /></td>
		</tr>
		<tr>			
			<th>객실면적</th><td><input type="number" name="size" /></td>
		</tr>
		<tr>			
			<th>방 특징</th><td><textarea name="" id="" cols="30" rows="10"></textarea></td>
		</tr>
		<tr>			
			<th>어메니티</th>
			<td>
				<input type="checkbox" id="towel"><label for="towel">타월</label>
				<input type="checkbox" id="towel"><label for="towel">타월</label>
				<input type="checkbox" id="towel"><label for="towel">타월</label>
				<input type="checkbox" id="towel"><label for="towel">타월</label>
				<input type="checkbox" id="towel"><label for="towel">타월</label>
				<input type="checkbox" id="towel"><label for="towel">타월</label>
				<input type="checkbox" id="towel"><label for="towel">타월</label>
				<input type="checkbox" id="towel"><label for="towel">타월</label>
				<input type="checkbox" id="towel"><label for="towel">타월</label>
				<input type="checkbox" id="towel"><label for="towel">타월</label>
				<input type="checkbox" id="towel"><label for="towel">타월</label>
				<input type="checkbox" id="towel"><label for="towel">타월</label>
				<input type="checkbox" id="towel"><label for="towel">타월</label>
				<input type="checkbox" id="towel"><label for="towel">타월</label>
				<input type="checkbox" id="towel"><label for="towel">타월</label>
				<input type="checkbox" id="towel"><label for="towel">타월</label>
				<input type="checkbox" id="towel"><label for="towel">타월</label>
				<input type="checkbox" id="towel"><label for="towel">타월</label>
				<input type="checkbox" id="towel"><label for="towel">타월</label>
				<input type="checkbox" id="towel"><label for="towel">타월</label>
				<input type="checkbox" id="towel"><label for="towel">타월</label>
				<input type="checkbox" id="towel"><label for="towel">타월</label>
				<input type="checkbox" id="towel"><label for="towel">타월</label>
				<input type="checkbox" id="towel"><label for="towel">타월</label>
				<input type="checkbox" id="towel"><label for="towel">타월</label>
				<input type="checkbox" id="towel"><label for="towel">타월</label>
				<input type="checkbox" id="towel"><label for="towel">타월</label>
				<input type="checkbox" id="towel"><label for="towel">타월</label>
				<input type="checkbox" id="towel"><label for="towel">타월</label>
				<input type="checkbox" id="towel"><label for="towel">타월</label>
				<input type="checkbox" id="towel"><label for="towel">타월</label>
			</td>
		</tr>
		<tr>			
			<th>서비스</th><td></td>
		</tr>
		<tr>			
			<th><input type="file" /></th> 
		</tr>
		<tr>			
			<th><input type="file" /></th> 
		</tr>
		<tr>			
			<th><input type="file" /></th> 
		</tr>
		<tr>			
			<th><input type="file" /></th> 
		</tr>
		<tr>			
			<th><input type="file" /></th> 
		</tr>
	</table>
	</form>
</div>


<jsp:include page="../layout/layout_footer.jsp" />