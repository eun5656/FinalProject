<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.spring.store.model.vo.Store"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% Store store=(Store)request.getAttribute("store"); %>
<!-- 해더부분 -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="NailStore" name="pageTitle" />
</jsp:include>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!-- full calendar -->
<link href='${path }/resources/css/fullcalendar.min.css' rel='stylesheet' />
<link href='${path }/resources/css/scheduler.min.css' rel='stylesheet' />
<script src='${path }/resources/js/moment.min.js'></script>
<script src='${path }/resources/js/fullcalendar.min.js'></script>
<script src='${path }/resources/locale/ko.js'></script>
<script src='${path }/resources/js/gcal.min.js'></script>
<script src='${path }/resources/js/scheduler.min.js'></script>
<!-- storeManage css -->
<link href="${path }/resources/css/storeManage.css" rel="stylesheet" />
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
							value="가게이름"></label> <br> 
							<label>주소 : <input type="text" name="address" value="${store.store_address}"> <br>
													</label>
							<label>연락처 : <input type="text" name="phone"value="${store.store_phone}"> <br>
													</label>	
							<label>휴일 : <input type="text" name="holiday" value="${store.store_holiday!=null?'<%=store.getStore_holiday()%>':'연중무휴'}"> <br>
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
												class="img-responsive centerImg" src="images/plus.png"
												alt=""></a>
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
											<!-- /input-group image-preview [TO HERE]-->

											<img class="img-responsive radius14"
												src="http://placehold.it/350x250" alt="">
										</div>
									</div>
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
											<!-- /input-group image-preview [TO HERE]-->

											<img class="img-responsive radius14"
												src="http://placehold.it/350x250" alt="">
										</div>
									</div>
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
										<p style="width: 100%;">
											<span>젤네일(회원가)</span><span style="float: right;">40000원</span>
										</p>
										<br> <br>
									</div>

								</div>
								<div class="tab-pane" id="tab_default_3">
									

								</div>
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
					<div class="container">
						<div class="row">
							<div class="col-md-7 col-md-offset-2">

								<div class="panel panel-default">

									<div class="panel panel-primary">


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
<div id="third" class="active">


	<div id='calendar'></div>
	<div id='calendarModal' class="modal fade pop-up-1" tabindex="-1"
		role="dialog" aria-labelledby="myLargeModalLabel-1" aria-hidden="true">
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
<div id="fifth" style="height: 700px;">

	<h1>디자이너 관리</h1>

	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec
		at viverra est, eu finibus mauris. Quisque tempus vestibulum
		fringilla. Morbi tortor eros, sollicitudin eu arcu sit amet, aliquet
		sagittis dolor.</p>

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
					<img src="icons/shop.svg" alt="">
				</div> Shop
			</li>
			<li class="map">
				<div class="icon">
					<img src="icons/paper.svg" alt="">
				</div> 매출관리
			</li>
			<li class="reserve">
				<div class="icon">
					<img src="icons/calander.svg" alt="">
				</div> Reserve(예약)
			</li>
			<li class="qna">
				<div class="icon">
					<img src="icons/customer.svg" alt="">
				</div> QnA(문의)
			</li>
			<li class="designer">
				<div class="icon">
					<img src="icons/designer.svg" alt="">
				</div> 임시
			</li>
		</ul>
	</div>
</div>
</div>
<script>
			$(window).resize(function() {
				if ($(window).width() < 768) {
					$("#line").addClass("one");
					$("#line").removeClass("two");
					$("#line").removeClass("three");
					$("#line").removeClass("four");
					$("#line").removeClass("five");
				}
			});
			// 메뉴 이동
			$(".shop").click(function() {
				$("#first").addClass("active");
				$("#second").removeClass("active");
				$("#third").removeClass("active");
				$("#fourth").removeClass("active");
				$("#fifth").removeClass("active");
				$("#line").addClass("one");
				$("#line").removeClass("two");
				$("#line").removeClass("three");
				$("#line").removeClass("four");
				$("#line").removeClass("five");
			})
			$(".map").click(function() {
				$("#first").removeClass("active");
				$("#second").addClass("active");
				$("#third").removeClass("active");
				$("#fourth").removeClass("active");
				$("#fifth").removeClass("active");
				$("#line").addClass("two");
				$("#line").removeClass("one");
				$("#line").removeClass("three");
				$("#line").removeClass("four");
				$("#line").removeClass("five");
			})

			$(".reserve").click(function() {
				$("#first").removeClass("active");
				$("#second").removeClass("active");
				$("#third").addClass("active");
				$("#fourth").removeClass("active");
				$("#fifth").removeClass("active");
				$("#line").addClass("three");
				$("#line").removeClass("two");
				$("#line").removeClass("one");
				$("#line").removeClass("four");
				$("#line").removeClass("five");
			})

			$(".qna").click(function() {
				$("#first").removeClass("active");
				$("#second").removeClass("active");
				$("#third").removeClass("active");
				$("#fourth").addClass("active");
				$("#fifth").removeClass("active");
				$("#line").removeClass("five");
				$("#line").addClass("four");
				$("#line").removeClass("two");
				$("#line").removeClass("three");
				$("#line").removeClass("one");
			})
			$(".designer").click(function() {
				$("#first").removeClass("active");
				$("#second").removeClass("active");
				$("#third").removeClass("active");
				$("#fourth").removeClass("active");
				$("#fifth").addClass("active");
				$("#line").removeClass("four");
				$("#line").removeClass("two");
				$("#line").removeClass("three");
				$("#line").removeClass("one");
				$("#line").addClass("five");
			})
			//메뉴이동 끝
			//파일 삽입

			$('.image-preview-clear').click(function() {
				var container = $(this).closest(".animatepop");
				$(this).closest('.input-group').next().attr("src", "http://placehold.it/350x250");
				container.find('.image-preview-filename').val("");
				container.find('.image-preview-clear').hide();
				container.find('.image-preview-input input:file').val("");
				container.find(".image-preview-input-title").text("Browse");
			});
			// Create the preview image
			$(".image-preview-input input:file").change(function() {
				var file = this.files[0];
				var reader = new FileReader();

				var container = $(this).closest(".animatepop");
				var image = container.find(".img-responsive");
				reader.onload = function(e) {
					container.find(".image-preview-input-title").text("Change");
					container.find(".image-preview-clear").show();
					container.find(".image-preview-filename").val(file.name);
					image
						.attr('src', e.target.result)
						.css('width', '100%')
						.css('height', '100%')
						.css('position', 'relative');
				}
				reader.readAsDataURL(file);
			});
			$(".image-preview-filename").change(function() {
				console.log("출력됨");
			});
			//파일 삽입 끝
		</script>
<!-- full calender script -->
<script>
			$(function() {
				//영업시작시간~~
				var min = '10:00:00';
				var max = '23:00:00';
				var reserDate;
				var startTime;
				var endTime;
				var checkDate;
				//직원휴일
				var businessHours = [{
					start: '2018년07월30일',
					end: '2018년07월30일',
				}];
				/*변수 초기화*/
				var reservaiton = [{
						id: '1',
						resourceId: 'a',
						start: '2018-04-06',
						end: '2018-04-08',
						title: 'event 1'
					},
					{
						id: '2',
						resourceId: 'a',
						start: '2018-04-07T09:00:00',
						end: '2018-04-07T14:00:00',
						title: 'event 2'
					},
					{
						id: '3',
						resourceId: 'b',
						start: '2018-04-07T12:00:00',
						end: '2018-04-08T06:00:00',
						title: 'event 3'
					},
					{
						id: '4',
						resourceId: 'c',
						start: '2018-04-07T07:30:00',
						end: '2018-04-07T09:30:00',
						title: 'event 4'
					},
					{
						id: '5',
						resourceId: 'd',
						start: '2018-04-07T10:00:00',
						end: '2018-04-07T15:00:00',
						title: 'event 5'
					},
					{
						id: '6',
						resourceId: 'a',
						start: '2018-07-24T10:00:00',
						end: '2018-07-24T10:30:00',
						color: 'rgb(49, 128, 208)',
						title: '홍성진',
						description: '- a 디자이너님 예약'
					}, {
						id: '7',
						resourceId: 'b',
						start: '2018-07-24T10:30:00',
						end: '2018-07-24T11:00:00',
						title: '홍성진',
						description: '- a 디자이너님 예약'
					},
					{
						id: '8',
						resourceId: 'c',
						start: '2018-07-24T11:30:00',
						end: '2018-07-24T12:00:00',
						title: '홍성진',
						description: '- a 디자이너님 예약'
					},
					{
						id: '9',
						resourceId: 'c',
						start: '2018-07-24T12:30:00',
						end: '2018-07-24T13:00:00',
						title: '홍성진',
						description: '- a 디자이너님 예약'
					}
				];

				var employee = [{
						id: 'a',
						title: '원장님',
						eventColor: 'blue'
					},
					{
						id: 'b',
						title: '디자이너',
						eventColor: 'green',

					},
					{
						id: 'c',
						title: '디자이너',
						eventColor: 'orange',
						businessHours: businessHours
					},
				];
				$('#calendar').fullCalendar({
					themeSystem: 'bootstrap3',

					//// uncomment this line to hide the all-day slot
					allDaySlot: false,

					//설정
					//영업 시작, 종료시간
					minTime: min,
					maxTime: max,

					//디자이너 추가
					resources: employee,

					//예약내역 추가
					events: reservaiton,

					//이벤트에 시각까지 보여주기
					displayEventTime: false,
					editable: true, //드래그해서 움직이는것
					eventLimit: true, // allow "more" link when too many events
					displayEventTime: true,

					navLinks: true, // can click day/week names to navigate views

					select: function() {
						dayClick();
					},

					lang: "ko",

					//shows time in 15 min slot
					slotDuration: '00:30:00',
					slotLabelInterval: 30,
					slotLabelFormat: 'a HH :mm ',


					header: {
						left: 'prev,next',
						center: 'title',
						right: 'month,agendaThreeDay,agendaDay' //agendaTwoDay
					},

					views: {
						agendaThreeDay: {
							duration: {
								days: 3
							},

							type: 'agenda',

							// views that are more than a day will NOT do this behavior by default
							// so, we need to explicitly enable it
							groupByResource: true

							//// uncomment this line to group by day FIRST with resources underneath
							//groupByDateAndResource: true
						},
						agendaDay: {
							// options apply to basicWeek and basicDay views
						}
					},


					googleCalendarApiKey: "AIzaSyDcnW6WejpTOCffshGDDb4neIrXVUA1EAE", // Google API KEY
					eventSources: [
						// 대한민국의 공휴일
						{
							googleCalendarId: "ko.south_korea#holiday@group.v.calendar.google.com",
							className: "koHolidays",
							color: "#be0000",
							textColor: "#FFFFFF"
						}
					],


					/* hover시 예약내역보여주기*/
					eventRender: function(eventObj, $el) {
						$el.popover({
							title: '예약내역',
							content: eventObj.description,
							trigger: 'hover',
							placement: 'top',
							container: 'body'
						});
					},


					dayClick: function(date, jsEvent, view, resource) {

						var now = new Date
						var nowDate = new Date(now.getFullYear(), now.getMonth(), now.getDate(), now.getHours() + 1, now.getMinutes());
						//console.log("nowDate" + nowDate);
						console.log("nowDate" + nowDate);


						console.log(
							'dayClick',
							reserDate = date.format(),
							resource ? resource.id : '(no resource)'
						);
						console.log('reserDate ' + reserDate);
						console.log('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
						console.log('Current view: ' + view.name);
						console.log('Clicked on: ' + date.format('YYYY년MM월DD일'));
						//console.log(resource.businessHours[0].start);
						//console.log(resource.businessHours[0].end);
						console.log(date.format());
						$('#reserDate').html(date.format('YYYY년MM월DD일 HH시mm분'));
						var clickDate = date.format('YYYY년MM월DD일');

						var checkDate = new Date(date.format());


						// 현재날짜이전이면 못가게 로직처리하기

						console.log("nowDate" + nowDate);
						console.log("checkDate" + checkDate);
						if (resource != null) {
							/*쉬는날 로직*/
							if (resource.businessHours != null) {
								if (resource.businessHours[0].start == clickDate || resource.businessHours[0].end == clickDate) {
									alert("휴무입니다.");
									//window.location.reload();
									date = null;
								} else {
									//현재날짜면 예약불가로.
									if (nowDate <= checkDate) {
										$('#calendarModal').modal();
									} else {
										date = null;
										alert("예약시간이 아닙니다...");
									}
								}
							} else {
								//현재날짜면 예약불가로.
								if (nowDate <= checkDate) {
									$('#calendarModal').modal();
								} else {
									date = null;
									alert("예약할수 없는 날짭입니다..");
								}
							}
						}
						//var title =$('select[name=choice1]').val()
						var title = $('#reservation-userName').val();
						var description = title + "-" + $('select[name=choice-employee]').val() + "디자이너 님 예약"
						var id = $('#reservation-id').val();
						var choice1 = $('#choice1').val();
						var choice2 = $('#choice2').val();
						var choice_employee = $('#choice-employee').val();

						/*    var eventData;
						    if (title) {
						      eventData = {
						        title: title,
						        start: date
						      };
						      $('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
						    }
						    $('#calendar').fullCalendar('unselect');*/

						$("#result-reservaiton").one('click', function() {
							//reservation 객체 추가로직
							var aJson = new Object();
							aJson.id = '8';
							aJson.resourceId = 'a';
							aJson.start = '2018-07-28T13:15:00';
							aJson.end = '2018-07-28T15:15:00';
							aJson.color = 'rgb(49, 128, 208)';
							aJson.title = '홍성진님 예약'
							reservaiton.push(aJson);


							/*30분 추가*/
							console.log(reservaiton);
							var javaScriptRelease = Date.parse(date);
							//alert(javaScriptRelease + 1800000);
							javaScriptRelease += 1800000;

							/*화면에 등록시키기*/
							$('#calendar').fullCalendar('renderEvent', {
								title: title,
								start: date, //specify start date
								id: '10',
								description: description,
								resourceId: resource.id,
								end: javaScriptRelease

							});

						});

					},


					eventClick: function(calEvent, jsEvent, view) {
						$('#reserDate').html(calEvent.start.format('YYYY년MM월DD일 HH시mm분'));
						var check = calEvent.choice1;
						console.log(typeof calEvent.choice_employee);
						$('#calendarModal').modal();
						$('#remove-reservaiton').one('click', function() {
							//var check = prompt("예약비밀번호입력");
							var check1 = confirm("삭제하시겠습니까?")
							if (check1 == true) {
								$('#calendar').fullCalendar('removeEvents', calEvent.id);
								$('#calendarModal').modal('toggle');
							}
						})
					},

				});

			});
		</script>


</div>



<!-- 푸터부분 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
