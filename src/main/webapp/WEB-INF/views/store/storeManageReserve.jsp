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
<link href="${path }/resources/css/storeManage.css?ver=7"
	rel="stylesheet" />
<script type="text/javascript">
// 외부 js 에서 쓰이는 변수 setting
var path = "${pageContext.request.contextPath }";
var store_pk="${store.store_pk}"
</script>
<!-- storeManage js -->
<script src="${path }/resources/js/storeManage.js?ver=3"></script>
<div>
<div id="wrapper">

<div id="left-side">
			
<div id="third" class="active">

		<div id='calendar'></div>
		<div id='calendarModal' class="modal fade pop-up-1" tabindex="-1"
			role="dialog" aria-labelledby="myLargeModalLabel-1"
			aria-hidden="true">
			<div class="modal-dialog" style="width: 400px;">
				<form class="" action="" method="post">

					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">×</button>
							<h4 class="modal-title" id="myLargeModalLabel-1">예약등록</h4>
						</div>
						<div class="modal-body">

							<div class="row">
								<div class="form-group">
									<table id="reservaiton-form" class="table">
										<thead>
											<tr>
												<td><label for="sel1">예약자:</label></td>
												<td colspan="6">
													<p id="reserName" for="sel1">홍성진</p> <!---->
												</td>
											</tr>
										</thead>
										<tbody>

											<tr>
												<td><label for="sel1">예약일시:</label></td>
												<td colspan="6">
													<p id="reserDate" for="sel1"></p> <!--<input type="type" id="reservation-timepicker" class="timepicker form-control input-sm" name="reservation-timepicker" style="width:130px;" />-->
													<input type="hidden" id="reservation-userName"
													name="reservation-userName" value="홍성진" /> <input
													type="hidden" id="reservation-id" name="reservation-id"
													value="10" />
												</td>
											</tr>

											<tr>
												<td><label for="sel1">시술선택:</label></td>
												<td style="width: 72"><select
													class="form-control input-sm" id="choice1" name='choice1'>
														<!--점주레벨이 아니면 disabled-->
														<option>손</option>
														<option>발</option>
												</select></td>
												<td colspan="5" style="width: 172px;"><select
													class="form-control input-sm" id="choice2" name='choice2'>
														<!--점주레벨이 아니면 disabled-->
														<option>메뉴1</option>
														<option>메뉴2</option>
														<option>메뉴3</option>
												</select></td>
											</tr>

											<tr>
												<td><label for="sel1">담당자:</label></td>
												<td><select class="form-control input-sm"
													id="choice-employee" name="choice-employee">
														<!--점주레벨이 아니면 disabled-->
														<option value="a">원장</option>
														<option value="b">디자이너1</option>
														<option value="c">디자이너2</option>
												</select></td>
											</tr>
									</table>
									</tbody>
									<hr>
									<div class="col-xs-2"></div>
									<div class="col-xs-4" style="text-align: right;">
										<button id="result-reservaiton" type="button"
											class="btn btn-success" name="button">확인</button>
									</div>
									<!--점주만 삭제-->
									<div class="col-xs-4" style="text-align: left;">
										<button id="remove-reservaiton" type="button"
											class="btn btn-danger" name="button">삭제</button>
									</div>
									<div class="col-xs-2"></div>

								</div>

							</div>
						</div>
						<!-- /.modal-content -->
				</form>
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal mixer image -->
	</div>
</div>	
</div>

<div id="right-side">
<div id="border">
	<div id="line" class="three" style="position:fixed;"></div>
</div>
	<div style="position: fixed;">
		<ul>
			<li class="shop ">
				<div class="icon ">
					<img src="${path }/resources/icons/shop.svg" alt="">
				</div> Shop
			</li>
			<li class="sales">
				<div class="icon">
					<img src="${path }/resources/icons/paper.svg" alt="">
				</div> 매출관리
			</li>
			<li class="reserve active">
				<div class="icon active">
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
