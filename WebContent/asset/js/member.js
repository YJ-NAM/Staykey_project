/////////////////////////////////////////////////////
// 회원 관련
/////////////////////////////////////////////////////



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





