<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../layout/layout_header_popup.jsp" />

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="room" value="${ roomModify }" />
<script>

	onload = function() {

		const tagContainer = document.querySelector('.tag-container');
		const input = document.querySelector('.tag-container input');
		const remainTag = document.querySelector('.details span');
		let maxTags = 4;
		let tags = []; // 태그 값 저장할 배열 선언
		let old_tags = '${ room.room_tag }';
		let split_tags = old_tags.split(',');
		
		// 기존 태그 값이 있으면 tags 배열에 기존 값 저장
		if(split_tags.length > 0) {			
			tags = [...split_tags];
			addTags();
		}
		
		countTag();

		// 태그 생성 함수
		function createTag(label) { // label = typing 한 내용
			const div = document.createElement('div'); // div 생성
			div.setAttribute('class', 'tag'); // setAttribute : 속성이름, 속성값
			const span = document.createElement('span'); // span 생성
			span.innerHTML = label;
			const closeBtn = document.createElement('i'); // icon 생성
			closeBtn.setAttribute('class', 'icon-close');
			closeBtn.setAttribute('data-item', label);
			div.appendChild(span);
			div.appendChild(closeBtn);
			return div; 
			// div return
		};

		// 이전 tag 제거되지 않아 태그 중복 생성되는 문제 해결 위함
		// .tag container의 tag 삭제 -> 초기화
		function reset() {
			document.querySelectorAll('.tag').forEach(function(tag) {
				tag.parentElement.removeChild(tag);
			})
		};

		// 태그 추가 function
		function addTags() { 
			reset();
			tags.slice().reverse().forEach(function(tag) {
				const input = createTag(tag);
				tagContainer.prepend(input); // prepend 앞으로 보내는 메서드
			})
			countTag();
			
		};

		// keyup 시 input 값에서 div(class='tag') 생성 event
		input.addEventListener('keyup', function(e) {
			if(e.keyCode == 32) { // 스페이스 바
				let tagVal = input.value.trim();
				if(tagVal.length < 5 && !tags.includes(tagVal) && (tags.length < 4)){ // 글자수 조정 & 중복된 태그 없도록 & 최대 등록 개수 설정
					tags.push(tagVal); // 배열에 input.value = tagVal 값 저장
					addTags(); 
				}
				input.value = '';			
			}
		});

		// 클릭 시 삭제 
		document.addEventListener('click', function(e) {
			if(e.target.tagName == 'I'){
				const value = e.target.getAttribute('data-item');
				const index = tags.indexOf(value);
				tags = [...tags.slice(0, index), ...tags.slice(index + 1)];
				addTags();
			}
			countTag();
		})

		// 남은 태그 개수 확인
		function countTag() {
			remainTag.innerText = maxTags - tags.length; // 최대 개수 - 배열 길이
			// tags 배열 값 input hidden으로 넘기기
			if(tags.length > 0){
				document.querySelector('#room_tag').value = tags;
			}
		}
	}

</script>
<style>
	.container {
		width: 100%;
		margin: 5px;
		padding: 0;
	}

	.tag-container {
		border: 1px solid #ccc;
		padding: 3px;
		border-radius: 5px;
		display: flex;
		flex-wrap: wrap;
	}

	.tag-container .tag {
		padding: 5px;
		border: 1px solid #e3d1e1;
		margin: 5px;
		display: flex;
		align-items: center;
		border-radius: 3px;
		background: #f2f2f2;
		cursor: pointer;
	}
	
	.tag-container input[type=text]{
		background: transparent;
		width: 20px;
	}
	
	.tag i {
		font-size: 16px;
		margin-left: 5px;
	}

	.tag-container input {
		flex :1;
		font-size: 16px;
		padding: 5px;
		outline: none;
		border: 0;
	}

</style>

