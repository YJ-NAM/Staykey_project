<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../layout/layout_header_popup.jsp" />

<%@ page import="com.util.showArray" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
	onload = function() {

		const tagContainer = document.querySelector('.tag-container');
		const input = document.querySelector('.tag-container input');
		const remainTag = document.querySelector('.details span');
		let maxTags = 4;
		let tags = []; // 태그 값 저장할 배열 선언
		
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
			if(e.target.tagName == 'I') {
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
			// 여기서 tags 배열 값 input hidden으로 넘기기
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
	<h4>방 등록하기</h4>
	<hr />
	<form action="${ pageContext.request.contextPath }/admin/stayRoomWriteOk.do" enctype="multipart/form-data" method="post" >
	<input type="hidden" name="stayNo" value="${ param.stay_no }" /> <!-- 숙소 번호 -->
	<input type="hidden" name="room_tag" id="room_tag" value=""> <!-- tag 값 받아오기 위함 -->
	<table>
		<tr>
			<th>Room 이름</th><td><input type="text" name="room_name" /></td>
		</tr>
		<tr>
			<th>간략 설명</th><td><textarea name="room_desc" cols="30" rows="10" ></textarea></td>
		</tr>
		<tr>
			<th>방 타입</th>
			<td>
                <%
                    showArray getRoomtype = new showArray();
                    getRoomtype.getList("roomType");
                    List<String> roomType = getRoomtype.listArr;
        
                    String RTchecked = "";
                    for(int i=0; i<roomType.size(); i++){
                        if(i == 0){
                            RTchecked = " checked=\"checked\"";
                        }else{
                            RTchecked = "";
                        }
                %>
                <div class="form-check form-check-inline">
                    <label class="form-check-label"><input type="radio" name="room_type" value="<%=roomType.get(i)%>" class="form-check-input"<%=RTchecked%> /> <%=roomType.get(i)%></label>
                </div>
                <%} %>
			</td>
		</tr>
		<tr>
			<th>가격</th>
			<td><input type="text" name="room_price" />원</td>
		</tr>
		<tr>
			<th>체크인 시간</th><td><input type="time" name="room_checkin" /></td>
		</tr>
		<tr>	
			<th>체크아웃 시간</th><td><input type="time" name="room_checkout" /></td>
		</tr>
		<tr>	
			<th>기준인원</th><td><input type="number" name="room_people_min" min="1" max="15" /></td>
		</tr>
		<tr>	
			<th>최대인원</th><td><input type="number" name="room_people_max" min="1" max="15" /></td>
		</tr>
		<tr>			
			<th>객실면적</th><td><input type="number" name="room_size" />m<sup>2</sup></td>
		</tr>
		<tr>
			<th>침대 타입</th><td><input type="text" name="room_bed" /></td>
		</tr>
		<tr>			
			<th>FEATURES</th>
			<td>
                <%
                    showArray getRoomFeat = new showArray();
                    getRoomFeat.getList("roomFeat");
                    List<String> roomFeat = getRoomFeat.listArr;

                    for(int i=0; i<roomFeat.size(); i++){
                %>
                <label><input type="checkbox" name="room_features" value="<%=roomFeat.get(i)%>" /> <%=roomFeat.get(i)%></label>
                <%} %>
			</td>
		</tr>
		<tr>			
			<th>AMENITIES</th>
			<td>
                <%
                    showArray getRoomAmeni = new showArray();
                    getRoomAmeni.getList("roomAmeni");
                    List<String> roomAmeni = getRoomAmeni.listArr;

                    for(int i=0; i<roomAmeni.size(); i++){
                %>
                <label><input type="checkbox" name="room_amenities" value="<%=roomAmeni.get(i)%>" /> <%=roomAmeni.get(i)%></label>
                <%} %>
			</td>
		</tr>
		<tr>			
			<th>ADD-ON SERVICES</th>
			<td>
                <%
                    showArray getRoomService = new showArray();
                    getRoomService.getList("roomService");
                    List<String> roomService = getRoomService.listArr;

                    for(int i=0; i<roomService.size(); i++){
                %>
                <label><input type="checkbox" name="room_service" value="<%=roomService.get(i)%>" /> <%=roomService.get(i)%></label>
                <%} %>
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
				<input type="file" name="room_photo1" />	
				<input type="file" name="room_photo2" />		
				<input type="file" name="room_photo3" />		
				<input type="file" name="room_photo4" />		
				<input type="file" name="room_photo5" />		
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