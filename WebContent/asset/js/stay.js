/////////////////////////////////////////////////////
// 숙소 보기 포토 슬라이드
/////////////////////////////////////////////////////
$(document).ready(function(){
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


    var stayviewRoomSwiper = new Swiper(".stay-view .sv-room .svr-list", {
        effect: "slide",
        slidesPerView: 2,
        width: 970,
        spaceBetween: 50,
        speed: 500,
        loop: true,
        touchEnabled: true,
        autoplay: false,
        navigation: {
            nextEl: '.stay-view .sv-room .svr-info .swiper-button .swiper-button-next',
            prevEl: '.stay-view .sv-room .svr-info .swiper-button .swiper-button-prev',
        }
    });
});







