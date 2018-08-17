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
$("#menuUpdate").click(function(){
//	var queryString = $("form[name=QnaInsert]").serialize();
	var queryString = $(this).closest("form").serialize().replace(/%/g,'%25');;
	queryString = decodeURIComponent(queryString);

	console.log(queryString);
	$.ajax({
		type :'post',
		url: path+'/store/storeManage/menuUpdate.do',
		data: queryString,
		contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		dataType: "text",
		success : function(json){
			alert(json);
			location.reload();
		},
		error : function(xhr, status, error){
			alert(error);
		}
	});
});
	
	//네일 선택
	var main_nail_color_img=$("#main-nail-color").find("img");
	var main_nail_color_button=$("#main-nail-color").find("button");
	var main_nail_style_img=$("#main-nail-style").find("img");
	var main_nail_style_button=$("#main-nail-style").find("button");
	var main_nail_check_img=$("#main-check").find("img");
	var main_nail_check_button=$("#main-check").find("button");
	var selectbar=$("#select-nail-bar");

		$(".nail-color").on("click", function(event) {		
			var main_nail_color_img=$(this).closest(".w3-dropdown-hover").find("#main-nail-color").find("img");
			var main_nail_color_button=$(this).closest(".w3-dropdown-hover").find("#main-nail-color").find("button");					
			var color = $(this).find("img").attr('src');
			var value=$(this).attr('value');
			$(this).closest(".modal-body").find('#nail_color').val(value);
			main_nail_color_img.attr('src', color);
			main_nail_color_button.html(value);
			});
		

		
		$(".nail-check").on("click", function(event) {	
			var main_nail_check_img=$(this).closest(".w3-dropdown-hover").find("#main-check").find("img");
			var main_nail_check_button=$(this).closest(".w3-dropdown-hover").find("#main-check").find("button");
			var check = $(this).find("img").attr('src');
			var value=$(this).attr('value');
			$(this).closest(".modal-body").find('#nail_check').val(value);
			main_nail_check_img.attr('src', check);
			main_nail_check_button.html(value);
			});
		
		$(".nail-style").on("click", function(event) {	
			var main_nail_style_img=$(this).closest(".w3-dropdown-hover").find("#main-nail-style").find("img");
			var main_nail_style_button=$(this).closest(".w3-dropdown-hover").find("#main-nail-style").find("button");
			var style = $(this).find("img").attr('src');
			var value=$(this).attr('value');
			$(this).closest(".modal-body").find('#nail_style').val(value);
			main_nail_style_img.addClass("w3-circle");
			main_nail_style_img.attr('src', style);
			main_nail_style_button.html(value);
			});
		
		
		$("#reset-all").on("click", function() {
			main_nail_color_img.attr("src",path+"/resources/images/nails/all-color.jpg");
			main_nail_color_button.html("전체");			
			main_nail_check_img.attr("src",path+"/resources/images/nails/nail-polish.png");
			main_nail_check_button.html("네일/페디");			
			main_nail_style_img.removeClass("w3-circle");
			main_nail_style_img.attr("src",path+"/resources/images/nails/plus_btn.png");
			main_nail_style_button.html("전체옵션");
			});
		
		//수정 모달에서 이미지값부여
		
		$(".nailDelete").on("click", function(){
			var nail_pk=$(this).val();
			console.log(nail_pk);
			 $.ajax({
				 type :'post',
					url: path+'/store/storeManage/nailDelete.do',
					data: {'nail_pk':nail_pk},
					dataType: "json",
					success : function(json){
						location.reload();
					},
					error : function(xhr, status, error){
						alert(error);
					}			 })
		});
	});	

//메뉴 추가

function menuInsertForm(){
	 var li = $('<div></div>'); 
	 var html='';
		html+='<form name ="menuInsert" method="post" action="';
		html+=path;	
		html+='/store/storeManage/menuInsert.do">';
		html+='<label for ="menu_name">제목 입력 : ';
		html+='<input type="text" placeholder="메뉴 제목 입력" id="menu_name" name="menu_name" class="form-control"/></label>';
		html+='<label for="menu_info">정보 입력: <input type="text" placeholder="정보 입력" id="menu_info" "name="menu_info" class="form-control"/></label>';
		html+='<label name="menu_price">가격 입력: <input type="number" placeholder="가격 입력" id="menu_price" name="menu_price" class="form-control"/></label>';
		html+='<select name="menu_check"><option value="손">손</option><option value="발">발</option></select>';
		html+='<input type="hidden" name = "store_pk" value="'+ store_pk +'"/>';
		html+='<button type="submit" id ="menuInsert" class="btn btn-success"> 완료</button></form>';
		li.html(html);
		$('.menuInsertForm').append(li);	};