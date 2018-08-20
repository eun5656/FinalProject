<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var='path' value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="회원가입 선택" name="pageTitle" />
</jsp:include>

<link rel="stylesheet" type="text/css" href="${path }/resources/css/joinSelect.css">

<div class="container">
	<div class="row" style="padding-left: 50px;">
		<div class="col-xs-10">
			<h3>회원 가입</h3>
			<hr>
		</div>
		<div class="col-xs-2"></div>
	</div>
	<div class="row">
		<div class="col"></div>
		<div class="col-5">
			<div class="box" style="text-align: center">
				<a href="${path}/member/JoinUser.do">
					<div class="icon text-center">
						<i class="fa fa-user" aria-hidden="true"></i>
					</div>
				</a>
				<div class="content">
					<h3>사용자</h3>
					<p>사용자 회원가입 페이지로 이동합니다.각종 네일 정보 및 이벤트에 참여하실 수 있습니다.</p>
				</div>
			</div>

			<div class="box" style="text-align: center">
				<a href="${path}/member/JoinShop.do">
					<div class="icon">
						<i class="fa fa-users" aria-hidden="true"></i>
					</div>
				</a>
				<div class="content">
					<h3>점주</h3>
					<p>점주 회원가입 페이지로 이동합니다. 오늘 네일의 점주로 활동하고자 하는 분은 이곳을 통해 가입해주세요.</p>
				</div>
			</div>
		</div>
		<div class="col"></div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />