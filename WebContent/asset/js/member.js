/////////////////////////////////////////////////////
// 아이디/비번 찾기 선택
/////////////////////////////////////////////////////
$(function(){
    $(".member-form.find .mf-select input[type='radio']").on("click", function(){
        $(".member-form.find #fid, .member-form.find #fpw").hide();
        $(".member-form.find #f"+$(this).val()).show();
        $(".member-form.find .mf-form input[name='find_email']").focus();
        $(".member-form.find .mf-btn button span").text($(this).val());
    });

});


/////////////////////////////////////////////////////
// 회원가입
/////////////////////////////////////////////////////
$(function() {

    $.ajaxSetup({
		contentType : "application/x-www-form-urlencoded;charset=UTF-8",
		type : "post"
	});


    // 아이디 확인
    $("#join_id").on("keyup", function(){
        // $(this).parent() => div
        let joinId = $(this).val().trim();

        let id_pattern = /^[a-zA-Z0-9]{6,}$/g;
        $("#join_id").parent().find("p.error").show();

        // 아이디 중복여부 확인
        $.ajax({
            url : "memberIdCheck.do",
            data : { paramId : joinId },
            dataType : "text",

            success : function(data) {
                console.log(data);
                if(data > 0){
                    $("#join_id").parent().find("p.error").show().html("중복된 아이디입니다.");
                }else{
                    $("#join_id").parent().find("p.error").show().html("6자 이상, 영문 또는 숫자를 입력해주세요.");
                    if(!id_pattern.test(joinId)) {
                        $("#join_id").parent().find("p.error").show();
                    }else {
                        $("#join_id").parent().find("p.error").hide();
                    }
                }
            },

            error : function(e){
                alert("Error : " + e.status);
            }
        });
    });

    // 비밀번호 확인
    $("#join_pw").on("keyup", function() {
        let joinPwd = $(this).val().trim();
        let join_rePwd = $("input[name='join_pw_re']").val().trim();

        let pwd_pattern1 = /[a-zA-Z]/;
        let pwd_pattern2 = /[0-9]/;
        let pwd_pattern3 = /[~!@\#$%<>^&*]/;     // 원하는 특수문자 추가 제거
        let pwd_pattern4 = /^(?=.*[a-zA-Z])(?=.*[!@#$%^~*+=-])(?=.*[0-9]).{8,20}$/;

        console.log(joinPwd)

        // 비밀번호 조건 안 맞는 경우
        if(pwd_pattern1.test(joinPwd)) {
            $(".checked").children('li:eq(0)').addClass("on"); 
        }else {
            $(".checked").children('li:eq(0)').removeClass("on"); 
        }
        if(pwd_pattern2.test(joinPwd)) {
            $(".checked").children('li:eq(1)').addClass("on"); 
        }else {
            $(".checked").children('li:eq(1)').removeClass("on"); 
        }
        if(pwd_pattern3.test(joinPwd)) {
            $(".checked").children('li:eq(2)').addClass("on"); 
        }else {
            $(".checked").children('li:eq(2)').removeClass("on"); 
        }
        if(joinPwd.length >= 8 && joinPwd.length <= 20){
            $(".checked").children('li:eq(3)').addClass("on"); 
        }else {
            $(".checked").children('li:eq(3)').removeClass("on"); 
        }
        if(pwd_pattern4.test(joinPwd)) {
            $(".checked").children('li').addClass("on"); 
        }

        // 비밀번호 일치 쌍방 체크 필요
        if(joinPwd.length > 0 && join_rePwd.length > 0) {
            if(joinPwd == join_rePwd) {
                $("input[name='join_pw_re']").parent().find("p.error").hide();
            }else if(joinPwd != join_rePwd) {
                $("input[name='join_pw_re']").parent().find("p.error").show();
            }
        }
    });

    // 비밀번호 일치 여부 확인
    $("input[name='join_pw_re']").on("keyup", function() {
        let join_rePwd = $(this).val().trim();
        let joinPwd = $("#join_pw").val().trim();
        $(this).parent().find("p.error").hide();

        if(joinPwd.length > 0 && join_rePwd.length > 0){
            if(joinPwd == join_rePwd) {
                $("input[name='join_pw_re']").parent().find("p.error").hide();
            }else if(joinPwd != join_rePwd) {
                $("input[name='join_pw_re']").parent().find("p.error").show();
            }
        }
    });

    // 이름 확인
    $("#join_name").on("keyup", function() {
        let join_name = $(this).val().trim();
        $(this).parent().find("p.error").hide();

        if(join_name.length < 2 || join_name.length >= 10) {
            $("#join_name").parent().find("p.error").show();
        }else {
            $("#join_name").parent().find("p.error").hide();
        }
    });

    // 이메일 확인
    $("#join_email").on("keyup", function() {
        let join_email = $(this).val().trim();
        let email_pattern = /^([\w\.\_\-])*[a-zA-Z0-9]+([\w\.\_\-])*([a-zA-Z0-9])+([\w\.\_\-])+@([a-zA-Z0-9]+\.)+[a-zA-Z0-9]{2,8}$/;
        $(this).parent().find("p.error").hide();

        if(!email_pattern.test(join_email)) {
            $("#join_email").parent().find("p.error").show();
        }else {
            $("#join_email").parent().find("p.error").hide();
        }
    });

    // 전화번호 확인
    $("#join_phone").on("keyup", function() {
        let join_phone = $(this).val().trim();
        let phone_pattern = /^[0-9]{0,4}-[0-9]{3,4}-[0-9]{4}$/g;
        $(this).parent().find("p.error").hide();

        if(!phone_pattern.test(join_phone)) {
            $("#join_phone").parent().find("p.error").show();
        }else {
            $("#join_phone").parent().find("p.error").hide();
        }
    });

})
