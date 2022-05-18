$(document).ready(function () {




// 스크롤 시, 헤더
$(window).scroll(function() {
    if($(this).scrollTop() == 0)
        $('header').removeClass('sticky');
    else
        $('header').addClass('sticky');
});

//메인슬라이드
var swiper = new Swiper('.main-slider', {
	effect: 'fade',
	loop:true,
	autoplay: {
		delay: 6000,
	},
	pagination: {
        el: ".swiper-pagination",
        clickable: true,
    },
	navigation: {
		nextEl: ".swiper-button-next",
		prevEl: ".swiper-button-prev",
	},
});

//햄버거 메뉴버튼
$(document).ready(function(){
  $(".hamburger").click(function(){
	$(".m_menu .m_smenu").hide();
	$(this).toggleClass("is-active");
  });
});

//모바일 메뉴 나타나게
$('#toggle').click(function() {
  $('#toggle .bar').toggleClass('animate');
  $('#page').toggleClass('overlay');
	if($(".hamburger").hasClass("is-active") == false){
		$("body").css("overflow","");
	}
	else{
		$('body').css('overflow', 'hidden');	
	}
});
// 다시 메뉴 닫기 눌렀을 때 $('body').css('overflow', 'auto');


//모바일 서브메뉴
$(".m_menu .m_smenu").hide();
/*$(".m_menu ul li:has(ol)").click(function(){
    $(".m_menu .m_smenu").slideUp();
    $(".m_menu ul li").removeClass();
    $(this).children(".m_smenu").stop().slideToggle();
    $(this).toggleClass("on");
});*/
$(".m_menu").on("click", function(){
	$(".m_menu").children("ul").slideUp();
	$(this).children("ul").slideDown();
});
$(".m_smenu li").on("click", function(){
	$("#page").removeClass("overlay");
	$("#ham").removeClass("is-active");
	$("body").css("overflow","scroll");
});

//PC 서브메뉴 >> 서브메뉴 하나씩 나타나게 this
$(".header_wrap ul .menu").hover(function () { 
    $(this).children('ul').toggleClass('show');
})


/*top으로*/
$(function() {       
    $(".btn-top").click(function() {
        $('html, body').animate({
            scrollTop : 0
            }, 400);
            return false;
    });
});





})