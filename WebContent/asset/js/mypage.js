
// 마이페이지


/////////////////////////////////////////////////////
// 회원 정보 수정
/////////////////////////////////////////////////////

$(function() {

    $.ajaxSetup({
		contentType : "application/x-www-form-urlencoded;charset=UTF-8",
		type : "post"
	});
 

    // 비밀번호 확인
    $("#mypage_pw").on("keyup", function() {
        let mypagePwd = $(this).val().trim();
        let mypage_rePwd = $("input[name='mypage_pw_re']").val().trim();

        let pwd_pattern1 = /[a-zA-Z]/;
        let pwd_pattern2 = /[0-9]/;
        let pwd_pattern3 = /[~!@\#$%<>^&*]/;     // 원하는 특수문자 추가 제거
        let pwd_pattern4 = /^(?=.*[a-zA-Z])(?=.*[!@#$%^~*+=-])(?=.*[0-9]).{8,20}$/;

        console.log(mypagePwd)

        // 비밀번호 조건 안 맞는 경우
        if(pwd_pattern1.test(mypagePwd)) {
            $(".checked").children('li:eq(0)').addClass("on"); 
        }else {
            $(".checked").children('li:eq(0)').removeClass("on"); 
        }
        if(pwd_pattern2.test(mypagePwd)) {
            $(".checked").children('li:eq(1)').addClass("on"); 
        }else {
            $(".checked").children('li:eq(1)').removeClass("on"); 
        }
        if(pwd_pattern3.test(mypagePwd)) {
            $(".checked").children('li:eq(2)').addClass("on"); 
        }else {
            $(".checked").children('li:eq(2)').removeClass("on"); 
        }
        if(mypagePwd.length >= 8 && mypagePwd.length <= 20){
            $(".checked").children('li:eq(3)').addClass("on"); 
        }else {
            $(".checked").children('li:eq(3)').removeClass("on"); 
        }
        if(pwd_pattern4.test(mypagePwd)) {
            $(".checked").children('li').addClass("on"); 
        }

        // 비밀번호 일치 쌍방 체크 필요
        if(mypagePwd.length > 0 && mypage_rePwd.length > 0) {
            if(mypagePwd == mypage_rePwd) {
                $("input[name='mypage_pw_re']").parent().find("p.error").hide();
            }else if(mypagePwd != mypage_rePwd) {
                $("input[name='mypage_pw_re']").parent().find("p.error").show();
            }
        }
    });

    // 비밀번호 일치 여부 확인
    $("input[name='mypage_pw_re']").on("keyup", function() {
        let mypage_rePwd = $(this).val().trim();
        let mypagePwd = $("#mypage_pw").val().trim();
        $(this).parent().find("p.error").hide();

        if(mypagePwd.length > 0 && mypage_rePwd.length > 0){
            if(mypagePwd == mypage_rePwd) {
                $("input[name='mypage_pw_re']").parent().find("p.error").hide();
            }else if(mypagePwd != mypage_rePwd) {
                $("input[name='mypage_pw_re']").parent().find("p.error").show();
            }
        }
        
    });

   
});

/////////////////////////////////////////////////////
// 회원가입 유효성 검사
/////////////////////////////////////////////////////
function validateForm(form) {
    
    let mypageId = form.mypage_id.value.trim();
    let error = false;

    
    // ========== 비밀번호 유효성 검사 ===========
    let pwd_pattern = /^(?=.*[a-zA-Z])(?=.*[!@#$%^~*+=-])(?=.*[0-9]).{8,20}$/;
    if(!pwd_pattern.test(form.mypage_pw.value)){
        alert("비밀번호 작성 조건에 부합하지 않습니다. 다시 확인해주세요.");
        form.mypage_pw.focus();
        return false;
    }

    // ========== 비밀번호 체크 유효성 검사 ===========
    if(form.mypage_pw.value.length > 0 && form.mypage_pw_re.value.length > 0){
        if(form.mypage_pw.value != form.mypage_pw_re.value){
            alert("비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
            form.mypage_pw.focus();
            return false;
        }
    }

}

