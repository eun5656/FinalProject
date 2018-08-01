// 구글맵 세팅
$(function() {
	var mapCanvas = document.getElementById("map");
	var mapOptions = {
		center : new google.maps.LatLng(51.5, -0.2),
		zoom : 10
	};
	var map = new google.maps.Map(mapCanvas, mapOptions);
})
// 반응형 적용
$(window).resize(function() {
	if ($(window).width() < 640) {
		$(".shop").addClass("active");
		$(".map").removeClass("active");
		$(".reserve").removeClass("active");
		$(".qna").removeClass("active");
		$("#line").addClass("one");
		$("#line").removeClass("two");
		$("#line").removeClass("three");
		$("#line").removeClass("four");
	}
});
// 메뉴 이동
$(".shop").click(function() {
	$(".shop").addClass("active");
	$(".map").removeClass("active");
	$(".reserve").removeClass("active");
	$(".qna").removeClass("active");
	$("#line").addClass("one");
	$("#line").removeClass("two");
	$("#line").removeClass("three");
	$("#line").removeClass("four");
})
$(".map").click(function() {
	$(".map").addClass("active");
	$(".shop").removeClass("active");
	$(".reserve").removeClass("active");
	$(".qna").removeClass("active");
	$("#line").addClass("two");
	$("#line").removeClass("one");
	$("#line").removeClass("three");
	$("#line").removeClass("four");
})

$(".reserve").click(function() {
	$(".reserve").addClass("active");
	$(".map").removeClass("active");
	$(".shop").removeClass("active");
	$(".qna").removeClass("active");
	$("#line").addClass("three");
	$("#line").removeClass("two");
	$("#line").removeClass("one");
	$("#line").removeClass("four");
})

$(".qna").click(function() {
	$(".qna").addClass("active");
	$(".map").removeClass("active");
	$(".reserve").removeClass("active");
	$(".shop").removeClass("active");
	$("#line").addClass("four");
	$("#line").removeClass("two");
	$("#line").removeClass("three");
	$("#line").removeClass("one");
})

$(".shop").click(function() {
	$("#first").addClass("active");
	$("#second").removeClass("active");
	$("#third").removeClass("active");
	$("#fourth").removeClass("active");
})

$(".map").click(function() {
	$("#first").removeClass("active");
	$("#second").addClass("active");
	$("#third").removeClass("active");
	$("#fourth").removeClass("active");
})

$(".reserve").click(function() {
	$("#first").removeClass("active");
	$("#second").removeClass("active");
	$("#third").addClass("active");
	$("#fourth").removeClass("active");
})

$(".qna").click(function() {
	$("#first").removeClass("active");
	$("#second").removeClass("active");
	$("#third").removeClass("active");
	$("#fourth").addClass("active");
})
//메뉴이동 끝

//북마크 기능
$("#b_icon").click(function() {
	if ($('#b_icon').val().trim() == 'false') {
		$('#b_icon').addClass("active");
		$('#b_icon').val().trim() == 'true';
	} else {
		$('#b_icon').removeClass("active");
		$('#b_icon').val().trim() == 'false';
	}
})
//작은케러셀
// Instantiate the Bootstrap carousel
$('.multi-item-carousel').carousel({
	interval : false
});

// for every slide in carousel, copy the next slide's item in the slide.
// Do the same for the next, next item.
$('.multi-item-carousel .item').each(
		function() {
			var next = $(this).next();
			if (!next.length) {
				next = $(this).siblings(':first');
			}
			next.children(':first-child').clone().appendTo($(this));

			if (next.next().length > 0) {
				next.next().children(':first-child').clone().appendTo($(this));
			} else {
				$(this).siblings(':first').children(':first-child').clone()
						.appendTo($(this));
			}
		});
