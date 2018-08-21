<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var='path' value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value=" " name="pageTitle" />
</jsp:include>

<section style="margin-top: 100px;">
	<div class='container'>
		<div class="panel">
			<ul class="nav nav-tabs">
				<li role="presentation"><a href="${path}/mypage/mypage.do">예약현황</a></li>
				<li role="presentation"><a href="${path}/mypage/mypageBookmark.do?member_pk=${memberLoggedIn.memberPk}">즐겨찾기</a></li>
				<li role="presentation"><a href="${path}/mypage/mypageQNAList.do?member_pk=${memberLoggedIn.memberPk}">1:1문의내역</a></li>
				<li role="presentation"><a href="${path}/mypage/mypageUpdate.do">회원정보수정</a></li>
				<li role="presentation"><a href="${path}/mypage/mypagePwchange.do">비밀번호변경</a></li>
				<li class="active" role="presentation"><a href="${path}/mypage/mypageDelete.do">탈퇴</a></li>
			</ul>
			<div class="panel-body">
				<div class="page-header">
					<h2>탈퇴</h2>
				</div>
				<form action="${path}/mypage/mypageDeleteEnd.do?memberPk=${memberLoggedIn.memberPk}"method="post" class="form-horizontal">
					<div class="form-group">
						<label class="col-sm-3 control-label" for="memberPw">
						<span class="text-danger">*</span>비밀번호</label>
						<div class="col-sm-6">
							<input class="form-control" id="memberPw" name="memberPw" type="password" placeholder="비밀번호" required>
						</div>
						<div class="col-sm-3">
							<input class="btn btn-warning" type="submit" value="회원탈퇴">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />