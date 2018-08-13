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
//		$("#first").addClass("active");
//		$("#second").removeClass("active");
//		$("#third").removeClass("active");
//		$("#fourth").removeClass("active");
//		$("#line").addClass("one");
//		$("#line").removeClass("two");
//		$("#line").removeClass("three");
//		$("#line").removeClass("four");
		location.href=path+"/store/storeManage.do?store_pk="+store_pk;
 	})
	$(".sales").click(function() {
//		$("#first").removeClass("active");
//		$("#second").addClass("active");
//		$("#third").removeClass("active");
//		$("#fourth").removeClass("active");
//		$("#line").addClass("two");
//		$("#line").removeClass("one");
//		$("#line").removeClass("three");
//		$("#line").removeClass("four");
		location.href=path+"/store/storeManageSales.do?store_pk="+store_pk;
	})

	$(".reserve").click(function() {
//		$("#first").removeClass("active");
//		$("#second").removeClass("active");
//		$("#third").addClass("active");
//		$("#fourth").removeClass("active");
//		$("#line").addClass("three");
//		$("#line").removeClass("two");
//		$("#line").removeClass("one");
//		$("#line").removeClass("four");
		location.href=path+"/store/storeManageReserve.do?store_pk="+store_pk;
	})

	$(".qna").click(function() {
//		$("#first").removeClass("active");
//		$("#second").removeClass("active");
//		$("#third").removeClass("active");
//		$("#fourth").addClass("active");
//		$("#line").addClass("four");
//		$("#line").removeClass("two");
//		$("#line").removeClass("three");
//		$("#line").removeClass("one");
		location.href=path+"/store/storeManageQna.do?store_pk="+store_pk;
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
				alert("메뉴 삭제 완료"+data);
				location.reload();
			},
			error:function(jqXHR, textStatus, errorThrown){
			}
		});
	});		
});
//메뉴 추가

function menuInsertForm(){
	 var li = $('<li></li>'); 
	 var html='';
		html+='<form name ="menuInsert" method="post" action="/menuInsert.do">';								;
		html+='<input type="text" placeholder="메뉴 제목 입력" name="menu_name" class="form-control"/>';
		html+='<input type="text" placeholder="정보 입력" name="menu_Info" class="form-control"/>';
		html+='<input type="number" placeholder="가격 입력" name="menu_price" class="form-control"/>';
		html+='<select name="menu_check"><option value="손">손</option><option value="발">발</option></select>';
		html+='<button type="submit" id ="menuInsert" class="btn-success"> 완료</button></form>';
		li.html(html);
		$('.menuInsertForm').append(li);
	
};