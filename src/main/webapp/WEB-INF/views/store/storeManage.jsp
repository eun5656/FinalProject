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
<!-- full calendar -->
<link href='${path }/resources/css/fullcalendar.min.css'
	rel='stylesheet' />
<link href='${path }/resources/css/scheduler.min.css' rel='stylesheet' />
<script src='${path }/resources/js/moment.min.js'></script>
<script src='${path }/resources/js/fullcalendar.min.js'></script>
<script src='${path }/resources/js/gcal.min.js'></script>
<script src='${path }/resources/js/scheduler.min.js'></script>
<!-- storeManage css -->
<link href="${path }/resources/css/storeManage.css?ver=2"
	rel="stylesheet" />
<!-- storeManage js -->
<script src="${path }/resources/js/storeManage.js"></script>
<div>
	<div id="wrapper">

		<div id="left-side">

			<div id="first">

				<div class="row">

					<!-- 가게 이미지 시작 -->
					<div class="col-lg-4 col-md-4 col-sm-4 col-xs-10 animatepop">
						<div class="wh100">
							<div class="input-group image-preview zindex bottom">
								<input type="text" class="form-control image-preview-filename"
									disabled="disabled">
								<!-- don't give a name === doesn't send on POST/GET -->
								<span class="input-group-btn"> <!-- image-preview-clear button -->
									<button type="button"
										class="btn btn-default image-preview-clear"
										style="display: none;">
										<span class="glyphicon glyphicon-remove"></span> Clear
									</button> <!-- image-preview-input -->
									<div class="btn btn-default image-preview-input">
										<span class="glyphicon glyphicon-folder-open"></span> <span
											class="image-preview-input-title">Browse</span> <input
											type="file" accept="image/png, image/jpeg, image/gif"
											name="input-file-preview" />
										<!-- rename it -->
									</div>
								</span>
							</div>
							<!-- /input-group image-preview [TO HERE]-->

							<img class="img-responsive radius14"
								src="${path }/resources/images/${store.store_re_img }" alt="">
						</div>
					</div>
					<!--가게 이미지 끝-->
					<div class="col-lg-8 col-md-8 col-sm-8 col-xs-10">
						<label> 가게 이름 : <input type="text" class="form-control"
							value="가게이름"></label> <label>주소 : <input type="text"
							name="address" class="form-control"
							value="${store.store_address}">
						</label> <label>연락처 : <input type="text" name="phone"
							class="form-control" value="${store.store_phone}">
						</label> <label>휴일 : <input type="text" name="holiday"
							class="form-control"
							value="${store.store_holiday!=null?'<%=store.getStore_holiday()%>':'연중무휴'}">
							<br>
						</label>
					</div>
				</div>
				<div class="row" style="margin-top: 20px;">
					<input type="text" class="form-control" value="공지 사항 입력 ">
				</div>
				<div class="row">
					<div class="tabbable-panel">
						<div class="tabbable-line">
							<ul class="nav nav-tabs ">
								<li class="active"><a href="#tab_default_2"
									data-toggle="tab"> 가격 </a></li>
								<li><a href="#tab_default_1" data-toggle="tab"> 시술정보 </a></li>
								<li><a href="#tab_default_3" data-toggle="tab"> 리뷰 </a></li>
							</ul>
							<div class="tab-content">
								<!-- tab1 시작 -->
								<div class="tab-pane" id="tab_default_1">
									<!-- 추가 버튼 -->
									<div class="col-lg-4 col-md-4 col-sm-4 col-xs-10 animatepop">
										<div class="wh100">
											<a href="#NailModal" data-toggle="modal"> <img
												class="img-responsive centerImg"
												src="${path}/resources/images/plus.png" alt=""></a>
										</div>
									</div>
									<!-- 추가버튼 끝-->
									<div class="col-lg-4 col-md-4 col-sm-4 col-xs-10 animatepop">
										<div class="wh100">
											<div class="input-group image-preview zindex bottom">
												<button type="button" class="btn btn-default">
													<span class="glyphicon glyphicon-pencil"></span> 수정
												</button>
												<button type="button" class="btn btn-default">
													<span class="glyphicon glyphicon-remove"></span> 삭제
												</button>
											</div>

											<img class="img-responsive radius14"
												src="http://placehold.it/350x250" alt="">
										</div>
									</div>
									<!-- 기존의 시술정보 클릭하여 수정가능 -->


									<!-- 모달 이미지 Nailmodal -->
									<div class="modal fade" id="NailModal">
										<div class="modal-dialog">
											<div class="modal-content">

												<!-- Modal Header -->
												<div class="modal-header">
													<h4 class="modal-title">시술정보 편집</h4>
													<button type="button" class="close" data-dismiss="modal">&times;</button>
												</div>

												<!-- Modal body -->
												<div class="modal-body">
													<div class="wh100">
														<div class="input-group image-preview zindex bottom">
															<input type="text"
																class="form-control image-preview-filename"
																disabled="disabled">
															<!-- don't give a name === doesn't send on POST/GET -->
															<span class="input-group-btn"> <!-- image-preview-clear button -->
																<button type="button"
																	class="btn btn-default image-preview-clear"
																	style="display: none;">
																	<span class="glyphicon glyphicon-remove"></span> Clear
																</button> <!-- image-preview-input -->
																<div class="btn btn-default image-preview-input">
																	<span class="glyphicon glyphicon-folder-open"></span> <span
																		class="image-preview-input-title">Browse</span> <input
																		type="file" accept="image/png, image/jpeg, image/gif"
																		name="input-file-preview" />
																	<!-- rename it -->
																</div>
															</span>
														</div>
														<!-- /input-group image-preview [TO HERE]-->

														<img class="img-responsive radius14"
															src="http://placehold.it/350x250" alt="">
													</div>
													<p>네일 색상, 타입, 종류 선택</p>

												</div>

												<!-- Modal footer -->
												<div class="modal-footer">
													<button type="button" class="btn btn-primary"
														data-dismiss="modal">저장</button>
												</div>

											</div>
										</div>
									</div>
								</div>
								<!-- tab1 끝 -->
								<div class="tab-pane active" id="tab_default_2">
									<div style="width: 70%;">
										<h3 style="margin-left: 30px;">젤네일</h3>
										<hr style="margin-left: 30px;">
										<c:forEach var="menu" items="${menus }" varStatus="status">
											<form name="menuUpdate" method="post" action="/menuUpdate.do">
											<label>제목 입력 : 
											<input type="text" placeholder="메뉴 제목 입력" name="menu_name"
												class="form-control" value="${menu.menu_name }"/></label>
											<label>정보 입력: 
											<input type="text" placeholder="정보 입력" name="menu_Info"
												class="form-control" value="${menu.menu_info }"/></label>
											<label>가격 입력: 
											<input type="number" placeholder="가격 입력" name="menu_price"
												class="form-control" value="${menu.menu_price }"/></label>
											<select name="menu_check">
												<option value="손"<c:if test="${menu.check eq '손'}">selected</c:if>>손</option>
												<option value="발"<c:if test="${menu.check eq '발'}">selected</c:if>>발</option>
											</select>
											<button type="submit" id="menuUpdate" class="btn-success">
												수정</button>
											<button id="menuDelete" class="btn-danger" value="${menu.menu_pk }" style="float: right;">삭제</button>
											</form>
										</c:forEach>
										<br> <br>
										<ul class="menuInsertForm"></ul>
										<button onclick="menuInsertForm()" class="btn-primary"
											value="" style="float: center;">추가</button>

									</div>

								</div>
								<div class="tab-pane" id="tab_default_3"></div>
								<!-- 3번째 탭 끝 -->
							</div>
							<!-- tab content 끝 -->
						</div>
					</div>
					<!-- tab 화면 끝 -->


				</div>

			</div>


			<div id="second">
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
<div id="fourth">
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
			<li class="map">
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




</div>



<!-- 푸터부분 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
