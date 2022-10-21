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
			<th>간략 설명</th><td><textarea name="description" cols="30" rows="10" ></textarea></td>
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
			<th>객실면적</th><td><input type="number" name="roomSize" />m<sup>2</sup></td>
		</tr>
		<tr>			
			<th>FEATURES</th>
			<td>
				<label><input type="checkbox" name="features" value="야외가구" />야외가구</label>
				<label><input type="checkbox" name="features" value="천창" />천창</label>
				<label><input type="checkbox" name="features" value="수영장" />수영장</label>
				<label><input type="checkbox" name="features" value="실내 스파" />실내 스파</label>
				<label><input type="checkbox" name="features" value="월풀 스파" />월풀 스파</label>
				<label><input type="checkbox" name="features" value="오픈 배스" />오픈 배스</label>
				<label><input type="checkbox" name="features" value="썬베드" />썬베드</label>
				<label><input type="checkbox" name="features" value="정원" />정원</label>
				<label><input type="checkbox" name="features" value="개별 BBQ 데크" />개별 BBQ 데크</label>
				<label><input type="checkbox" name="features" value="테라스" />테라스</label>
				<label><input type="checkbox" name="features" value="독립 키친" />독립 키친</label>
				<label><input type="checkbox" name="features" value="독립 화장실" />독립 화장실</label>
				<label><input type="checkbox" name="features" value="빅테이블" />빅테이블</label>
				<label><input type="checkbox" name="features" value="산책로" />산책로</label>
				<label><input type="checkbox" name="features" value="웰컴티" />웰컴티</label>
				<label><input type="checkbox" name="features" value="조식" />조식</label>
				<label><input type="checkbox" name="features" value="주차" />주차</label>
				<label><input type="checkbox" name="features" value="빔프로젝트" />빔프로젝트</label>
				<label><input type="checkbox" name="features" value="픽업" />픽업</label>
			</td>
		</tr>
		<tr>			
			<th>AMENITIES</th>
			<td>
				<label><input type="checkbox" name="amenities" value="무선 인터넷" />무선 인터넷</label>
				<label><input type="checkbox" name="amenities" value="빔 프로젝트" />빔 프로젝트</label>
				<label><input type="checkbox" name="amenities" value="TV" />TV</label>
				<label><input type="checkbox" name="amenities" value="냉장고" />냉장고</label>
				<label><input type="checkbox" name="amenities" value="세탁기" />세탁기</label>
				<label><input type="checkbox" name="amenities" value="제습기" />제습기</label>
				<label><input type="checkbox" name="amenities" value="건조기" />건조기</label>
				<label><input type="checkbox" name="amenities" value="블루투스 스피커" />블루투스 스피커</label>
				<label><input type="checkbox" name="amenities" value="헤어드라이어" />헤어드라이어</label>
				<label><input type="checkbox" name="amenities" value="전기포트" />전기포트</label>
				<label><input type="checkbox" name="amenities" value="전자레인지" />전자레인지</label>
				<label><input type="checkbox" name="amenities" value="식기세척기" />식기세척기</label>
				<label><input type="checkbox" name="amenities" value="에어컨" />에어컨</label>
				<label><input type="checkbox" name="amenities" value="인덕션" />인덕션</label>
				<label><input type="checkbox" name="amenities" value="청소기" />청소기</label>
				<label><input type="checkbox" name="amenities" value="치약" />치약</label>
				<label><input type="checkbox" name="amenities" value="샴푸" />샴푸</label>
				<label><input type="checkbox" name="amenities" value="컨디셔너" />컨디셔너</label>
				<label><input type="checkbox" name="amenities" value="바디로션" />바디로션</label>
				<label><input type="checkbox" name="amenities" value="바디워시" />바디워시</label>
				<label><input type="checkbox" name="amenities" value="샤워가운" />샤워가운</label>
				<label><input type="checkbox" name="amenities" value="빗" />빗</label>
				<label><input type="checkbox" name="amenities" value="타월" />타월</label>
				<label><input type="checkbox" name="amenities" value="세탁세제" />세탁세제</label>
				<label><input type="checkbox" name="amenities" value="모기약" />모기약</label>
				<label><input type="checkbox" name="amenities" value="연고" />연고</label>
				<label><input type="checkbox" name="amenities" value="와인오프너" />와인오프너</label>
				<label><input type="checkbox" name="amenities" value="와인잔" />와인잔</label>
				<label><input type="checkbox" name="amenities" value="토스터기" />토스터기</label>
				<label><input type="checkbox" name="amenities" value="캡슐커피머신" />캡슐커피머신</label>
				<label><input type="checkbox" name="amenities" value="보드게임" />보드게임</label>
				<label><input type="checkbox" name="amenities" value="다기" />다기</label>
				<label><input type="checkbox" name="amenities" value="조리도구" />조리도구</label>
				<label><input type="checkbox" name="amenities" value="조미료" />조미료</label>
				<label><input type="checkbox" name="amenities" value="정수기" />정수기</label>
				<label><input type="checkbox" name="amenities" value="룸 슬리퍼" />룸 슬리퍼</label>
			</td>
		</tr>
		<tr>			
			<th>ADD-ON SERVICES</th>
			<td>
				<label><input type="checkbox" name="services" value="현금영수증" />현금영수증</label>
				<label><input type="checkbox" name="services" value="BBQ" />BBQ</label>
				<label><input type="checkbox" name="services" value="조식" />조식</label>
			</td>
		</tr>
		<tr>			
			<th>사진</th> 			
			<td>
				<input type="file" name="stay_photo1" />	
				<input type="file" name="stay_photo2" />		
				<input type="file" name="stay_photo3" />		
				<input type="file" name="stay_photo4" />		
				<input type="file" name="stay_photo5" />		
			</td> 		
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="submit" value="등록하기" />
				<input type="reset" value="초기화" />
			</td>
		</tr>
	</table>
	</form>
</div>


<jsp:include page="../layout/layout_footer.jsp" />