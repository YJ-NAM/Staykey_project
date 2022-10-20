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
				<input type="checkbox" name="features" id="outdoorFurniture"><label for="outdoorFurniture">야외가구</label>
				<input type="checkbox" name="features" id="skyLight"><label for="skyLight">천창</label>
				<input type="checkbox" name="features" id="swimmingPool"><label for="swimmingPool">수영장</label>
				<input type="checkbox" name="features" id="indoorSpa"><label for="indoorSpa">실내 스파</label>
				<input type="checkbox" name="features" id="whirlpoolSpa"><label for="whirlpoolSpa">월풀 스파</label>
				<input type="checkbox" name="features" id="openBath"><label for="openBath">오픈 배스</label>
				<input type="checkbox" name="features" id="sunBed"><label for="sunBed">썬베드</label>
				<input type="checkbox" name="features" id="garden"><label for="garden">정원</label>
				<input type="checkbox" name="features" id="privateBBQDeck"><label for="privateBBQDeck">개별 BBQ 데크</label>
				<input type="checkbox" name="features" id="terrace"><label for="terrace">테라스</label>
				<input type="checkbox" name="features" id="kitchen"><label for="kitchen">독립 키친</label>
				<input type="checkbox" name="features" id="privateBathroom"><label for="privateBathroom">독립 화장실</label>
				<input type="checkbox" name="features" id="bigTable"><label for="bigTable">빅테이블</label>
				<input type="checkbox" name="features" id="walkway"><label for="walkway">산책로</label>
				<input type="checkbox" name="features" id="welcomeTea"><label for="welcomeTea">웰컴티</label>
				<input type="checkbox" name="features" id="breakfast"><label for="breakfast">조식</label>
				<input type="checkbox" name="features" id="ParkingLot"><label for="ParkingLot">주차</label>
				<input type="checkbox" name="features" id="beamProject"><label for="beamProject">빔프로젝트</label>
				<input type="checkbox" name="features" id="pickUp"><label for="pickUp">픽업</label>
			</td>
		</tr>
		<tr>			
			<th>AMENITIES</th>
			<td>
				<input type="checkbox" name="amenities" id="internet"><label for="internet">무선 인터넷</label>
				<input type="checkbox" name="amenities" id="beam"><label for="beam">빔 프로젝트</label>
				<input type="checkbox" name="amenities" id="TV"><label for="TV">TV</label>
				<input type="checkbox" name="amenities" id="fridge"><label for="fridge">냉장고</label>
				<input type="checkbox" name="amenities" id="washingMachine"><label for="washingMachine">세탁기</label>
				<input type="checkbox" name="amenities" id="dehumidifier"><label for="dehumidifier">제습기</label>
				<input type="checkbox" name="amenities" id="dryer"><label for="dryer">건조기</label>
				<input type="checkbox" name="amenities" id="bluetoothSpeaker"><label for="bluetoothSpeaker">블루투스 스피커</label>
				<input type="checkbox" name="amenities" id="hairDryer"><label for="hairDryer">헤어드라이어</label>
				<input type="checkbox" name="amenities" id="electricPot"><label for="electricPot">전기포트</label>
				<input type="checkbox" name="amenities" id="microwave"><label for="microwave">전자레인지</label>
				<input type="checkbox" name="amenities" id="dishwasher"><label for="dishwasher">식기세척기</label>
				<input type="checkbox" name="amenities" id="airConditioner"><label for="airConditioner">에어컨</label>
				<input type="checkbox" name="amenities" id="induction"><label for="induction">인덕션</label>
				<input type="checkbox" name="amenities" id="vacuum"><label for="vacuum">청소기</label>
				<input type="checkbox" name="amenities" id="toothpaste"><label for="toothpaste">치약</label>
				<input type="checkbox" name="amenities" id="shampoo"><label for="shampoo">샴푸</label>
				<input type="checkbox" name="amenities" id="conditioner"><label for="conditioner">컨디셔너</label>
				<input type="checkbox" name="amenities" id="lotion"><label for="lotion">바디로션</label>
				<input type="checkbox" name="amenities" id="bodywash"><label for="bodywash">바디워시</label>
				<input type="checkbox" name="amenities" id="gown"><label for="gown">샤워가운</label>
				<input type="checkbox" name="amenities" id="comb"><label for="comb">빗</label>
				<input type="checkbox" name="amenities" id="towel"><label for="towel">타월</label>
				<input type="checkbox" name="amenities" id="detergent"><label for="detergent">세탁세제</label>
				<input type="checkbox" name="amenities" id="repellents"><label for="repellents">모기약</label>
				<input type="checkbox" name="amenities" id="oint"><label for="oint">연고</label>
				<input type="checkbox" name="amenities" id="wineOpener"><label for="wineOpener">와인오프너</label>
				<input type="checkbox" name="amenities" id="wineglass"><label for="wineglass">와인잔</label>
				<input type="checkbox" name="amenities" id="towel"><label for="toster">토스터기</label>
				<input type="checkbox" name="amenities" id="coffeeCapsule"><label for="coffeeCapsule">캡슐커피머신</label>
				<input type="checkbox" name="amenities" id="boardGame"><label for="boardGame">보드게임</label>
				<input type="checkbox" name="amenities" id="plates"><label for="plates">다기</label>
				<input type="checkbox" name="amenities" id="utensils"><label for="utensils">조리도구</label>
				<input type="checkbox" name="amenities" id="flavouring"><label for="flavouring">조미료</label>
				<input type="checkbox" name="amenities" id="purifier"><label for="purifier">정수기</label>
				<input type="checkbox" name="amenities" id="sleepers"><label for="sleepers">룸 슬리퍼</label>
			</td>
		</tr>
		<tr>			
			<th>ADD-ON SERVICES</th>
			<td>
				<input type="checkbox" name="services" id="cashReceipt"><label for="cashReceipt">현금영수증</label>
				<input type="checkbox" name="services" id="wineglass"><label for="wineglass">BBQ</label>
				<input type="checkbox" name="services" id="breakfast"><label for="breakfast">조식</label>
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