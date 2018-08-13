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
			<div id="second" class="active">
				<form class="form-signin">
					<div class="row">
						<div class="col-md-7 col-md-offset-2">

							<div class="panel panel-default">

								<div class="panel panel-primary" style='margin-bottom: 0px;'>


									<div class="text-center">
										<h3 style="color: #2C3E50">Financial Reports</h3>
										<h4>
											<label for="Choose Report" style="color: #E74C3C">Choose
												Report</label>
										</h4>
										<div class="input-group">
											<span class="input-group-addon"><span
												class="glyphicon glyphicon-tasks"></span></span> <select
												class="form-control">
												<option value="Income" selected>Income</option>
												<option value="Expenses">Expenses</option>
												<option value="Profit">Profit</option>
											</select>
										</div>
										<h5>
											<label for="Choose Report" style="color: #E74C3C">
												Time :</label> <input id="a" type="radio" name="type" value="Daily">Daily
											<input id="b" type="radio" name="type" value="Weekly">Weekly
											<input id="c" type="radio" name="type" value="Monthly">Monthly
										</h5>

										<div class="customer">
											<div class="input-group">
												<span class="input-group-addon"><span
													class="glyphicon glyphicon-calendar"></span></span> <input
													type="date" class="form-control" placeholder="Date" />
											</div>
										</div>
										</br>
										<button type="button" class="btn btn-primary btn-lg btn3d">
											<span class="glyphicon glyphicon-search"></span> View
										</button>
									</div>
									<div class="panel-body">

										<table class="table table-striped table-condensed">
											<thead>
												<tr>
													<th class="text-center" width="115px">번호</th>
													<th class="text-center" width="115px">회원이름</th>
													<th class="text-center" width="115px">매출</th>
													<th class="text-center" width="115px">날짜</th>
													<th class="text-center" width="115px">시술내용</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td class="text-center" width="150px">1</td>
													<td class="text-center" width="150px">Mai Ahmed</td>
													<td class="text-center" width="150px">500</span>
													</td>
													<td class="text-center" width="150px">3/12/2016</span>
													</td>
													<td class="text-center" width="150px">Prescription</span>
													</td>
												</tr>
												<tr>
													<td class="text-center">2</td>
													<td class="text-center">Mai Ahmed</td>
													<td class="text-center">60</span>
													</td>
													<td class="text-center">3/12/2016</span>
													</td>
													<td class="text-center">Appoitment</span>
													</td>
												</tr>
												<tr>
													<td class="text-center">3</td>
													<td class="text-center">Ahmed Waled</td>
													<td class="text-center">180</span>
													</td>
													<td class="text-center">3/12/2016</span>
													</td>
													<td class="text-center">Prescription</span>
													</td>
												</tr>
												<tr>
													<td class="text-center">3</td>
													<td class="text-center">Waled</td>
													<td class="text-center">180</span>
													</td>
													<td class="text-center">3/12/2016</span>
													</td>
													<td class="text-center">Prescription</span>
													</td>
												</tr>
												<tr>
													<td class="text-center">3</td>
													<td class="text-center">Waled</td>
													<td class="text-center">180</span>
													</td>
													<td class="text-center">3/12/2016</span>
													</td>
													<td class="text-center">Prescription</span>
													</td>
												</tr>
											</tbody>
										</table>
										<div class="text-center">
											<h4>
												<label style="color: #E74C3C" for="Total">Total :</label>7740
											</h4>
										</div>
									</div>
								</div>
							</div>
				</form>
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
			<li class="shop">
				<div class="icon">
					<img src="${path }/resources/icons/shop.svg" alt="">
				</div> Shop
			</li>
			<li class="sales active">
				<div class="icon active">
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
