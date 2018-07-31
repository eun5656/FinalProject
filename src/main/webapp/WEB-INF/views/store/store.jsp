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
<!-- <!-- store css -->
-->
<link href="${path }/resources/css/store.css" rel="stylesheet" />
<div id="wrapper">

	<div id="left-side">

		<div id="first" class="active">

			<div class="row">

				<!-- 가게 이미지 시작 -->
				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-10 animatepop">
					<img src="icons/love_blank.svg" alt="북마크 아이콘" class="b_icon zindex"
						value="false" id="b_icon">
					<div class="hovereffect">
						<img class="img-responsive radius14"
							src="http://placehold.it/350x250" alt="">
						<div class="overlay">
							<h2>가게 이름</h2>
							<p>
								<a href="#">가게 이미지</a>
							</p>
						</div>
					</div>
				</div>
				<!--가게 이미지 끝-->
				<div class="col-lg-8 col-md-8 col-sm-8 col-xs-10">
					<h3>NailShop</h3>
					<p>장소 : 서울 마포구 월드컵북로 396</p>
					<p>Tel 02.355.2311</p>
					<p>평일 10:00 - 21:00 토요일 11:00 - 21:00 일요일 11:00 - 20:00 공휴일
						10:00 - 20:00</p>
					<p>속눈썹 연장, 왁싱, 스킨/바디케어, 주차, 무선 인터넷, 애완동물 동반</p>
				</div>
			</div>
			<div class="row" style="margin-top: 20px;">
				<marquee>공지사항입니다~~~~~~~~~~~~</marquee>
			</div>
			<!-- tab 화면 시작-->
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
								<div class="carousel slide multi-item-carousel" id="theCarousel">
									<div class="carousel-inner">
										<div class="item active">
											<div class="col-lg-4 col-md-4 col-sm-4 col-xs-10 animatepop "
												style="margin-top: 10px;">
												<div class="hovereffect">
													<img class="img-responsive radius14 smail-carousel"
														src="http://placehold.it/350x250" alt="">
													<div class="overlay">
														<h2>네일 디자인 이름1</h2>
														<p>
															<a href="#">더보기</a>
														</p>
													</div>
												</div>
											</div>
										</div>
										<div class="item">
											<div class="col-lg-4 col-md-4 col-sm-4 col-xs-10 animatepop"
												style="margin-top: 10px;">
												<div class="hovereffect">
													<img class="img-responsive radius14 smail-carousel"
														src="http://placehold.it/350x250" alt="">
													<div class="overlay">
														<h2>네일 디자인 이름2</h2>
														<p>
															<a href="#">더보기</a>
														</p>
													</div>
												</div>
											</div>
										</div>
<<<<<<< HEAD
										<div class="item">
											<div
												class="col-lg-4 col-md-4 col-sm-4 col-xs-10 animatepop disappear"
												style="margin-top: 10px;">
												<div class="hovereffect">
													<img class="img-responsive radius14 smail-carousel"
														src="http://placehold.it/350x250" alt="">
													<div class="overlay">
														<h2>네일 디자인 이름3</h2>
														<p>
															<a href="#">더보기</a>
														</p>
													</div>
												</div>
											</div>
										</div>
										<div class="item">
											<div
												class="col-lg-4 col-md-4 col-sm-4 col-xs-10 animatepop disappear"
												style="margin-top: 10px;">
												<div class="hovereffect">
													<img class="img-responsive radius14 smail-carousel"
														src="http://placehold.it/350x250" alt="">
													<div class="overlay">
														<h2>네일 디자인 이름4</h2>
														<p>
															<a href="#">더보기</a>
														</p>
													</div>
												</div>
											</div>
									</div>
									<!-- tab1 끝 -->
									<div class="tab-pane active" id="tab_default_2">																					
									</div>
									<div class="tab-pane" id="tab_default_3">
										</div>
										<!--  Example item end -->
									</div>
									<a class="left carousel-control" href="#theCarousel"
										data-slide="prev"><i
										class="glyphicon glyphicon-chevron-left"></i></a> <a
										class="right carousel-control" href="#theCarousel"
										data-slide="next"><i
										class="glyphicon glyphicon-chevron-right"></i></a>
								</div>
							</div>
							<!-- tab1 끝 -->
							<div class="tab-pane active" id="tab_default_2">
							<p></p>
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
			<!-- row 끝 -->
		</div>


		<div id="second">

			<div class="NailStoreMap animatepop" id="map">map 삽입</div>
			<div class="addrText animatepop">
				<p>London, England</P>
			</div>

		</div>
		<div id="third">
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
			<div class="col-lg-4 col-md-4 col-sm-4 col-xs-10 animatepop">
				<h3>Nail Shop Name</h3>
				<p>Nail Shop Tel 02.355.2311</p>
				<p>KakaoChat : nail0997</p>
				<p>instagram : @beautyU21</p>
			</div>
			<!--가게 Info 끝-->
			<div class="col-lg-7 col-md-7 col-sm-7 col-xs-10">
				<form class="" action="/insertQnA.html" method="post">
					<div class="form-group">
						<label> 문의사항 : <input type="text" class="form-control"
							placeholder="제목 입력" autofocus size="20"></label> <br>
						<textarea name="content" cols="40" rows="6"></textarea>
						<button type="submit" name="answer-submit" class="btn btn-default">전송!</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<div id="border">
	<div id="line" class="one"></div>
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
					<img src="icons/map.svg" alt="">
				</div> Map(지도)
			</li>
			<li class="reserve">
				<div class="icon">
					<img src="icons/calander.svg" alt="">
				</div> Reserve(예약)
			</li>
			<li class="qna">
				<div class="icon">
					<img src="icons/customer.svg" alt="">
				</div> Contact(문의)
			</li>
		</ul>
	</div>
</div>

<!-- 푸터부분 -->
<%-- <jsp:include page="/WEB-INF/views/common/footer.jsp" /> --%>
