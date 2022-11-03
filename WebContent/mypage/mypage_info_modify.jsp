<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../layout/layout_header.jsp" />
<jsp:include page="../mypage/mypage_header.jsp" />

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="dto" value="${member}" />

<script type="text/javascript">$("#mymenu-info").addClass("now");  

 function same_check() {
	 
    var form = document.write_form;

    if(form.mypage_pw.value.length > 0 && form.mypage_pw_re.value.length > 0){
        if(form.mypage_pw.value != form.mypage_pw_re.value){
            alert("[비밀번호]가 일치하지 않습니다.");
            form.mypage_pw.focus();
            return false;
        }
        
    }
    
    };
    
    
    
</script>
    

<h3>회원 정보 수정</h3>
<br>


		<div class="container member-form">
	    
	        
	    <form name="write_form" method="post" enctype="multipart/form-data" action="<%=request.getContextPath() %>/mypageInfoOk.do" onsubmit="return same_check();">
           <input type="hidden" name="member_id" value="${dto.member_id}" />
           <input type="hidden" name="mypage_pw_old" value="${dto.member_pw}" />
			

            프로필 사진
	        <p><input type="file" name="member_photo" class="form-control w-50" />
                <c:if test="${!empty dto.member_photo}">
               		<p class="mt-2"><img src="<%=request.getContextPath()%>${dto.member_photo}" 
              		style="max-width: 400px;" alt="" /></p>
                </c:if>
            </p>
            <br />
       
         	이메일
            <p><input type="text" name="member_email" value="${dto.member_email}" maxlength="100" class="form-control" required /></p>
        	 <br />
     
        	이름
            <p><input type="text" name="member_name" value="${dto.getMember_name()}" maxlength="50" class="form-control w-30" required /></p>
        	<br />

        	휴대전화
        	<p>
        <select class="country">
        <option value="+30">그리스 +30</option>
		<option value="+31">네덜란드 +31</option>
		<option value="+47">노르웨이 +47</option>
		<option value="+64">뉴질랜드 +64</option>
		<option value="+82">대한민국 +82</option>
		<option value="+45">덴마크 +45</option>
		<option value="+49">독일 +49</option>
		<option value="+7">러시아/카자흐스탄 +7</option>
		<option value="+60">말레이시아 +60</option>
		<option value="+1">미국/캐나다 +1</option>
		<option value="+84">베트남 +84</option>
		<option value="+32">벨기에 +32</option>
		<option value="+375">벨라루스 +375</option>
		<option value="+46">스웨덴 +46</option>
		<option value="+41">스위스 +41</option>
		<option value="+34">스페인 +34</option>
		<option value="+65">싱가포르 +65</option>
		<option value="+971">아랍에미리트 +971</option>
		<option value="+374">아르메니아 +374</option>
		<option value="+353">아일랜드 +353</option>
		<option value="+372">에스토니아 +372</option>
		<option value="+44">영국 +44</option>
		<option value="+43">오스트리아 +43</option>
		<option value="+972">이스라엘 +972</option>
		<option value="+39">이탈리아 +39</option>
		<option value="+62">인도네시아 +62</option>
		<option value="+81">일본 +81</option>
		<option value="+420">체코 +420</option>
		<option value="+385">크로아티아 +385</option>
		<option value="+886">타이완 +886</option>
		<option value="+66">태국 +66</option>
		<option value="+351">포르투갈 +351</option>
		<option value="+48">폴란드 +48</option>
		<option value="+33">프랑스 +33</option>
		<option value="+358">핀란드 +358</option>
		<option value="+63">필리핀 +63</option>
		<option value="+36">헝가리 +36</option>
		<option value="+61">호주 +61</option>
		<option value="+852">홍콩 +852</option>
		</select>
		</p>
        	<p><input type="text" name="member_phone" value="${dto.getMember_phone()}" maxlength="100" class="form-control" required /></p>
      	  <br />
        
                
                <!-- 비밀번호 영역 -->
                
               <div>
                <label for="mypage_pw">비밀번호</label>
 
				                
				<br>
                <input type="password" name="mypage_pw" id="mypage_pw" placeholder="변경할 비밀번호" required autofocus />
                <ul class="checked">
                    <li>영문</li>
                    <li>숫자</li>
                    <li>특수문자</li>
                    <li>8자 이상 20자 이하</li>
                </ul>
            </div>

            <div>
                <input type="password" name="mypage_pw_re" placeholder="변경할 비밀번호 확인" required autofocus />
                <p class="error">비밀번호가 일치하지 않습니다.</p>
            </div>
            <br>      
            
            
            <label for="check_marketing">
            	<input type="checkbox" id="check_marketing"><span>마케팅 정보 수신 동의 (선택)</span></label>     
       				<br>         
       
	       				<br> 
	    <div class="mf-btn">
	        <button type="submit" class="btn_bk"> 저장하기 </button>
	               
           	<a href="<%=request.getContextPath()%>/memberLogout.do" class="btn_wh" 
           	onClick="return confirm('로그아웃 하시겠습니까?');"> &nbsp; 로그아웃 &nbsp; </a>
        </div>
		</form>

</div>

<jsp:include page="../mypage/mypage_footer.jsp" />
<jsp:include page="../layout/layout_footer.jsp" />