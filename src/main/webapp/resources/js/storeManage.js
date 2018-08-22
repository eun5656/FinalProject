//
$(function(){	
	
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

		}
		
		if ($(window).width() > 768) {
			$(".wrappercheck").attr("id","wrapper");
			$(".leftcheck").attr("id","left-side");
//			$("#right-side").attr("id","right-side");
			$("#border").removeAttr("style","display:none;");
			$('.right').removeAttr("style","display:none;");
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
		location.href=path+"/store/storeManageReserveList.do?store_pk="+store_pk;
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
$(".menuDelete").click(function(){
	var menu_pk = this.value;
		$.ajax({
			url: path+"/store/storeManage/menuDelete.do",
			data:{'menu_pk':menu_pk},
			success:function(data){
				alert("메뉴 삭제 완료"+data);
				location.href=path+"/store/storeManage.do"
			},
			error:function(jqXHR, textStatus, errorThrown){
			}
		});
	});		
$(".menuUpdate").click(function(){
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
			location.href=path+"/store/storeManage.do"
		},
		error : function(xhr, status, error){
			alert(error);
		}
	});
});
	$(".designerDelete").click(function(){
		var designer_pk = this.value;
			$.ajax({
				url: path+"/store/storeManage/designerDelete.do",
				data:{'designer_pk':designer_pk},
				success:function(data){
					alert("디자이너 삭제 완료"+data);
					location.href=path+"/store/storeManage.do"
				},
				error:function(jqXHR, textStatus, errorThrown){
				}
			});
	});
	$(".designerUpdate").click(function(){
//		var queryString = $("form[name=QnaInsert]").serialize();
		var queryString = $(this).closest("form").serialize().replace(/%/g,'%25');;
		queryString = decodeURIComponent(queryString);

		console.log(queryString);
		$.ajax({
			type :'post',
			url: path+'/store/storeManage/designerUpdate.do',
			data: queryString,
			contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
			dataType: "text",
			success : function(json){
				alert(json);
				location.href=path+"/store/storeManage.do"
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
		html+='<select name="menu_check"><option value="네일">네일</option><option value="페디">페디</option></select>';
		html+='<input type="hidden" name = "store_pk" value="'+ store_pk +'"/>';
		html+='<button type="submit" id ="menuInsert" class="btn btn-success"> 완료</button></form>';
		li.html(html);
		$('.menuInsertForm').append(li);	};

		function designerInsertForm(){
			 var li = $('<div></div>'); 
			 var html='';
				html+='<form name ="designerInsert" method="post" action="';
				html+=path;	
				html+='/store/storeManage/designerInsert.do">';
				html+='<label for ="designer_name">디자이너 이름 입력 : ';
				html+='<input type="text" placeholder="디자이너 이름 입력" id="designer_name" name="designer_name" class="form-control"/></label>';
				html+='<input type="hidden" name = "store_pk" value="'+ store_pk +'"/>';
				html+='<button type="submit" id ="designerInsert" class="btn btn-success"> 완료</button></form>';
				li.html(html);
				$('.designerInsertForm').append(li);	};		
		
		//주소 찾기
		function Postcode() {
		    new daum.Postcode({
		        oncomplete: function(data) {
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

		            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		            var fullAddr = ''; // 최종 주소 변수
		            var extraAddr = ''; // 조합형 주소 변수

		            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                fullAddr = data.roadAddress;

		            } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                fullAddr = data.jibunAddress;
		            }

		            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
		            if(data.userSelectedType === 'R'){
		                //법정동명이 있을 경우 추가한다.
		                if(data.bname !== ''){
		                    extraAddr += data.bname;
		                }
		                // 건물명이 있을 경우 추가한다.
		                if(data.buildingName !== ''){
		                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                }
		                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
		                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
		            }

		            // 우편번호와 주소 정보를 해당 필드에 넣는다.F
//		            document.getElementById('post').value = data.zonecode; //5자리 새우편번호 사용
		            document.getElementById('store_address').value = fullAddr;

		            // 커서를 상세주소 필드로 이동한다.
		            document.getElementById('store_address_detail').focus();
		        }
		    }).open();
		}