<div>
	<hr />
	<h4>방 수정하기</h4>
	<hr />
	<form action="${ pageContext.request.contextPath }/admin/stayRoomModifyOk.do" enctype="multipart/form-data" method="post" >
	<input type="hidden" name="stayNo" value="${ param.stay_no }" /> <!-- 숙소 번호 -->
	<input type="hidden" name="room_tag" id="room_tag" value="${ room.room_tag }"> <!-- tag 값 받아오기 위함 -->
	<table>
		<tr>
			<th>Room 이름</th><td><input type="text" name="room_name" value="${ room.room_name }" /></td>
		</tr>
		<tr>
			<th>간략 설명</th><td><textarea name="room_desc" cols="30" rows="10" >${ room.room_desc }</textarea></td>
		</tr>
		<tr>
			<th>방 타입</th>
			<td>
				<label><input type="radio" name="room_type" value="기본형" <c:if test="${ room.room_type.contains('기본형') }"> checked="checked"</c:if> /> 기본형</label>
				<label><input type="radio" name="room_type" value="거실형" <c:if test="${ room.room_type.contains('거실형') }"> checked="checked"</c:if> /> 거실형</label>
				<label><input type="radio" name="room_type" value="독채형" <c:if test="${ room.room_type.contains('독채형') }"> checked="checked"</c:if> /> 독채형</label>
				<label><input type="radio" name="room_type" value="원룸형" <c:if test="${ room.room_type.contains('원룸형') }"> checked="checked"</c:if> /> 원룸형</label>
				<label><input type="radio" name="room_type" value="투룸형" <c:if test="${ room.room_type.contains('투룸형') }"> checked="checked"</c:if> /> 투룸형</label>
				<label><input type="radio" name="room_type" value="복층형" <c:if test="${ room.room_type.contains('복층형') }"> checked="checked"</c:if> /> 복층형</label>
				<label><input type="radio" name="room_type" value="오픈형" <c:if test="${ room.room_type.contains('오픈형') }"> checked="checked"</c:if> /> 오픈형</label>
			</td>
		</tr>
		<tr>
			<th>가격</th>
			<td><input type="text" name="room_price" value="${ room.room_price }" />원</td>
		</tr>
		<tr>
			<th>체크인 시간</th><td><input type="time" name="room_checkin" value="${ room.room_checkin }" /></td>
		</tr>
		<tr>	
			<th>체크아웃 시간</th><td><input type="time" name="room_checkout" value="${ room.room_checkout }" /></td>
		</tr>
		<tr>	
			<th>기준인원</th><td><input type="number" name="room_people_min" min="1" max="15" value="${ room.room_people_min }" /></td>
		</tr>
		<tr>	
			<th>최대인원</th><td><input type="number" name="room_people_max" min="1" max="15" value="${ room.room_people_max }" /></td>
		</tr>
		<tr>			
			<th>객실면적</th><td><input type="number" name="room_size" value="${ room.room_size }" />m<sup>2</sup></td>
		</tr>
		<tr>
			<th>침대 타입</th><td><input type="text" name="room_bed" value="${ room.room_bed }" /></td>
		</tr>
		<tr>			
			<th>FEATURES</th>
			<td>
				<label><input type="checkbox" name="room_features" value="야외가구" <c:if test="${ room.room_features.contains('야외가구') }"> checked="checked"</c:if> /> 야외가구</label>
				<label><input type="checkbox" name="room_features" value="천창" <c:if test="${ room.room_features.contains('천창') }"> checked="checked"</c:if> /> 천창</label>
				<label><input type="checkbox" name="room_features" value="수영장" <c:if test="${ room.room_features.contains('수영장') }">  checked="checked"</c:if> /> 수영장</label>
				<label><input type="checkbox" name="room_features" value="실내 스파" <c:if test="${ room.room_features.contains('실내 스파') }"> checked="checked"</c:if> /> 실내 스파</label>
				<label><input type="checkbox" name="room_features" value="월풀 스파" <c:if test="${ room.room_features.contains('월풀 스파') }"> checked="checked"</c:if> /> 월풀 스파</label>
				<label><input type="checkbox" name="room_features" value="오픈 배스" <c:if test="${ room.room_features.contains('오픈 배스') }"> checked="checked"</c:if> /> 오픈 배스</label>
				<label><input type="checkbox" name="room_features" value="썬베드" <c:if test="${ room.room_features.contains('썬베드') }"> checked="checked"</c:if> /> 썬베드</label>
				<label><input type="checkbox" name="room_features" value="정원" <c:if test="${ room.room_features.contains('정원') }"> checked="checked"</c:if> /> 정원</label>
				<label><input type="checkbox" name="room_features" value="개별 BBQ 데크" <c:if test="${ room.room_features.contains('개별 BBQ 데크') }"> checked="checked"</c:if> /> 개별 BBQ 데크</label>
				<label><input type="checkbox" name="room_features" value="픽업" <c:if test="${ room.room_features.contains('픽업') }"> checked="checked"</c:if> /> 픽업</label>
				<label><input type="checkbox" name="room_features" value="테라스" <c:if test="${ room.room_features.contains('테라스') }"> checked="checked"</c:if> /> 테라스</label>
				<label><input type="checkbox" name="room_features" value="독립 키친" <c:if test="${ room.room_features.contains('독립 키친') }"> checked="checked"</c:if> /> 독립 키친</label>
				<label><input type="checkbox" name="room_features" value="독립 화장실" <c:if test="${ room.room_features.contains('독립 화장실') }"> checked="checked"</c:if> /> 독립 화장실</label>
				<label><input type="checkbox" name="room_features" value="빅테이블" <c:if test="${ room.room_features.contains('빅테이블') }"> checked="checked"</c:if> /> 빅테이블</label>
				<label><input type="checkbox" name="room_features" value="산책로" <c:if test="${ room.room_features.contains('산책로') }"> checked="checked"</c:if> /> 산책로</label>
				<label><input type="checkbox" name="room_features" value="웰컴티" <c:if test="${ room.room_features.contains('웰컴티') }"> checked="checked"</c:if> /> 웰컴티</label>
				<label><input type="checkbox" name="room_features" value="조식" <c:if test="${ room.room_features.contains('조식') }"> checked="checked"</c:if> /> 조식</label>
				<label><input type="checkbox" name="room_features" value="주차" <c:if test="${ room.room_features.contains('주차') }"> checked="checked"</c:if> /> 주차</label>
				<label><input type="checkbox" name="room_features" value="빔프로젝트" <c:if test="${ room.room_features.contains('빔프로젝트') }"> checked="checked"</c:if> /> 빔프로젝트</label>
			</td>
		</tr>
		<tr>			
			<th>AMENITIES</th>
			<td>
				<label><input type="checkbox" name="room_amenities" value="무선 인터넷" <c:if test="${ room.room_amenities.contains('무선 인터넷') }"> checked="checked"</c:if> /> 무선 인터넷</label>
				<label><input type="checkbox" name="room_amenities" value="빔 프로젝트" <c:if test="${ room.room_amenities.contains('빔 프로젝트') }"> checked="checked"</c:if> /> 빔 프로젝트</label>
				<label><input type="checkbox" name="room_amenities" value="TV" <c:if test="${ room.room_amenities.contains('TV') }"> checked="checked"</c:if> /> TV</label>
				<label><input type="checkbox" name="room_amenities" value="냉장고" <c:if test="${ room.room_amenities.contains('냉장고') }"> checked="checked"</c:if> /> 냉장고</label>
				<label><input type="checkbox" name="room_amenities" value="세탁기" <c:if test="${ room.room_amenities.contains('세탁기') }"> checked="checked"</c:if> /> 세탁기</label>
				<label><input type="checkbox" name="room_amenities" value="제습기" <c:if test="${ room.room_amenities.contains('제습기') }"> checked="checked"</c:if> /> 제습기</label>
				<label><input type="checkbox" name="room_amenities" value="건조기" <c:if test="${ room.room_amenities.contains('건조기') }"> checked="checked"</c:if> /> 건조기</label>
				<label><input type="checkbox" name="room_amenities" value="블루투스 스피커" <c:if test="${ room.room_amenities.contains('블루투스 스피커') }"> checked="checked"</c:if> /> 블루투스 스피커</label>
				<label><input type="checkbox" name="room_amenities" value="헤어드라이어" <c:if test="${ room.room_amenities.contains('헤어드라이어') }"> checked="checked"</c:if> /> 헤어드라이어</label>
				<label><input type="checkbox" name="room_amenities" value="전기포트" <c:if test="${ room.room_amenities.contains('전기포트') }"> checked="checked"</c:if> /> 전기포트</label>
				<label><input type="checkbox" name="room_amenities" value="전자레인지" <c:if test="${ room.room_amenities.contains('전자레인지') }"> checked="checked"</c:if> /> 전자레인지</label>
				<label><input type="checkbox" name="room_amenities" value="식기세척기" <c:if test="${ room.room_amenities.contains('식기세척기') }"> checked="checked"</c:if> /> 식기세척기</label>
				<label><input type="checkbox" name="room_amenities" value="에어컨" <c:if test="${ room.room_amenities.contains('에어컨') }"> checked="checked"</c:if> /> 에어컨</label>
				<label><input type="checkbox" name="room_amenities" value="인덕션" <c:if test="${ room.room_amenities.contains('인덕션') }"> checked="checked"</c:if> /> 인덕션</label>
				<label><input type="checkbox" name="room_amenities" value="청소기" <c:if test="${ room.room_amenities.contains('청소기') }"> checked="checked"</c:if> /> 청소기</label>
				<label><input type="checkbox" name="room_amenities" value="치약" <c:if test="${ room.room_amenities.contains('치약') }"> checked="checked"</c:if> /> 치약</label>
				<label><input type="checkbox" name="room_amenities" value="샴푸" <c:if test="${ room.room_amenities.contains('샴푸') }"> checked="checked"</c:if> /> 샴푸</label>
				<label><input type="checkbox" name="room_amenities" value="컨디셔너" <c:if test="${ room.room_amenities.contains('컨디셔너') }"> checked="checked"</c:if> /> 컨디셔너</label>
				<label><input type="checkbox" name="room_amenities" value="바디로션" <c:if test="${ room.room_amenities.contains('바디로션') }"> checked="checked"</c:if> /> 바디로션</label>
				<label><input type="checkbox" name="room_amenities" value="바디워시" <c:if test="${ room.room_amenities.contains('바디워시') }"> checked="checked"</c:if> /> 바디워시</label>
				<label><input type="checkbox" name="room_amenities" value="샤워가운" <c:if test="${ room.room_amenities.contains('샤워가운') }"> checked="checked"</c:if> /> 샤워가운</label>
				<label><input type="checkbox" name="room_amenities" value="빗" <c:if test="${ room.room_amenities.contains('빗') }"> checked="checked"</c:if> /> 빗</label>
				<label><input type="checkbox" name="room_amenities" value="타월" <c:if test="${ room.room_amenities.contains('타월') }"> checked="checked"</c:if> /> 타월</label>
				<label><input type="checkbox" name="room_amenities" value="세탁세제" <c:if test="${ room.room_amenities.contains('세탁세제') }"> checked="checked"</c:if>/> 세탁세제</label>
				<label><input type="checkbox" name="room_amenities" value="모기약" <c:if test="${ room.room_amenities.contains('모기약') }"> checked="checked"</c:if> /> 모기약</label>
				<label><input type="checkbox" name="room_amenities" value="연고" <c:if test="${ room.room_amenities.contains('연고') }"> checked="checked"</c:if> /> 연고</label>
				<label><input type="checkbox" name="room_amenities" value="룸 슬리퍼" <c:if test="${ room.room_amenities.contains('룸 슬리퍼') }"> checked="checked"</c:if> /> 룸 슬리퍼</label>
				<label><input type="checkbox" name="room_amenities" value="와인오프너" <c:if test="${ room.room_amenities.contains('와인오프너') }"> checked="checked"</c:if> /> 와인오프너</label>
				<label><input type="checkbox" name="room_amenities" value="와인잔" <c:if test="${ room.room_amenities.contains('와인잔') }"> checked="checked"</c:if> /> 와인잔</label>
				<label><input type="checkbox" name="room_amenities" value="토스터기" <c:if test="${ room.room_amenities.contains('토스터기') }"> checked="checked"</c:if> /> 토스터기</label>
				<label><input type="checkbox" name="room_amenities" value="캡슐커피머신" <c:if test="${ room.room_amenities.contains('캡슐커피머신') }"> checked="checked"</c:if> /> 캡슐커피머신</label>
				<label><input type="checkbox" name="room_amenities" value="보드게임" <c:if test="${ room.room_amenities.contains('보드게임') }"> checked="checked"</c:if> /> 보드게임</label>
				<label><input type="checkbox" name="room_amenities" value="다기" <c:if test="${ room.room_amenities.contains('다기') }"> checked="checked"</c:if> /> 다기</label>
				<label><input type="checkbox" name="room_amenities" value="조리도구" <c:if test="${ room.room_amenities.contains('조리도구') }"> checked="checked"</c:if> /> 조리도구</label>
				<label><input type="checkbox" name="room_amenities" value="조미료" <c:if test="${ room.room_amenities.contains('조미료') }"> checked="checked"</c:if> /> 조미료</label>
				<label><input type="checkbox" name="room_amenities" value="정수기" <c:if test="${ room.room_amenities.contains('정수기') }"> checked="checked"</c:if> /> 정수기</label>
			</td>
		</tr>
		<tr>			
			<th>ADD-ON SERVICES</th>
			<td>
				<label><input type="checkbox" name="room_service" value="현금영수증" <c:if test="${ room.room_service.contains('현금영수증') }"> checked="checked"</c:if> /> 현금영수증</label>
				<label><input type="checkbox" name="room_service" value="BBQ" <c:if test="${ room.room_service.contains('BBQ') }"> checked="checked"</c:if> /> BBQ</label>
				<label><input type="checkbox" name="room_service" value="조식" <c:if test="${ room.room_service.contains('조식') }"> checked="checked"</c:if> /> 조식</label>
			</td>
		</tr>
		<tr>
			<th>TAGS</th>
		    <td>
			    <div class="container">
			    	태그를 입력한 후 스페이스 바를 누르세요.
			    	<div class="tag-container" >
			    		<!-- 글자 입력 시 placeholder 사라짐 -->
			    		<input type="text" placeholder="한 태그 당 최대 4글자까지 입력 가능합니다." onfocus="this.placeholder=''" />
			    	</div>	
			    	<div class="details">
			    		<p>등록 가능한 태그 : <span>4</span></p>
			    	</div>		    
			    </div>
		    </td>
		</tr>
		<tr>			
			<th>사진</th> 			
			<td>
				<c:if test="${ !empty room.room_photo1 }">
				<p><img src="${ pageContext.request.contextPath }/${ room.room_photo1 }" alt="" width="100px" height="100px"/></p>
	          	</c:if>
	            <input type="file" name="room_photo1" class="form-control w-50" />	
	            <c:if test="${ !empty room.room_photo2 }">
				<p><img src="${ pageContext.request.contextPath }/${ room.room_photo2 }" alt="" width="100px" height="100px"/></p>
	          	</c:if>
	            <input type="file" name="room_photo2" class="form-control w-50" />	
	            <c:if test="${ !empty room.room_photo3 }">
				<p><img src="${ pageContext.request.contextPath }/${ room.room_photo3 }" alt="" width="100px" height="100px"/></p>
	          	</c:if>
	            <input type="file" name="room_photo3" class="form-control w-50" />	
	            <c:if test="${ !empty room.room_photo4 }">
				<p><img src="${ pageContext.request.contextPath }/${ room.room_photo4 }" alt="" width="100px" height="100px"/></p>
	          	</c:if>
	            <input type="file" name="room_photo4" class="form-control w-50" />	
	          	<c:if test="${ !empty room.room_photo5 }">
				<p><img src="${ pageContext.request.contextPath }/${ room.room_photo5 }" alt="" width="100px" height="100px"/></p>
	          	</c:if>
	            <input type="file" name="room_photo5" class="form-control w-50" />	
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