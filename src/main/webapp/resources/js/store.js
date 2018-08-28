
// 구글맵 세팅
//js 파일은 읽은 뒤에 바인딩 되기 때문에 onLoad로 설정해주어야 바인딩이 제대로 된
$(function() {

	
	//반응형 적용
	if ($(window).width() < 768) {
		$(".wrappercheck").removeAttr("id","wrapper");
		$("#leftcheck").removeAttr("id","left-side");
//		$("#right-side").removeAttr("id","right-side");
		$("#border").attr("style","display:none;");
		$('.right').attr("style","display:none;");
	}
	$(window).resize(function() {
		if ($(window).width() < 768) {
		$(".wrappercheck").removeAttr("id","wrapper");
		$("#leftcheck").removeAttr("id","left-side");
//		$("#right-side").removeAttr("id","right-side");
		$("#border").attr("style","display:none;");
		$('.right').attr("style","display:none;");
		$('.carouselCheck').removeClass("carousel-inner");
		}
		
		if ($(window).width() > 768) {
			$(".wrappercheck").attr("id","wrapper");
			$(".leftcheck").attr("id","left-side");
//			$("#right-side").attr("id","right-side");
			$("#border").removeAttr("style","display:none;");
			$('.right').removeAttr("style","display:none;");
			$('.carouselCheck').addClass("carousel-inner");
			}
	});
// 메뉴 이동
$(".shop").click(function() {
//	$(".shop").addClass("active");
//	$(".map").removeClass("active");
//	$(".reserve").removeClass("active");
//	$(".qna").removeClass("active");
//	$("#line").addClass("one");
//	$("#line").removeClass("two");
//	$("#line").removeClass("three");
//	$("#line").removeClass("four");
//	$("#first").addClass("active");
//	$("#second").removeClass("active");
//	$("#third").removeClass("active");
//	$("#fourth").removeClass("active");
	location.href=path+"/store/store.do?store_pk="+store_pk;
});
$(".map").click(function() {
//	$(".map").addClass("active");
//	$(".shop").removeClass("active");
//	$(".reserve").removeClass("active");
//	$(".qna").removeClass("active");
//	$("#line").addClass("two");
//	$("#line").removeClass("one");
//	$("#line").removeClass("three");
//	$("#line").removeClass("four");
//	$("#first").removeClass("active");
//	$("#second").addClass("active");
//	$("#third").removeClass("active");
//	$("#fourth").removeClass("active");
	location.href=path+"/store/storeMap.do?store_pk="+store_pk;
});

$(".reserve").click(function() {
//	$(".reserve").addClass("active");
//	$(".map").removeClass("active");
//	$(".shop").removeClass("active");
//	$(".qna").removeClass("active");
//	$("#line").addClass("three");
//	$("#line").removeClass("two");
//	$("#line").removeClass("one");
//	$("#line").removeClass("four");
//	$("#first").removeClass("active");
//	$("#second").removeClass("active");
//	$("#third").addClass("active");
//	$("#fourth").removeClass("active");
	location.href=path+"/store/storeReserve.do?store_pk="+store_pk;
});

$(".qna").click(function() {
//	$(".qna").addClass("active");
//	$(".map").removeClass("active");
//	$(".reserve").removeClass("active");
//	$(".shop").removeClass("active");
//	$("#line").addClass("four");
//	$("#line").removeClass("two");
//	$("#line").removeClass("three");
//	$("#line").removeClass("one");
//	$("#first").removeClass("active");
//	$("#second").removeClass("active");
//	$("#third").removeClass("active");
//	$("#fourth").addClass("active");
	location.href=path+"/store/storeContact.do?store_pk="+store_pk;
});
//메뉴이동 끝

//북마크 기능
$(".b_icon").click(function() {					    	
	var memberLoggedIn=$(this).nextAll("[name='member_pk']").val();
//	alert(memberLoggedIn.length);
	
	if(memberLoggedIn.length!=0){

	var temp=$(this);
	var bookmark_val = { 
			nail_pk: temp.nextAll("[name='nail_pk']").val(),
			member_pk: temp.nextAll("[name='member_pk']").val(),
			store_pk: temp.nextAll("[name='store_pk']").val(),
			bookmark_check:null 			
			};

	
	if (temp.attr("alt")=='false') 
	{	
		bookmark_val.bookmark_check="true";
		//var nail_pk=temp.next().val();					    		
		//var member_pk=temp.next().next().val();
	  var jsonData = JSON.stringify(bookmark_val);
	  console.log(jsonData);
      jQuery.ajaxSettings.traditional = true;
		///*json 객체로 바로넘기기					    							    		
		    $.ajax({
		 	url:path+"/bookmark/insertBookmark.do",
			data:{"bookmark_val":jsonData},
			type: "post",
			dataType: "json",
			success: function(data){
  		   		alert("등록완료");
				temp.attr("alt","true");
    			temp.attr("src","/spring/resources/icons/love_filled.svg");
    			temp.nextAll('.bookmark_pk').attr('value',data);
				},
			error: function(jpxhr,textStatus,errormsg) {
				console.log("ajax전송실패");
				console.log(jpxhr);
				console.log(textStatus);
				console.log(errormsg);
			}
		});	
		
	} 
	else {
		//bookmark_val.bookmark_check="false";
		//var nail_pk=temp.next().val();					    		
		//var member_pk=temp.next().next().val();\ss
		var bookmark_pk=temp.nextAll("[name='bookmark_pk']").val();
		var member_pk=temp.nextAll("[name='member_pk']").val();
	    $.ajax({
	 	url:path+"/bookmark/deleteBookmark.do",
		data:{"bookmark_pk":temp.nextAll("[name='bookmark_pk']").val(),"member_pk":temp.nextAll("[name='member_pk']").val()},
		type: "post",
		dataType: "json",
		success: function(data){
  		    alert("삭제완료");
			temp.attr("alt","false");
    		temp.attr("src","/spring/resources/icons/love_blank.svg");
			temp.nextAll('.bookmark_pk').attr('value','');
			},
		error: function(jpxhr,textStatus,errormsg) {
			console.log("ajax전송실패");
			console.log(jpxhr);
			console.log(textStatus);
			console.log(errormsg);
		}
	});	
	}	
	}
	else{
		alert("북마크는 로그인 후 이용해주세요");
	}
});
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
//문의사항 전송
$('#answer-submit').click(
		function(){

			var queryString = $("form[name=QnaInsert]").serialize();
			console.log(queryString);
			$.ajax({
				type :'post',
				url: path + '/insertQna.do',
				data: queryString,
				dataType : 'json',
				success : function(json){
					alert(json)
				},
				error : function(xhr, status, error){
					alert(error);
				}
			})
			
		});


});