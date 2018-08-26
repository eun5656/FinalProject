<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var='path' value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE >
<html>
<head>
<title>메인화면</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="js/index.js" />
<link href="${path }/resources/css/navbar.css" rel="stylesheet" />
</head>

<style>
/*@ 미디어 : Navbar 축소시 줄내림 현상 방지 (max-width: 값을 변경해서 줄내림 현상 방지할수 있음*/
/*@비회원 메인화면*/
@media ( max-width :1080px) {
	.navbar-header {
		float: none;
	}
	.navbar-left, .navbar-right {
		float: none !important;
	}
	.navbar-toggle {
		display: block;
	}
	.navbar-collapse {
		border-top: 1px solid transparent;
		box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.1);
	}
	.navbar-fixed-top {
		top: 0;
		border-width: 0 0 1px;
	}
	.navbar-collapse.collapse {
		display: none !important;
	}
	.navbar-nav {
		float: none !important;
		margin-top: 7.5px;
	}
	.navbar-nav>li {
		float: none;
	}
	.navbar-nav>li>a {
		padding-top: 10px;
		padding-bottom: 10px;
	}
	.collapse.in {
		display: block !important;
	}
	#bs-example-navbar-collapse-1 {
		font-size: 15pt;
	}
}
</style>

<body>
	<header>
		<nav class="navbar navbar-icon-top navbar-default navbar-fixed-top" style="position: relative; margin: 0px;">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="${path}">Today's Nail</a>
				</div>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="active"><a href="${path}">Home<span class="sr-only">(current)</span></a></li>
						<li><a href="${path}/intro/intro.do">Introduce</a></li>
						<li><a href="${path}/shop/shop.do">Shop</a></li>
						<li><a href="${path}/deal/dealList.do">Market</a></li>
						<c:if test="${memberLoggedIn.memberLevel.equals('2') }">
							<li><a href="${path}/store/storeManage.do">MyShop</a></li>
						</c:if>
					</ul>
					<ul class="nav navbar-nav">
						<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> ServiceCenter </a>
							<ul class="dropdown-menu" style="border-radius: 3px; border-color: white">
								<li><a href="${path}/customer/notice.do">공지사항</a></li>
								<li><a href="${path}/customer/faq.do">자주묻는질문</a></li>
							</ul>
						</li>
					</ul>
					<form class="navbar-form navbar-left" action="${path }/shop/searchLocation.do" method="post">
						<div class="form-group col-sm-4" style="padding-left: 0px; padding-right: 0px">
							<select class="form-control" name="searchType" style='padding-right: 10px; height: 34px;'>
								<option value="location">지역명</option>
								<option value="storeName">상호명</option>
							</select>
						</div>
						<div class="input-group col-sm-8" style="padding-left: 0px;">
							<input type="text" class=" input-sm  search-query form-control" id="searchLocation" name="searchLocation" placeholder=" 지역명/상호명으로 검색해주세요." required style="height: 34px;" />
							<span class="input-group-btn">
								<button class="btn btn-danger input-lg" type="submit" style="height: 34px;"><span class=" glyphicon glyphicon-search"></span></button>
							</span>
						</div>
					</form>
					<ul class="nav navbar-nav navbar-right">
						<c:if test="${memberLoggedIn!=null }">
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
									<i class="fa fa-envelope-o"><span class="badge badge-danger">${count}</span></i>Messages
									<span class="caret"></span>
								</a>
								<ul class="dropdown-menu"
									style="border-radius: 3px; border-color: white">
									<li><a href="${path}/message/sendMessage.do">쪽지쓰기</a></li>
									<li><a href="${path}/message/receiveMessage.do?send_user=${memberLoggedIn.memberId}">쪽지함</a></li>
								</ul>
							</li>
						</c:if>
						<c:if test="${memberLoggedIn!=null }">
							<li class="dropdown">
								<a href="${path}/mypage/mypageBookmark.do?member_pk=${memberLoggedIn.memberPk}">
								<i class="fa fa-bookmark" aria-hidden="true"></i>Bookmark
								</a>
							</li>
						</c:if>
						<c:if test="${memberLoggedIn==null }">
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
									<img class="img-circle" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png" style="width: 50px; height: 50px;">
									<span class="caret"></span>
								</a>
								<ul class="dropdown-menu" style="border-radius: 3px; border-color: white">
									<li><a href="${path}/member/memberLogin.do">로그인</a></li>
									<li><a href="${path}/member/joinSelect.do">회원가입</a></li>
								</ul>
							</li>
						</c:if>
						<c:if test="${memberLoggedIn.memberLevel.equals('3') }">
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
									<span>${memberLoggedIn.memberName }님</span>
									<img class="img-circle" src="${path }/resources/upload/member/${memberLoggedIn.memberReImg}" style="width: 50px; height: 50px;">
									<span class="caret"></span>
								</a>
								<ul class="dropdown-menu" style="border-radius: 3px; border-color: white">
									<li><a href="${path}/mypage/mypage.do?memberPk=${memberLoggedIn.memberPk}">마이페이지</a></li>
									<li><a href="${path}/member/Logout.do">로그아웃</a></li>
								</ul>
							</li>
						</c:if>
						<c:if test="${memberLoggedIn.memberLevel.equals('2') }">
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
									<span>${memberLoggedIn.memberName }점주님</span>
									<img class="img-circle" src="${path }/resources/upload/member/${memberLoggedIn.memberReImg}" style="width: 50px; height: 50px;">
									<span class="caret"></span>
								</a>
								<ul class="dropdown-menu" style="border-radius: 3px; border-color: white">
									<li><a href="${path}/mypage/mypage.do?memberPk=${memberLoggedIn.memberPk}">마이페이지</a></li>
									<li><a href="${path}/member/Logout.do">로그아웃</a></li>
								</ul>
							</li>
						</c:if>
						<c:if test="${memberLoggedIn.memberLevel.equals('1') }">
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
									<span>${memberLoggedIn.memberName }관리자님</span>
									<img class="img-circle" src="${path }/resources/upload/member/${memberLoggedIn.memberReImg}" style="width: 50px; height: 50px;">
									<span class="caret"></span>
								</a>
								<ul class="dropdown-menu" style="border-radius: 3px; border-color: white">
									<li><a href="${path}/manager/manageList.do">관리자 페이지</a></li>
									<li><a href="${path}/mypage/mypage.do?memberPk=${memberLoggedIn.memberPk}">마이페이지</a></li>
									<li><a href="${path}/member/Logout.do">로그아웃</a></li>
								</ul>
							</li>
						</c:if>
					</ul>
				</div>
			</div>
		</nav>
	</header>