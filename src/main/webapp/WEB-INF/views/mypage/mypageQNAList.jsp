<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<c:set var='path' value="${pageContext.request.contextPath}"/>   
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value=" " name="pageTitle"/>
</jsp:include>



<section id='mypage' style="padding-top: 100px;">	
	<div class='container'>
		<div class='panel'>
			<ul class="nav nav-tabs">
				<li role="presentation"><a href="${path}/mypage/mypage.do?memberPk=${memberLoggedIn.memberPk}">예약현황</a></li>
				<li role="presentation"><a href="${path}/mypage/mypageBookmark.do?member_pk=${memberLoggedIn.memberPk}">즐겨찾기</a></li>
				<li class="active" role="presentation"><a href="${path}/mypage/mypageQNAList.do?member_pk=${memberLoggedIn.memberPk}">문의내역</a></li>
				<li role="presentation"><a href="${path}/mypage/mypageChange.do">회원정보수정</a></li>
				<li role="presentation"><a href="${path}/mypage/mypageDelete.do">탈퇴</a></li>
			</ul>
        	<div class='panel-body'>
				<div class="page-header">
					<h2>1대1문의내역</h2>
				</div>
				<table class="table table-condensed table-hover">
					
						<tr>
							<th></th>
							<th>번호</th>
							<th>글 제목</th>
							<th>날짜</th>
							<th>답장여부</th>
							<!-- <th>삭제</th> -->
						</tr>
				
				
					<c:forEach  var='m' items='${qnaList}' varStatus="vs">
						<tr>
							<td></td>
							<td>${vs.count}</td>
							<td><a href="${path}/mypage/mypageQNAListContent.do?qna_pk=${m.qna_pk}">${m.qna_title }</td>
							<td><a href="${path}/mypage/mypageQNAListContent.do?qna_pk=${m.qna_pk}">${m.qna_date }</td>
							<th><a href="${path}/mypage/mypageQNAListContent.do?qna_pk=${m.qna_pk}">${m.answer_check}</th>
							<%-- <th><button class="btn btn-danger" type="button" onclick="fn_refuse(${m.qna_pk})" value="${m.qna_pk}">삭제</i></button></th> --%>
						</tr>
					</c:forEach>
				</table>
				
				  <div class="row1 text-center" id="paging">
        ${pageBar}
      </div>
     
			</div>	
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>