/////////////////////////////////////////////////////
// 숙소 관련
/////////////////////////////////////////////////////
$(document).ready(function(){
    // 오늘 날짜
    let getToday = new Date();
    let gYear = getToday.getFullYear();
    let gMonth = getToday.getMonth() + 1;
    let gDate = getToday.getDate();


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







