<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.kh.spring.member.model.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var='path' value="${pageContext.request.contextPath}" />
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="회원정보수정" name="pageTitle" />
</jsp:include>
<link rel="stylesheet" type="text/css" href="${path }/resources/css/joinShop.css">

<section style="margin-top: 100px;">
	<div class='container'>
		<div class="panel">
			<ul class="nav nav-tabs">
				<li class="presentation"><a href="${path}/mypage/mypage.do?memberPk=${memberLoggedIn.memberPk}">예약현황</a></li>
				<li role="presentation"><a href="${path}/mypage/mypageBookmark.do?member_pk=${memberLoggedIn.memberPk}">즐겨찾기</a></li>
				<li role="presentation"><a href="${path}/mypage/mypageQNAList.do?member_pk=${memberLoggedIn.memberPk}">1대1문의내역</a></li>
				<li class="active" role="presentation"><a href="${path}/mypage/mypageUpdate.do">회원정보수정</a></li>
				<li role="presentation"><a href="${path}/mypage/mypagePwchange.do">비밀번호변경</a></li>
				<li role="presentation"><a href="${path}/mypage/mypageDelete.do">탈퇴</a></li>
			</ul>
			<div class="panel-body">
				<div class="page-header">
					<h2>회원 정보 수정</h2>
				</div>
				<form role="form" action="${path}/mypage/mypageUpdateEnd.do" method="post" class="form-horizontal" enctype="multipart/form-data">
					<div class="form-group">
						<label class="col-sm-3 control-label" for="memberId">아이디</label>
						<div class="col-sm-6">
							<input class="form-control" id="memberPk" name="memberPk" type="hidden" value="${memberLoggedIn.memberPk }" required="required">
							<input class="form-control" id="memberLevel" name="memberLevel" type="hidden" value="${memberLoggedIn.memberLevel }">
							<input class="form-control" id="memberId" name="memberId" type="text" value="${memberLoggedIn.memberId }" title="아이디는 변경하실 수 없습니다." readonly>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="memberName">이름</label>
						<div class="col-sm-6">
							<input class="form-control" id="memberName" name="memberName" type="text" value="${memberLoggedIn.memberName }" readonly>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="memberPhone">휴대폰번호</label>
						<div class="col-sm-6">
							<input class="form-control" id="memberPhone" name="memberPhone" type="text" placeholder="- 없이 입력해 주세요"  value="${memberLoggedIn.memberPhone }">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="memberEmail">이메일</label>
						<div class="col-sm-6">
							<input type="email" class="form-control" id="memberEmail" name="memberEmail" placeholder="이메일을 입력해 주세요"  value="${memberLoggedIn.memberEmail }"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="memberAddress">주소</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="post" placeholder="우편번호" required>
						</div>
						<div class="col-sm-3">
							<input type="button" class="btn btn-warning" onclick="Postcode();" value="주소찾기">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="memberAddress"></label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="memberAddress" name="memberAddress" placeholder="도로명 주소" value="${memberLoggedIn.memberAddress }" required>
							<input type="text" class="form-control" id="memberAddressDetail" placeholder="상세주소">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="inputimage">프로필사진</label>
						<div class="col-sm-6">
							<div class="input-group image-preview">
								<input type="text" class="form-control image-preview-filename" name="upload_file" disabled="disabled" value="${memberLoggedIn.memberOriImg }">
								<span class="input-group-btn">
									<button type="button" class="btn btn-default image-preview-clear" style="display: none;">
										<span class="glyphicon glyphicon-remove"></span>Clear
									</button>
									<div class="btn btn-default image-preview-input">
										<span class="glyphicon glyphicon-folder-open"></span>
										<span class="image-preview-input-title">Browse</span>
										<input type="file" accept="image/png, image/jpeg, image/gif" src="${path}/resources/upload/member/${memberLoggedIn.memberReImg }" name="input-file-preview" />
										<input type="hidden"  name="memberReImg" value="${memberLoggedIn.memberReImg }" />
									</div>
								</span>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-12 text-center">
							<button class="btn btn-primary" type="submit">수정 완료<i class="fa fa-check spaceLeft"></i></button>
							<button class="btn btn-danger" type="reset">취소<i class="fa fa-times spaceLeft"></i>	</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script>
	//주소찾기 스크립트
	function Postcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				var fullAddr = '';
				var extraAddr = '';
				if (data.userSelectedType === 'R') {
					fullAddr = data.roadAddress;
				} else { 
					fullAddr = data.jibunAddress;
				}
				if (data.userSelectedType === 'R') {
					if (data.bname !== '') {
						extraAddr += data.bname;
					}
					if (data.buildingName !== '') {
						extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					}
					fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
				}
				document.getElementById('post').value = data.zonecode;
				document.getElementById('memberAddress').value = fullAddr;
				document.getElementById('memberAddressDetail').focus();
			}
		}).open();
	}
</script>
<script>
	/*이미지 추가 input  script*/
	$(document).on('click', '#close-preview', function() {
		$('.image-preview').popover('hide');
		// Hover befor close the preview
		$('.image-preview').hover(function() {
			$('.image-preview').popover('show');
		}, function() {
			$('.image-preview').popover('hide');
		});
	});

	$(function() {
		// Create the close button
		var closebtn = $('<button/>', {
			type : "button",
			text : 'x',
			id : 'close-preview',
			style : 'font-size: initial;',
		});
		closebtn.attr("class", "close pull-right");
		// Set the popover default content
		$('.image-preview').popover({
			trigger : 'manual',
			html : true,
			title : "<strong>Preview</strong>" + $(closebtn)[0].outerHTML,
			content : "There's no image",
			placement : 'bottom'
		});
		// Clear event
		$('.image-preview-clear').click(function() {
			$('.image-preview').attr("data-content", "").popover('hide');
			$('.image-preview-filename').val("");
			$('.image-preview-clear').hide();
			$('.image-preview-input input:file').val("");
			$(".image-preview-input-title").text("Browse");
		});
		// Create the preview image
		$(".image-preview-input input:file").change(function() {
			var img = $('<img/>', {
				id : 'dynamic',
				width : 250,
				height : 200
			});
			var file = this.files[0];
			var reader = new FileReader();
			// Set preview image into the popover data-content
			reader.onload = function(e) {
				$(".image-preview-input-title").text("Change");
				$(".image-preview-clear").show();
				$(".image-preview-filename").val(file.name);
				img.attr('src', e.target.result);
				$(".image-preview").attr("data-content", $(img)[0].outerHTML).popover("show");
			}
			reader.readAsDataURL(file);
		});
	});
</script>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />