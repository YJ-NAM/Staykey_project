<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../layout/layout_header.jsp" />



<script type="text/javascript">
$("#nav-magazine").addClass("now");


$(function(){
	$("input[name='member_id']").keyup(function(){
        let userId = $(this).val();

        if($.trim(userId).length < 4){
            $("#idchk-txt").html("<span class=\"text-danger\">* 아이디는 4글자 이상이어야 합니다.</span>");
            return false;
        }

        // 아이디 중복여부 확인
        $.ajax({
            type : "post",
            url : "<%=request.getContextPath()%>/memberIdCheck.do",
            data : { paramId : userId },
            datatype : "html",

            success : function(data){
            	console.log(data);
                let ajaxTxt = "";
                if(data.trim() > 0){
                    ajaxTxt = "<span class=\"text-danger\">* 이미 사용중인 아이디입니다.</span>";
                }else{
                    ajaxTxt = "<span class=\"text-primary\">* 사용 할 수 있는 아이디입니다.</span>";
                }
                $("#idchk-txt").html(ajaxTxt);
            },

            error : function(e){
                alert("Error : " + e.status);
            }
        });
	});
});


join_check = function(){
    var form = document.write_form;

    if(form.member_pw.value.length > 0 && form.member_pw_re.value.length > 0){
        if(form.member_pw.value != form.member_pw_re.value){
            alert("[비밀번호]가 일치하지 않습니다.");
            form.member_pw.focus();
            return false;
        }
    }

    if(form.member_email.value == ""){
        alert("[이메일]을 입력해 주세요.");
        form.member_email.focus();
        return false;
    }

    // 이메일 형식 체크
    var TEmailChk = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    if(form.member_email.value.match(TEmailChk) != null){
    }else{
        alert("잘못된 이메일 형식입니다.\n[이메일]을 다시 입력해 주세요.");
        form.member_email.focus();
        return false;
    }

    form.submit();
};
</script>



<div class="d-flex justify-content flex-wrap flex-md-nowrap align-items-center pt-4 pb-2 mb-4 border-bottom">
    <h2>매거진 등록</h2>
    <small>매거진을 추가 할 수 있습니다.</small>
</div>


  

<div class="pb100">
    <form name="write_form" method="post" enctype="multipart/form-data" action="<%=request.getContextPath() %>/admin/magazineWriteOk.do" onsubmit="return join_check();">
    <table class="table-form mt-3">
        <colgroup>
            <col width="16%" />
            <col width="34%" />
            <col width="16%" />
            <col />
        </colgroup>


         <tr>
            <th>메인 이미지</th>
            <td colspan="3"> <input type="file" name="mag_mainimg" class="form-control w-50" required /></td>
     	 </tr>
        
         <tr>
            <td colspan="4" class="space" nowrap="nowrap"></td>
       	 </tr> 
        
         <tr>
            <th>메인 문구</th>
            <td colspan="3"> <input type="text" name="mag_mainwords" class="form-control w-50" required /></td>
     	 </tr>
        
         <tr>
            <td colspan="4" class="space" nowrap="nowrap"></td>
       	 </tr>

     	<tr>
        <th>소개 동영상</th>
        <td>  
            <div>
                <span class="line_h35">https://youtu.be/  </span>
                <input type="text" name="mv_the_origin_url" id="mv_the_origin_url" style="width:150px"/>
            </div>  
            <p class="mt_10">*ID를 정확히 입력해야 Player 및 썸네일 이미지가 정상적으로 출력이 됩니다.</p>
            <p>유튜브 주소 ID를 입력하지 않으면 기존에 등록한 썸네일 이미지로 출력이 됩니다.</p>   
        </td>
    </tr>
    <tr>
    
          <tr>
            <th>첫 번째 이미지</th>
            <td colspan="3"> <input type="file" name="mag_firstimg" required /></td>
     	 </tr>
    
    	<tr>
        <th> 첫 번째 글 내용 </th>
        <td>  
            <textarea name="mag_firstcont" cols="100" rows="5"> </textarea>
        </td>
 	   </tr>
     	 
     	 <tr>
            <td colspan="4" class="space" nowrap="nowrap"></td>
       	 </tr>
    
          <tr>
            <th>두 번째 이미지</th>
            <td colspan="3"> <input type="file" name="mag_secondimg" required /></td>
     	 </tr>
    
    	<tr>
        <th> 두 번째 글 내용 </th>
        <td>  
            <textarea name="mag_secondcont" cols="100" rows="5"> </textarea>
        </td>
 	   </tr>
     	 
     	 <tr>
            <td colspan="4" class="space" nowrap="nowrap"></td>
       	 </tr>
       	 
       	 <tr>
            <th>지도</th>
            <td colspan="3"> <input type="file" name="mag_secondimg" required /></td>
     	 </tr>
     	 
     	 
     	 
        
         <tr>
            <td colspan="4" class="space" nowrap="nowrap"></td>
       	 </tr> 
        
         <tr>
            <th>메인 문구</th>
            <td colspan="3"> <input type="text" name="mag_mainwords" class="form-control w-50" required /></td>
     	 </tr>
        
         <tr>
            <td colspan="4" class="space" nowrap="nowrap"></td>
       	 </tr>


        
        
        
     	   
   
        

    </table>



    <div class="gw-button">
        <div class="gwb-wrap">
            <div class="gwb-left"></div>

            <div class="gwb-center">
                <button type="button" class="btn btn-lg btn-outline-secondary mx-1" onclick="history.back();"><i class="fa fa-bars"></i> 목록보기</button>
                <button type="submit" class="btn btn-lg btn-primary mx-1"><i class="fa fa-pencil"></i> 등록하기</button>
            </div>

            <div class="gwb-right"></div>
        </div>
    </div>
    </form>
</div>





<jsp:include page="../layout/layout_footer.jsp" />