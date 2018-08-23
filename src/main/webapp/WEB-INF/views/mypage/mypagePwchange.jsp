<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.kh.spring.member.model.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var='path' value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="비밀번호수정" name="pageTitle" />
</jsp:include>

<script>
//현재비밀번호 확인용 ajax
var checkInput = true;
$(function() {
	$('#memberPw').keyup(function() {
	   $.ajax({
		   url: "${path}/mypage/duplicatePwCheck.do",
		   type:"post",
		   data:{memberPk:$('#memberPk').val(), memberPw:$('#memberPw').val()},
		   success : function(data) {
			   //alert(data);
			   var p1 = $("#memberPw").val();
			   if(data == 'false'||p1.length==0) {
				   //alert('현재비밀번호와 일치하지 않습니다. 다시입력해주세요');
				   //$("#memberPw").focus();
				   //$("#memberPw").val("");
				   $('#pwcheck0').html('현재비밀번호와 일치하지 않습니다. 다시입력해주세요');
				   $('#pwcheck0').css('color','red');
				   $("#memberPw").focus();
               	   checkInput = true;
			   } else {
				   $('#pwcheck0').html('비밀번호가 일치합니다.');
				   $('#pwcheck0').css('color','green');
				   //alert('비밀번호가 일치합니다.');
				   checkInput = false;
			   }
		   }
	   });
	});
});
//새비밀번호와 현재비밀번호 일치여부
function fn_pwCheck() {
	var p1 = $("#memberPw").val();
	var p2 = $("#memberPwNew").val();
	if(p1 == p2) {
		$("#pwcheck").css("color","red");
		$('#pwcheck').html('현재비밀번호와 일치합니다. 다시입력해주세요');
	} else {
		$('#pwcheck').html('');
	}
}
function fn_pwCheck2() {
	var p1 = $("#memberPwNew").val();
	var p2 = $("#memberPwNew_2").val();
	if(p1 == p2) {
		$("#pwcheck2").css("color","green");
		$('#pwcheck2').html('새비밀번호와 일치합니다.');
	} else {
		$('#pwcheck2').html('');
	}
}
$(function() {
   $("#memberPwNew").blur(function() {
	   var p1 = $("#memberPw").val();
	   var p2 = $("#memberPwNew").val();
	   var check = false;
	   if(p2.length !=0 && p1 == p2) {
		   $("#memberPwNew").val("");
		   $("#memberPwNew").focus();
		   check = true;
		   alert("현재비밀번호와 일치합니다 다른 비밀번호를 입력해주세요.");
	   }
	   var num = p2.search(/[0-9]/g);
	   var eng = p2.search(/[a-z]/ig);
	   var spe = p2.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	   if(check == false && p2.length != 0 && p2.search(/\s/) != -1) {
		   $("#memberPwNew").val("");
		   $("#memberPwNew").focus();
		   alert("비밀번호는 공백없이 영문,숫자,특수문자를 조합한 8자 이상 15이상이어야 합니다.");
	   } else if(check == false && p2.length != 0 && (p2.length < 8 || p2.length > 15)) {
		   $("#memberPwNew").val("");
		   $("#memberPwNew").focus();
           alert("비밀번호는 공백없이 영문,숫자,특수문자를 조합한 8자 이상 15이상이어야 합니다.");
	   } else if(check == false && p2.length != 0 && (num < 0 || eng < 0 || spe < 0) ) {
		   $("#memberPwNew").val("");
           $("#memberPwNew").focus();
           alert("비밀번호는 공백없이 영문,숫자,특수문자를 조합한 8자 이상 15이상이어야 합니다.");
	   } else {
         
	   }
   });
});
$(function() {
   $("#memberPwNew_2").blur(function() {
      var p1 = $("#memberPw").val();
      var p2 = $("#memberPwNew").val();
        var p3 = $("#memberPwNew_2").val();
        if(checkInput == true) {
           alert("현재 비밀번호를 입력하세요.");
          $("#memberPw").val("");
          $("#memberPwNew_2").val("");
           $("#memberPwNew").val("");
          $("#memberPw").focus();
        }
        if(p3.length != 0 && p2 != p3) {
           alert("새비밀번호와 일치하지 않습니다.");
          $("#memberPwNew_2").val("");
          $("#memberPwNew").val("");
        }
   });
});
</script>
<section style="margin-top: 100px;">
	<div class='container'>
		<div class="panel">
			<ul class="nav nav-tabs">
				<li role="presentation"><a href="${path}/mypage/mypage.do">예약현황</a></li>
				<li role="presentation"><a href="${path}/mypage/mypageBookmark.do?member_pk=${memberLoggedIn.memberPk}">즐겨찾기</a></li>
				<li role="presentation"><a href="${path}/mypage/mypageQNAList.do?member_pk=${memberLoggedIn.memberPk}">문의내역</a></li>
				<li role="presentation"><a href="${path}/mypage/mypageUpdate.do">회원정보수정</a></li>
				<li class="active" role="presentation"><a href="${path}/mypage/mypagePwchange.do">비밀번호변경</a></li>
				<li role="presentation"><a href="${path}/mypage/mypageDelete.do">탈퇴</a></li>
			</ul>
			<div class="panel-body">
				<div class="page-header">
					<h2>비밀 번호 변경</h2>
				</div>
				<form role="form" action="${path}/mypage/mypagePwchangeEnd.do" method="post" class="form-horizontal">
					<div class="form-group">
						<label class="col-sm-3 control-label" for="memberId">아이디</label>
						<div class="col-sm-6">
							<input class="form-control" id="memberId" name="memberId" type="text" value="${memberLoggedIn.memberId }" title="아이디는 변경하실 수 없습니다." readonly>
							<input class="form-control" id="memberPk" name="memberPk" type="hidden" value="${memberLoggedIn.memberPk }" required="required">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="memberPw">현재비밀번호</label>
						<div class="col-sm-6">
							<input class="form-control" id="memberPw" name="memberPw" type="password" placeholder="비밀번호">
							<p id="pwcheck0"></p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="memberPwNew">새로운 비밀번호</label>
						<div class="col-sm-6">
							<input class="form-control" id="memberPwNew" name="memberPwNew" type="password" placeholder="비밀번호">
							<p class="help-block">숫자, 특수문자 포함 8자 이상</p>
							<p id="pwcheck"></p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="memberPwNew_2">비밀번호확인</label>
						<div class="col-sm-6">
							<input class="form-control" id="memberPwNew_2" name="memberPwNew_2" type="password" placeholder="비밀번호 확인">
							<p class="help-block">새로운 비밀번호를 한번 더 입력해주세요.</p>
							<p id="pwcheck2"></p>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-12 text-center">
							<button class="btn btn-primary" type="submit">비밀번호변경하기<i class="fa fa-check spaceLeft"></i></button>
							<button id='reset-btn' class="btn btn-danger" type="reset">다음에변경하기<i class="fa fa-times spaceLeft"></i>
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />