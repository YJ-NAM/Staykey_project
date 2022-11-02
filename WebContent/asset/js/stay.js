/////////////////////////////////////////////////////
// 숙소 관련
/////////////////////////////////////////////////////
$(document).ready(function(){
    // 오늘 날짜
    let getToday = new Date();
    let gYear = getToday.getFullYear();
    let gMonth = getToday.getMonth() + 1;
    let gDate = getToday.getDate();



    // 숙소 목록 페이지에서 작동 시
    // 숙소 예약 날짜 선택
    $("#ps_start, #ps_end").daterangepicker({
        locale: {
            "separator": "/",
            "format": 'YYYY-MM-DD',
            "applyLabel": "확인",
            "cancelLabel": "취소",
            "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
            "monthNames": ["01월", "02월", "03월", "04월", "05월", "06월", "07월", "08월", "09월", "10월", "11월", "12월"]
        },
        minDate: gYear+"/"+gMonth+"/"+gDate,
        maxDate: (gYear+1)+"/"+gMonth+"/"+gDate,
        autoApply: true,
        opens: 'center',
        timePicker: false,
        showDropdowns: false,
        singleDatePicker: false,
        isCustomDate : function(){}
    });

    // 날짜 선택 적용 시
    $("#ps_start, #ps_end").on("apply.daterangepicker", function(ev, picker){
        let sdate = picker.startDate.format('YYYY-MM-DD');
        let edate = picker.endDate.format('YYYY-MM-DD');

        $(".stay-search input[name='ps_start']").val(sdate);
        $(".stay-search input[name='ps_end']").val(edate);
        $("#ps_start").text(sdate.replaceAll("-", ". "));
        $("#ps_end").text(edate.replaceAll("-", ". "));
    });


    // 인원 선택 클릭
    $("#ps_people").on("click", function(){
        $("#selectNumber").toggleClass("open");
    });

    // 인원 선택 적용하기 버튼
    $(".stay-search #selectNumber .btn-number-search").on("click", function(){
        const getAdult = Number($(".stay-search #selectNumber input[name='ps_people_adult']").val());
        const getKid = Number($(".stay-search #selectNumber input[name='ps_people_kid']").val());
        const getBaby = Number($(".stay-search #selectNumber input[name='ps_people_baby']").val());
        let setPeople = "선택하세요";

        if(getAdult > 0 || getKid > 0 || getBaby > 0){
            setPeople = "성인 : " + getAdult + ", 아동 : " + getKid + ", 영아 : " + getBaby;
        }

        $("#ps_people").text(setPeople);
        $("#selectNumber").removeClass("open");
    });



    // 수량 증가 버튼
    $(".stay-search .layer-select .number-count .btn-plus").on("click", function(){
        const inputNum = $(this).parent().find(".input-num input");
        const maxVal = Number(inputNum.attr("max"));
        const plusVal = Number(inputNum.val()) + 1;

        if(plusVal >= maxVal){
            inputNum.val(maxVal);
        }else{
            inputNum.val(plusVal);
        }
    });

    // 수량 차감 버튼
    $(".stay-search .layer-select .number-count .btn-minus").on("click", function(){
        const inputNum = $(this).parent().find(".input-num input");
        const minVal = Number(inputNum.attr("min"));
        const minusVal = Number(inputNum.val()) - 1;

        if(minusVal <= minVal){
            inputNum.val(minVal);
        }else{
            inputNum.val(minusVal);
        }
    });

    // 수량 직접 입력 체크
    $(".stay-search .layer-select .number-count input[type='number']").on("keyup", function(){
        const minVal = Number($(this).attr("min"));
        const maxVal = Number($(this).attr("max"));
        const nowVal = Number($(this).val());

        if(nowVal >= maxVal){
            $(this).val(maxVal);
        }else if(nowVal <= minVal){
            $(this).val(minVal);
        }else{
            $(this).val(nowVal);
        }
    });


    // 닫기 버튼
    $(".stay-search .layer-select .btn-close").on("click", function(){
        $(this).parent().removeClass("open");
    });




    // 가격 범위 클릭
    $("#ps_price").on("click", function(){
        $("#selectPrice").toggleClass("open");
    });

    // 가격 범위 적용하기 버튼
    $(".stay-search #selectPrice .btn-number-search").on("click", function(){
        const getMin = Number($(".stay-search #selectPrice input[name='ps_price_min']").val() + "0000");
        const getMax = Number($(".stay-search #selectPrice input[name='ps_price_max']").val() + "0000");
        let setPrice = "가격범위";

        if(getMin > 0 && getMax > 0){
            setPrice = setComma(getMin) + " ~ " + setComma(getMax);
        }

        $("#ps_price").text(setPrice);
        $("#selectPrice").removeClass("open");
    });




    // 스테이 유형 클릭
    $("#ps_type").on("click", function(){
        $("#selectType").toggleClass("open");
    });

    // 스테이 유형 적용하기 버튼
    $(".stay-search #selectType .btn-number-search").on("click", function(){
        let setTpe = "스테이 유형";

        $("#ps_type").text(setTpe);
        $("#selectType").removeClass("open");
    });




    // Room 보기 페이지에서 작동 시
    // 숙소 예약 날짜 선택
    $(".srt-date").daterangepicker({
        locale: {
            "separator": "/",
            "format": 'YYYY-MM-DD',
            "applyLabel": "확인",
            "cancelLabel": "취소",
            "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
            "monthNames": ["01월", "02월", "03월", "04월", "05월", "06월", "07월", "08월", "09월", "10월", "11월", "12월"]
        },
        minDate: gYear+"/"+gMonth+"/"+gDate,
        maxDate: (gYear+1)+"/"+gMonth+"/"+gDate,
        autoApply: true,
        opens: 'center',
        timePicker: false,
        showDropdowns: false,
        singleDatePicker: false,
        isCustomDate : function(){}
    });

    // 날짜 선택 적용 시
    $(".srt-date").on("apply.daterangepicker", function(ev, picker){
        let sdate = picker.startDate.format('YYYY-MM-DD');
        let edate = picker.endDate.format('YYYY-MM-DD');
        const date1 = new Date(sdate);
        const date2 = new Date(edate);

        const diffDate = date1.getTime() - date2.getTime();
        const between = Math.abs(diffDate / (1000 * 60 * 60 * 24));

        $(this).html(sdate.replaceAll("-", ". ") + " - " + edate.replaceAll("-", ". ") + "<em>" + between + "박 " + (between+1) + "일</em>");
        $(".stay-room .sr-top .reserv-go").attr("start", sdate).attr("end", edate);
    });

    // 예약하기 버튼 클릭시
    reservGo = function(stay_no, room_no){
        const gBtn = $(".stay-room .sr-top .reserv-go");
        const sDate = gBtn.attr("start");
        const eDate = gBtn.attr("end");

        if(!sDate){
            alert("숙박하실 날짜를 선택해 주세요.");
            gotoTop();
            $(".stay-room .sr-top .srt-date").trigger("click");

        }else{
            location.href = "stayReserv.do?stay_no="+stay_no+"&room_no="+room_no+"&check_in="+sDate+"&check_out="+eDate;
        }
    }



    // 숙소 사진 슬라이드
    var stayviewPhotoSwiper = new Swiper(".stay-view .sv-top .svt-photo", {
        effect: "slide",
        slidesPerView: 1,
        spaceBetween: 0,
        speed: 500,
        loop: true,
        touchEnabled: true,
        autoplay: false,
        navigation: {
            nextEl: '.stay-view .sv-top .svt-photo .swiper-button-next',
            prevEl: '.stay-view .sv-top .svt-photo .swiper-button-prev',
        }
    });


    // 숙소 정보 이용안내 정보 탭
    $(".stay-view .sv-caution .faq_cont .tab_btn li").on("click", function(){
        $(".stay-view .sv-caution .faq_cont .tab_btn li.active").removeClass("active");
        $(this).addClass("active");

        $(".stay-view .sv-caution .faq_cont .tab_cont .tab_view.active").removeClass("active").addClass("hide");
        $(".stay-view .sv-caution .faq_cont .tab_cont .tab_view:nth-child("+$(this).attr("num")+")").removeClass("hide").addClass("active");
    });
});







