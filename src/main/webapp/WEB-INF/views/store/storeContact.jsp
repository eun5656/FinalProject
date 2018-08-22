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
<script src="${path }/resources/js/store.js?ver=9"></script>
<div>
<div id="wrapper">
	<div id="left-side">
	
		<div class="row">
			<div class="col-lg-4 col-md-4 col-sm-4 col-xs-10 animatepop">
				<h3>Nail Shop ${store.store_name }</h3>
				<p>Nail Shop Tel ${store.store_phone }</p>
				<p>KakaoChat : ${store.store_kakao }</p>
				<p>instagram : ${store.store_instagram }</p>
			</div>
			<!--가게 Info 끝-->
			<div class="col-lg-7 col-md-7 col-sm-7 col-xs-10">
					<form class="form-horizontal" action="${path}/qna/storeQna.do?qna_writer=${memberLoggedIn.memberId}&store_pk=${store.store_pk}&member_pk=${memberLoggedIn.memberPk}" method="post">
					<div class="form-group">
						<label for="" class="col-sm-3 control-label">제목 : </label>
						<div class="col-sm-6">
						<input type="text" class="form-control" id="qna_title" name="qna_title" placeholder="제목 입력" autofocus size="20">
						</div>
					</div>
					
					<div class="form-group">
						<label for="" class="col-sm-3 control-label">내 용: </label>
						<div class="col-sm-6">
							<textarea class="form-control" id="qna_content" name="qna_content" rows="10" style="resize: none;"></textarea>
						</div>
					</div>
				
					<div class="form-group">
						<button type="submit"  class="btn btn-default center-block" value="${memberLoggedIn.memberId}" onclick="return fn_submit(${memberLoggedIn.memberId});">전송</button>
					</div>
					
				</form>
				
				<script>
				
				function fn_submit(value) {
					var qna_title = $("#qna_title").val();
					var qna_content = $("#qna_content").val();
					
					qna_title = $.trim(qna_title);
					qna_content = $.trim(qna_content);
					if (qna_title.length == 0 || qna_title == null) {
						alert("문의제목을 입력해주세요")
						$("#qna_title").focus();
						return false;
					}
					
					if (qna_content.length == 0 || qna_content == null) {
						alert("문의내용을 입력해주세요");
						$("#qna_content").focus();
						return false;
					}
				
					if(value==null)
					{
						alert("로그인후 이용해주세요");
						return false;
					}
				
				}
				</script>
			</div>
		</div>
	</div>
<!-- left end -->
<div id="right-side">
<div id="border" >
	<div id="line" class="one" style="position:fixed;"></div>
</div>
<div style="position: fixed;">
			<ul>
			<li class="shop active ">
				<div class="icon active">
					<img src="${path }/resources/icons/shop.svg" alt="">
				</div> <span class="right"> Shop</span>
			</li>
			<li class="map ">
				<div class="icon">
					<img src="${path }/resources/icons/map.svg" alt="">
				</div> <span class="right"> 예약 리스트</span>
			</li>
			<li class="reserve">
				<div class="icon">
					<img src="${path }/resources/icons/calander.svg" alt="">
				</div>
				<span class="right"> Reserve(예약)</span>
			</li>
			<li class="qna">
				<div class="icon">
					<img src="${path }/resources/icons/customer.svg" alt="">
				</div> 
				<span class="right"> QnA(문의)</span>
			</li>
		</ul>
	</div>
	
</div>

</div>
<!-- wrapper End -->
</div>
<!-- 푸터부분 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />