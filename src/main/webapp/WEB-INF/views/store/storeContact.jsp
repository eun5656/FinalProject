<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 해더부분 -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="NailStore" name="pageTitle" />
</jsp:include>


<c:set var="path" value="${pageContext.request.contextPath }" />
<!-- store css -->

<link href="${path }/resources/css/store.css" rel="stylesheet" />
<link href="${path }/resources/css/review.css" rel="stylesheet" />
<!-- store js -->


<script type="text/javascript">
// 외부 js 에서 쓰이는 변수 setting
var path = "${pageContext.request.contextPath }";
var store_pk ="${store.store_pk}";
</script>
<script src="${path }/resources/js/store.js?ver=3"></script>
<div>
<div id="wrapper">
	<div id="left-side">
	<div id="fourth" class="active">
		<div class="row">
			<div class="col-lg-4 col-md-4 col-sm-4 col-xs-10 animatepop">
				<h3>Nail Shop ${store.store_name }</h3>
				<p>Nail Shop Tel ${store.store_phone }</p>
				<p>KakaoChat : ${store.store_kakao }</p>
				<p>instagram : ${store.store_instagram }</p>
			</div>
			<!--가게 Info 끝-->
			<div class="col-lg-7 col-md-7 col-sm-7 col-xs-10">
				<form class="" action="/insertQna.do" method="post" name="QnaInsert">
					<div class="form-group">
						<label> 문의사항 : <input type="text" class="form-control"
							placeholder="제목 입력" autofocus size="20" name ="qna_title"></label> <br>
						<textarea name="qna_content" cols="40" rows="6"></textarea>
						<button type="button" id="answer-submit" class="btn btn-default">전송!</button>
						<input type="hidden" value="${store.store_pk }" name="store_pk"/>
						<input type="hidden" value="${memberLoggedIn.memberPk }" name="member_pk"/>
						<input type="hidden" value="${memberLoggedIn.memberId }" name="qna_writer"/>
					</div>
				</form>
			</div>
		</div>
	</div>
	</div>
<div id="border">
	<div id="line" class="four"></div>
</div>
<div id="right-side">
	<div style="position: fixed;">
		<ul>
			<li class="shop ">
				<div class="icon ">
					<img src="${path }/resources/icons/shop.svg" alt="">
				</div> Shop
			</li>
			<li class="map">
				<div class="icon">
					<img src="${path }/resources/icons/map.svg" alt="">
				</div> Map
			</li>
			<li class="reserve">
				<div class="icon">
					<img src="${path }/resources/icons/calander.svg" alt="">
				</div> Reserve
			</li>
			<li class="qna active">
				<div class="icon active">
					<img src="${path }/resources/icons/customer.svg" alt="">
				</div> Contact
			</li>
		</ul>
	</div>
</div>
</div>
<!-- wrapper End -->
</div>
<!-- 푸터부분 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
