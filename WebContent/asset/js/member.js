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
    $("#join_id").on("keyup", function(){
        // $(this).parent() => div
        
        let joinId = $(this).val().trim();
        let id_pattern = /^[a-zA-Z0-9]{5,}$/g;

        // 아이디 중복여부 확인
        $.ajax({
            type : "post",
            url : "memberIdCheck.do",
            data : { paramId : joinId },
            dataType : "text",

            success : function(data) {
console.log(data);
                if(data > 0){
                    $("#join_id").parent().find("p.error").show().html("중복된 아이디입니다.");
                }else{
                    if(id_pattern.test(joinId)) {
                        $("#join_id").parent().find("p.error").hide();
                    };
                }

            },

            error : function(e){
                alert(joinId);
                alert("Error : " + e.status);
            }
        });
    });
})