<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.spring.store.model.vo.Store"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	Store store = (Store) request.getAttribute("store");
%>
<!-- 해더부분 -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="NailStore" name="pageTitle" />
</jsp:include>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!-- storeManage css -->
<link href="${path }/resources/css/storeManage.css?ver=2"
	rel="stylesheet" />
<script type="text/javascript">
// 외부 js 에서 쓰이는 변수 setting
var path = "${pageContext.request.contextPath }";
var store_pk="${store.store_pk}"
</script>
<!-- storeManage js -->
<script src="${path }/resources/js/storeManage.js"></script>
<div>
	<div id="wrapper">

		<div id="left-side">

<div id="fourth" class="active">
	<div class="row">
		<div class="col-12">
			<h1 class="text-green mb-4 text-center">문의사항</h1>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
				<div class="panel-group" id="accordion" role="tablist"
					aria-multiselectable="true">
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="headingOne">
							<h4 class="panel-title">
								<a class="" role="button" data-toggle="collapse"
									data-parent="#accordion" href="#collapseOne"
									aria-expanded="true" aria-controls="collapseOne"> <i
									class="fa fa-bars"></i>질문 1
								</a>
							</h4>
						</div>
						<div id="collapseOne" class="panel-collapse collapse in"
							role="tabpanel" aria-labelledby="headingOne">
							<div class="panel-body">
								<p>질문 내용 !</p>
								<form class="" action="/insertAnswer.html" method="post">
									<div class="form-group">
										<label> 답변 : <input type="text" class="form-control"
											placeholder="답변 내용 입력"></label>
										<button type="submit" name="answer-submit"
											class="btn btn-default">전송!</button>
									</div>
								</form>

							</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="headingTwo">
							<h4 class="panel-title">
								<a class="collapsed" role="button" data-toggle="collapse"
									data-parent="#accordion" href="#collapseTwo"
									aria-expanded="false" aria-controls="collapseTwo"> <i
									class="fa fa-link"></i>질문 2
								</a>
							</h4>
						</div>
						<div id="collapseTwo" class="panel-collapse collapse"
							role="tabpanel" aria-labelledby="headingTwo">
							<div class="panel-body">
								<p>질문 내용 !</p>
								<form class="" action="/insertAnswer.html" method="post">
									<div class="form-group">
										<label> 답변 : <input type="text" class="form-control"
											placeholder="답변 내용 입력"></label>
										<button type="submit" name="answer-submit"
											class="btn btn-default">전송!</button>
									</div>
								</form>
							</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="headingThree">
							<h4 class="panel-title">
								<a class="collapsed" role="button" data-toggle="collapse"
									data-parent="#accordion" href="#collapseThree"
									aria-expanded="false" aria-controls="collapseThree"> <i
									class="fa fa-comment"></i>질문 3
								</a>
							</h4>
						</div>
						<div id="collapseThree" class="panel-collapse collapse"
							role="tabpanel" aria-labelledby="headingThree">
							<div class="panel-body">
								<p>질문 내용 !</p>
								<form class="" action="/insertAnswer.html" method="post">
									<div class="form-group">
										<label> 답변 : <input type="text" class="form-control"
											placeholder="답변 내용 입력"></label>
										<button type="submit" name="answer-submit"
											class="btn btn-default">전송!</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


</div>
</div>
<div id="border">
	<div id="line" class="two"></div>
</div>
<div id="right-side">
	<div style="position: fixed;">
		<ul>
			<li class="shop active">
				<div class="icon active">
					<img src="${path }/resources/icons/shop.svg" alt="">
				</div> Shop
			</li>
			<li class="sales">
				<div class="icon">
					<img src="${path }/resources/icons/paper.svg" alt="">
				</div> 매출관리
			</li>
			<li class="reserve">
				<div class="icon">
					<img src="${path }/resources/icons/calander.svg" alt="">
				</div> Reserve(예약)
			</li>
			<li class="qna">
				<div class="icon">
					<img src="${path }/resources/icons/customer.svg" alt="">
				</div> QnA(문의)
			</li>
		</ul>
	</div>
</div>
</div> 
<!-- wrapper 끝 -->

</div>

<!-- 푸터부분 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
