<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var='path' value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value=" " name="pageTitle" />
</jsp:include>

<section style="padding-top: 100px;">	
	<div class='container'>
		<div class='panel'>
			<ul class="nav nav-tabs">
				<li role="presentation"><a href="${path}/mypage/mypage.do?memberPk=${memberLoggedIn.memberPk}">예약현황</a></li>
				<li role="presentation"><a href="${path}/mypage/mypageBookmark.do?member_pk=${memberLoggedIn.memberPk}">즐겨찾기</a></li>
				<li class="active" role="presentation"><a href="${path}/mypage/mypageQNAList.do?member_pk=${memberLoggedIn.memberPk}">문의내역</a></li>
				<li role="presentation"><a href="${path}/mypage/mypageUpdate.do">회원정보수정</a></li>
				<li role="presentation"><a href="${path}/mypage/mypagePwchange.do">비밀번호변경</a></li>
				<li role="presentation"><a href="${path}/mypage/mypageDelete.do">탈퇴</a></li>
			</ul>
        	<div class='panel-body'>
				<div class="page-header">
					<h3>1대1문의 내역</h3>
				</div>
				<div class="row">
				<label for="" class="col-sm-2 control-label" >작성자</label>
				<div class="col-sm-3"><p>${qna.qna_writer}</p></div>
			</div>
			<div class="row">
				<label for="" class="col-sm-2 control-label">보낸시간</label>
				<div class="col-sm-3"><p>${qna.qna_date}</p></div>
			</div>	
			<div class="row">
				<label for="" class="col-sm-2 control-label">질문제목</label>
				<div class="col-sm-3"><p>${qna.qna_title}</p></div>
			</div>
			<div class="row">
				<label for="" class="col-sm-2 control-label">질문내용</label>
				<div class="col-sm-3"><p>${qna.qna_content}</p></div>
			</div>	
			<hr>
			<div class="row">
				<label for="" class="col-sm-2 control-label">답변시간</label>
				<div class="col-sm-3"><p>${qna.answer_date}</p></div>
			</div>
			<div class="row">
				<label for="" class="col-sm-2 control-label">답변내용</label>
				<div class="col-sm-3"><textarea class="form-control" id="send_content" name="send_content" rows="10" style="resize: none;" read only>${qna.answer_content }</textarea></div>
			</div>		
			
			<br>
			<div class="row">
				<div class="col-sm-2">
					<button type="button" class="btn btn-default">
						<a href="${path}/mypage/mypageQNAList.do?member_pk=${memberLoggedIn.memberPk}">목록으로</a>
					</button>
				</div>
			
			</div>	
		</div>
	</div>
</section>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />