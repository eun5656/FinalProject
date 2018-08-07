//
$(function(){	
	var path="/spring";
	$(window).resize(function() {
		if ($(window).width() < 768) {
			$("#line").addClass("one");
			$("#line").removeClass("two");
			$("#line").removeClass("three");
			$("#line").removeClass("four");
		}
	});
	// 메뉴 이동
	$(".shop").click(function() {
		$("#first").addClass("active");
		$("#second").removeClass("active");
		$("#third").removeClass("active");
		$("#fourth").removeClass("active");
		$("#line").addClass("one");
		$("#line").removeClass("two");
		$("#line").removeClass("three");
		$("#line").removeClass("four");
 	})
	$(".map").click(function() {
		$("#first").removeClass("active");
		$("#second").addClass("active");
		$("#third").removeClass("active");
		$("#fourth").removeClass("active");
		$("#line").addClass("two");
		$("#line").removeClass("one");
		$("#line").removeClass("three");
		$("#line").removeClass("four");
	})

	$(".reserve").click(function() {
		$("#first").removeClass("active");
		$("#second").removeClass("active");
		$("#third").addClass("active");
		$("#fourth").removeClass("active");
		$("#line").addClass("three");
		$("#line").removeClass("two");
		$("#line").removeClass("one");
		$("#line").removeClass("four");
	})

	$(".qna").click(function() {
		$("#first").removeClass("active");
		$("#second").removeClass("active");
		$("#third").removeClass("active");
		$("#fourth").addClass("active");
		$("#line").addClass("four");
		$("#line").removeClass("two");
		$("#line").removeClass("three");
		$("#line").removeClass("one");
	})
	//메뉴이동 끝
	//파일 삽입

	$('.image-preview-clear').click(function() {
		var container = $(this).closest(".animatepop");
		$(this).closest('.input-group').next().attr("src", "http://placehold.it/350x250");
		container.find('.image-preview-filename').val("");
		container.find('.image-preview-clear').hide();
		container.find('.image-preview-input input:file').val("");
		container.find(".image-preview-input-title").text("Browse");
	});
	// Create the preview image
	$(".image-preview-input input:file").change(function() {
		var file = this.files[0];
		var reader = new FileReader();

		var container = $(this).closest(".animatepop");
		var image = container.find(".img-responsive");
		reader.onload = function(e) {
			container.find(".image-preview-input-title").text("Change");
			container.find(".image-preview-clear").show();
			container.find(".image-preview-filename").val(file.name);
			image
				.attr('src', e.target.result)
				.css('width', '100%')
				.css('height', '100%')
				.css('position', 'relative');
		}
		reader.readAsDataURL(file);
	});
	$(".image-preview-filename").change(function() {
		console.log("출력됨");
	});
	//파일 삽입 끝

	//메뉴 삭제
$("#menuDelete").click(function(){
	var menu_pk = this.value;
		$.ajax({
			url: path+"/store/storeManage/menuDelete.do",
			data:{'menu_pk':menu_pk},
			success:function(data){
				alert("메뉴 삭제 완료");
			},
			error:function(jqXHR, textStatus, errorThrown){
			}
		});
	});		
});