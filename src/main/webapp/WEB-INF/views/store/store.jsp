<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 해더부분 -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="NailStore" name="pageTitle"/>
</jsp:include>
<c:set var="path" value="${pageContext.request.contextPath }"/>
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Playfair+Display:700,900" rel="stylesheet">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- full calendar -->
<link href='${path }/resource/css/fullcalendar.min.css' rel='stylesheet' />
<link href='${path }/resource/css/scheduler.min.css' rel='stylesheet' />
<script src='${path }/resource/js/moment.min.js'></script>
<script src='${path }/resource/js/fullcalendar.min.js'></script>
<script src='${path }/resource/locale/ko.js'></script>
<script src='${path }/resource/js/gcal.min.js'></script>
<script src='${path }/resource/js/scheduler.min.js'></script>
<!-- store css -->
<link href="${path }/resource/css/store.css" rel="stylesheet"/>
	<div>	
		<div id="wrapper">

			<div id="left-side">

				<div id="first" class="active">

					<div class="row">

						<!-- 가게 이미지 시작 -->
						<div class="col-lg-4 col-md-4 col-sm-4 col-xs-10 animatepop">
							<img src="icons/love_blank.svg" alt="북마크 아이콘" class="b_icon zindex" value="false" id="b_icon">
							<div class="hovereffect">
								<img class="img-responsive radius14" src="http://placehold.it/350x250" alt="">
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
							<p>Tel 02.355.2311 </p>
							<p>평일 10:00 - 21:00 토요일 11:00 - 21:00 일요일 11:00 - 20:00 공휴일 10:00 - 20:00</p>
							<p>속눈썹 연장, 왁싱, 스킨/바디케어, 주차, 무선 인터넷, 애완동물 동반</p>
						</div>
					</div>
					<div class="row" style="margin-top:20px;">
						<marquee>공지사항입니다~~~~~~~~~~~~</marquee>
					</div>
					<!-- tab 화면 시작-->
					<div class="row">
						<div class="tabbable-panel">
							<div class="tabbable-line">
								<ul class="nav nav-tabs ">
									<li class="active">
										<a href="#tab_default_2" data-toggle="tab">
							가격 </a>
									</li>
									<li>
										<a href="#tab_default_1" data-toggle="tab">
							시술정보 </a>
									</li>
									<li>
										<a href="#tab_default_3" data-toggle="tab">
							리뷰 </a>
									</li>
								</ul>
								<div class="tab-content">
									<!-- tab1 시작 -->
									<div class="tab-pane" id="tab_default_1">
										<div class="carousel slide multi-item-carousel" id="theCarousel">
											<div class="carousel-inner">
												<div class="item active">
													<div class="col-lg-4 col-md-4 col-sm-4 col-xs-10 animatepop " style="margin-top:10px;">
														<div class="hovereffect">
															<img class="img-responsive radius14 smail-carousel" src="http://placehold.it/350x250" alt="">
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
													<div class="col-lg-4 col-md-4 col-sm-4 col-xs-10 animatepop" style="margin-top:10px;">
														<div class="hovereffect">
															<img class="img-responsive radius14 smail-carousel" src="http://placehold.it/350x250" alt="">
															<div class="overlay">
																<h2>네일 디자인 이름2</h2>
																<p>
																	<a href="#">더보기</a>
																</p>
															</div>
														</div>
													</div>
												</div>
												<div class="item">
													<div class="col-lg-4 col-md-4 col-sm-4 col-xs-10 animatepop disappear" style="margin-top:10px;">
														<div class="hovereffect">
															<img class="img-responsive radius14 smail-carousel" src="http://placehold.it/350x250" alt="">
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
													<div class="col-lg-4 col-md-4 col-sm-4 col-xs-10 animatepop disappear" style="margin-top:10px;">
														<div class="hovereffect">
															<img class="img-responsive radius14 smail-carousel" src="http://placehold.it/350x250" alt="">
															<div class="overlay">
																<h2>네일 디자인 이름4</h2>
																<p>
																	<a href="#">더보기</a>
																</p>
															</div>
														</div>
													</div>
												</div>
												<!--  Example item end -->
											</div>
											<a class="left carousel-control" href="#theCarousel" data-slide="prev"><i class="glyphicon glyphicon-chevron-left"></i></a>
											<a class="right carousel-control" href="#theCarousel" data-slide="next"><i class="glyphicon glyphicon-chevron-right"></i></a>
										</div>
									</div>
									<!-- tab1 끝 -->
									<div class="tab-pane active" id="tab_default_2">
									
										<p>
											<a class="btn btn-warning" href="http://j.mp/metronictheme" target="_blank">
									Click for more features...
								</a>
										</p>
									</div>
									<div class="tab-pane" id="tab_default_3">

											<br>
											<br>

											<ul id='comment-main' class='level1'>
												<li id='review-view' class='comment-reply level1'>
													<!--댓글보기-->
													<div class='row'>
														<div class="col-xs-8">
															<div class="row">
																<div class="col-md-6 ">
																	<span class='panel-2-body-font'>아이디:</span>
																	<!--아이디부여-->
																</div>
																<div class="col-md-6 date-padding">
																	<span class='panel-2-body-font'>작성일:</span><br>
																	<!--date 부여 -->
																</div>
															</div>
															<span class="rating"> <label> <span class="star-icon">평점: </span>

															</label>
															</span>

														</div>

														<div class="col-xs-12">
															<a id="menu-modal" data-toggle="modal" data-target=".pop-up-3">
													 <img class='comment-check-img' src="images/truckReview/<%=reviewList.get(i).getReviewCommentRimage()%>" alt="Card image cap"onclick="fn_modal_review('images/truckReview/<%=reviewList.get(i).getReviewCommentRimage()%>');"></a><br>
														</div>
													</div>

													<div class="row" style="text-align:right;">

														<div class="col-xs-11 result-btn-positon">
															<br>

															<button class='btn btn-light basic-btn btn-update' type="button" onclick="fn_commentDelete(<%=k%>,<%=reviewList.get(k).getReviewCommentPk()%>)">수정</button>
															<button id="delete-button" class='btn btn-light basic-btn btn-delete' type="button" onclick="fn_commentDelete(<%=i%>,<%=reviewList.get(i).getReviewCommentPk()%>)">삭제</button>
															<hr>
														</div>
													</div>
												</li>

												<ul id='comment-reply' class="level2">
													<li class='review-comment-view<%=k%>'>
														<div class='row'>
															<div class="col-xs-2"></div>
															<div class="col-xs-10" id="review-list">
																<div class="row">
																	<div class="col-xs-5 ">
																		<span class='panel-2-body-font'>아이디:</span>
																		<!--아이디부여-->
																	</div>
																	<div class="col-md-5 date-padding">
																		<span class='panel-2-body-font'>작성일:</span><br>
																		<!--date 부여 -->
																	</div>
																	<div class="col-md-2">

																	</div>
																</div>
																<div class="row">
																	<div class="col-xs-12">
																		<span></span>
																	</div>
																	<br>


																<div class="col-xs-11" align="right">

																		<button class='btn btn-light basic-btn btn-update' type="button" onclick="fn_commentDelete(<%=k%>,<%=reviewList.get(k).getReviewCommentPk()%>)">수정</button>

																		<button class='btn btn-light basic-btn btn-delete' type="button" onclick="fn_commentDelete(<%=k%>,<%=reviewList.get(k).getReviewCommentPk()%>)">삭제</button>

																		<hr>
																	</div>
																</div>

															</div>
														</div>
													</li>
												</ul>
											</ul>


											<div class="col-xs-8" style="text-align:center;">
												<button id="load-review-button" class='btn btn-light basic-btn' type="button">더보기</button>
											</div>
											<br> <br> <br>

											<!--모달 틀-->
											<div class="modal fade pop-up-3" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel-1" aria-hidden="true" data-backdrop="false">
												<div class="modal-dialog modal-lg">
													<div class="modal-content">
														<div class="modal-header">
															<button type="button" class=" close" data-dismiss="modal" aria-hidden="true">×</button>
															<h4 class="modal-title" id="myLargeModalLabel-1">확대 이미지</h4>
														</div>
														<div class="modal-body">
															<img id="modal-review-img" class="img-responsive img-rounded center-block" alt="" width="500" height="500">
														</div>
													</div>
												</div>
											</div>







											<ul id="comment-insert">
												<li>
													<form name="TruckCommentFrm" action="" method="post" enctype="multipart/form-data">
														<!--form클래스 아이디부여-->
														<div class='row'>
															<div class="col-xs-12">
																<div class="row">
																	<div class="col-md-6 ">
																		<input type="hidden" name="truckPk" value="<%=truckPk%>" /> <input type="hidden" name="reviewCommentWriter" value="<%=memberId%>" />
																		<input type="hidden" name="reviewCommentRef" value="0" /> <input type="hidden" name="reviewCommentLevel" value="1" /> <input type="hidden" name="memberPk" value="1" /> <span class='panel-2-body-font' name="reviewCommentWriter"><%=memberId%></span>

																		<!--아이디부여-->
																	</div>
																	<div class="col-md-6 date-padding panel-2-body-font">
																		작성일 <span id="localTime" class='panel-2-body-font'></span><br>
																		<!--date 부여 -->
																	</div>
																</div>

																<span class="rating"> <label> <input type="radio"
														name="reviewStar" value="1" /> <span class="star-icon">★</span>
																</label> <label> <input type="radio" name="reviewStar" value="2" />
														<span class="star-icon">★</span> <span class="star-icon">★</span>
												</label> <label> <input type="radio" name="reviewStar" value="3" />
														<span class="star-icon">★</span> <span class="star-icon">★</span> <span
														class="star-icon">★</span>
												</label> <label> <input type="radio" name="reviewStar" value="4" />
														<span class="star-icon">★</span> <span class="star-icon">★</span> <span
														class="star-icon">★</span> <span class="star-icon">★</span>
												</label> <label> <input type="radio" name="reviewStar" value="5" />
														<span class="star-icon">★</span> <span class="star-icon">★</span> <span
														class="star-icon">★</span> <span class="star-icon">★</span> <span
														class="star-icon">★</span>
												</label>
																</span> <br>
																<div class="row">
																	<div class="col-xs-8">
																		<!-- image-preview-filename input [CUT FROM HERE]-->
																		<div class="input-group image-preview">
																			<input type="text" class="form-control image-preview-filename" disabled="disabled">
																			<!-- don't give a name === doesn't send on POST/GET -->
																			<span class="input-group-btn">
																							<!-- image-preview-clear button -->
																							<button type="button" class="btn btn-default image-preview-clear" style="display:none;">
																									<span class="glyphicon glyphicon-remove"></span> Clear
																			</button>
																			<!-- image-preview-input -->
																			<div class="btn btn-default image-preview-input">
																				<span class="glyphicon glyphicon-folder-open"></span>
																				<span class="image-preview-input-title">Browse</span>
																				<input type="file" accept="image/png, image/jpeg, image/gif" name="input-file-preview" />
																				<!-- rename it -->
																			</div>
																			</span>
																		</div>
																		<!-- /input-group image-preview [TO HERE]-->
																	</div>
																</div>
																<div class="row">
																	<div class="col-xs-8">
																		<textarea class="form-control" id="content" name="reviewCommentContent" placeholder="내용을 입력하세요." rows="2" cols="100" style="resize: none;" autofocus required="required"></textarea>
																	</div>
																	<div class="col-xs-8" style="text-align:center;">
																		<br>
																		<button id="result-button" class='btn btn-light basic-btn btn-center' type="submit">완료</button>

																		<button id="reset-button" class='btn btn-light basic-btn btn-center' type="reset">취소</button>
																		<hr>
																	</div>
																</div>
															</div>

													</form>
												</li>
											</ul>


											<script type="text/javascript">
												//review script
												//댓글삭제 ajax
												function fn_commentDelete(index, pk) {
													$.ajax({
														url: "<%=request.getContextPath()%>/truckReviewCommentDelete",
														type: "POST",
														data: {
															reviewCommentPk: pk
														},
														success: function(data) {
															alert(data.msg);
															var delbtn = $('#delete-button');
															delbtn.parent().parent().parent().parent("ul").remove();
															/* parent 4번
															var comment=$("#review-view"+index);
															comment.remove(); */
														},
														error: function(request, status, error) {
															alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
														}
													})
												}

												$("#myonoffswitch").on('click', function(e) {
													e.preventDefault();
												});

												//별 스크립트
												$(':radio').change(function() {
													console.log('New star rating: ' + this.value);
												});


												//미리보기 스크립트
												$(document).on('click', '#close-preview', function() {
													$('.image-preview').popover('hide');
													// Hover befor close the preview
													$('.image-preview').hover(
														function() {
															$('.image-preview').popover('show');
														},
														function() {
															$('.image-preview').popover('hide');
														}
													);
												});

												$(function() {
													// Create the close button
													var closebtn = $('<button/>', {
														type: "button",
														text: 'x',
														id: 'close-preview',
														style: 'font-size: initial;',
													});
													closebtn.attr("class", "close pull-right");
													// Set the popover default content
													$('.image-preview').popover({
														trigger: 'manual',
														html: true,
														title: "<strong>Preview</strong>" + $(closebtn)[0].outerHTML,
														content: "There's no image",
														placement: 'bottom'
													});
													// Clear event
													$('.image-preview-clear').click(function() {
														$('.image-preview').attr("data-content", "").popover('hide');
														$('.image-preview-filename').val("");
														$('.image-preview-clear').hide();
														$('.image-preview-input input:file').val("");
														$(".image-preview-input-title").text("Browse");
													});
													// Create the preview image
													$(".image-preview-input input:file").change(function() {
														var img = $('<img/>', {
															id: 'dynamic',
															width: 250,
															height: 200
														});
														var file = this.files[0];
														var reader = new FileReader();
														// Set preview image into the popover data-content
														reader.onload = function(e) {
															$(".image-preview-input-title").text("Change");
															$(".image-preview-clear").show();
															$(".image-preview-filename").val(file.name);
															img.attr('src', e.target.result);
															$(".image-preview").attr("data-content", $(img)[0].outerHTML).popover("show");
														}
														reader.readAsDataURL(file);
													});
												});

												//현재시간 스크립트
												$(function() {
													function fn_localTime() {
														var now = new Date();
														var year = now.getFullYear();
														var mon = (now.getMonth() + 1) > 9 ? '' + (now.getMonth() + 1) : '0' + (now.getMonth() + 1);
														var day = now.getDate() > 9 ? '' + now.getDate() : '0' + now.getDate();

														var st_date = year + '-' + mon + '-' + day;


														return st_date;
													}
													$("#localTime").html(fn_localTime());



												})

												//모달주석
												function fn_modal_review(rimage) {
													console.log(rimage);
													$("#modal-review-img").attr("src", rimage);
												}

												//더보기
												$(function() {
													$(".more-comment").slice(0, 10).show(); // 최초 10개 선택
													$("#load-review-button").click(function(e) { // Load More를 위한 클릭 이벤트e
														e.preventDefault();
														$(".more-comment:hidden").slice(0, 10).show(); // 숨김 설정된 다음 10개를 선택하여 표시
														if ($(".more-comment:hidden").length == 0) { // 숨겨진 DIV가 있는지 체크
															$("#load-review-button").hide();
														}
													});
												});
											</script>
										</div>
										<!-- 3번째 탭 끝 -->
									</div>
									<!-- tab content 끝 -->
								</div>
							</div>
							<!-- tab 화면 끝 -->

							<style>
								.hovereffect {
									width: 100%;
									height: 100%;
									float: left;
									overflow: hidden;
									position: relative;
									text-align: center;
									cursor: default;
								}

								.hovereffect .overlay {
									position: absolute;
									overflow: hidden;
									width: 80%;
									height: 80%;
									left: 10%;
									top: 10%;
									border-bottom: 1px solid #FFF;
									border-top: 1px solid #FFF;
									-webkit-transition: opacity 0.35s, -webkit-transform 0.35s;
									transition: opacity 0.35s, transform 0.35s;
									-webkit-transform: scale(0, 1);
									-ms-transform: scale(0, 1);
									transform: scale(0, 1);
								}

								.hovereffect:hover .overlay {
									opacity: 1;
									filter: alpha(opacity=100);
									-webkit-transform: scale(1);
									-ms-transform: scale(1);
									transform: scale(1);
								}

								.hovereffect img {
									display: block;
									position: relative;
									-webkit-transition: all 0.35s;
									transition: all 0.35s;
								}

								.hovereffect:hover img {
									filter: url('data:image/svg+xml;charset=utf-8,<svg xmlns="http://www.w3.org/2000/svg"><filter id="filter"><feComponentTransfer color-interpolation-filters="sRGB"><feFuncR type="linear" slope="0.6" /><feFuncG type="linear" slope="0.6" /><feFuncB type="linear" slope="0.6" /></feComponentTransfer></filter></svg>#filter');
									filter: brightness(0.6);
									-webkit-filter: brightness(0.6);
								}

								.hovereffect h2 {
									text-transform: uppercase;
									text-align: center;
									position: relative;
									font-size: 17px;
									background-color: transparent;
									color: #FFF;
									padding: 1em 0;
									opacity: 0;
									filter: alpha(opacity=0);
									-webkit-transition: opacity 0.35s, -webkit-transform 0.35s;
									transition: opacity 0.35s, transform 0.35s;
									-webkit-transform: translate3d(0, -100%, 0);
									transform: translate3d(0, -100%, 0);
								}

								.hovereffect a,
								.hovereffect p {
									color: #FFF;
									padding: 1em 0;
									opacity: 0;
									filter: alpha(opacity=0);
									-webkit-transition: opacity 0.35s, -webkit-transform 0.35s;
									transition: opacity 0.35s, transform 0.35s;
									-webkit-transform: translate3d(0, 100%, 0);
									transform: translate3d(0, 100%, 0);
								}

								.hovereffect:hover a,
								.hovereffect:hover p,
								.hovereffect:hover h2 {
									opacity: 1;
									filter: alpha(opacity=100);
									-webkit-transform: translate3d(0, 0, 0);
									transform: translate3d(0, 0, 0);
								}
							</style>
						</div>
						<!-- row 끝 -->
					</div>


					<div id="second">

						<div class="NailStoreMap animatepop" id="map">
							map 삽입
						</div>
						<div class="addrText animatepop">
							<p>London, England</P>
						</div>

					</div>
					<div id="third">
						<style>
							#calendar {
								max-width: 600px;
								margin: 50px auto;
							}

							/*custom*/

							.fc-highlight,
							.alert-info {
								background: rgb(255, 252, 253);
							}

							.fc-day-number {
								color: black;
							}

							/*.ui-timepicker-container {
								      z-index: 1080 !important;
								    }*/

							#reservaiton-form tr td {
								border-top: 0px !important;
							}

							#reservaiton-form label {
								padding-top: 5px;
							}

							#reserDate,
							#reserName {
								text-align: left;
								padding-top: 3px;
								padding-left: 3px;
								font-size: 12pt;
							}

							/*.fc-day-grid-container {
								      pointer-events: none;
								      cursor: default;
								    }*/

							.fc-more {
								pointer-events: visible;
							}

							.fc-day-header.fc-sun span {
								color: red;
							}

							.fc-sun .fc-day-number {
								color: red;
							}

							.fc-day-number {
								color: rgb(57, 113, 205);
							}

							.fc-license-message {
								display: none !important;
							}
						</style>
					<script type="text/javascript">

								$(function() {



									//영업시작시간~~
									var min = '10:00:00';
									var max = '23:00:00';
									var reserDate;
									var startTime;
									var endTime;



									//전체휴일
									var businessHours1 = [

										{
											start: '2018-07-30',
											end: '2018-07-30',
										},
										{
											start: '2018-08-21',
											end: '2018-08-21',
										},

									];




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
											eventColor: 'blue',
											businessHours1: businessHours1,
											businessHours: [ // specify an array instead
												{
													dow: [1, 2, 3, 4, 5], // Monday, Tuesday, Wednesday
													start: '08:00', // 8am
													end: '23:00' // 6pm
												},

												{
													dow: [6], // Thursday, Friday
													start: '11:00', // 10am
													end: '21:00' // 4pm
												},
												{
													dow: [0], // Thursday, Friday
													start: '11:00', // 10am
													end: '21:00' // 4pm
												}
											]
										},

										{
											id: 'b',
											title: '디자이너',
											eventColor: 'green',
											businessHours1: businessHours1,
											businessHours: [ // specify an array instead
												{
													dow: [1, 2, 3, 4, 5], // Monday, Tuesday, Wednesday
													start: '08:00', // 8am
													end: '23:00' // 6pm
												},

												{
													dow: [6], // Thursday, Friday
													start: '11:00', // 10am
													end: '21:00' // 4pm
												},
												{
													dow: [0], // Thursday, Friday
													start: '11:00', // 10am
													end: '21:00' // 4pm
												}
											]

										},
										{
											id: 'c',
											title: '디자이너',
											eventColor: 'orange',
											businessHours1: businessHours1,
											businessHours: [ // specify an array instead
												{
													dow: [1, 2, 3, 4, 5], // Monday, Tuesday, Wednesday
													start: '08:00', // 8am
													end: '23:00' // 6pm
												},

												{
													dow: [6], //
													start: '11:00',
													end: '21:00'
												},
												{
													dow: [0], //
													start: '11:00',
													end: '21:00'
												}
											]
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
										businessHours: false,



										lang: "ko",

										//shows time in 15 min slot
										slotDuration: '00:30:00',
										slotLabelInterval: 60,
										slotLabelFormat: 'a HH :mm ',

										/*점포 휴무일
										businessHours: {
											// days of week. an array of zero-based day of week integers (0=Sunday)
											dow: [1, 2, 3, 4], // Monday - Thursday

											start: '10:00', // a start time (10am in this example)
											end: '18:00', // an end time (6pm in this example)
										},*/




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


											var checkHoliday = true;
											console.log(resource.businessHours[1].dow[0])
											console.log(resource.businessHours[2].dow[0])

											var mydateObj = new Date(date);
											var chosenDay = mydateObj.getUTCDay();

											if (chosenDay == resource.businessHours[1].dow[0]) {
												if (resource.businessHours[1].start.substr(0, 2) > date.format("HH") || resource.businessHours[1].end.substr(0, 2) <= date.format("HH")) {
													checkHoliday = false;
													console.log(checkHoliday)

												}
											}
											if (chosenDay == resource.businessHours[2].dow[0]) {
												if (resource.businessHours[2].start.substr(0, 2) > date.format("HH") || resource.businessHours[2].end.substr(0, 2) <= date.format("HH")) {
													checkHoliday = false;
													console.log(checkHoliday)

												}
											}






											var check = true;
											//휴무일. 특정 휴무일 (일로 받았을떄 처리)
											for (var i = 0; i < businessHours1.length; i++) {
												if (date.format('YYYY-MM-DD') == businessHours1[i].start || date.format('YYYY-MM-DD') == businessHours1[i].end) {
													check = false; //휴무일.
												}
											}
											if (check == true) {
												var now = new Date
												var nowDate = new Date(now.getFullYear(), now.getMonth(), now.getDate(), now.getHours() + 1);
												console.log("now" + nowDate);


												var checkDate = new Date(date.format());
												console.log("check" + checkDate);

												/*1시간전 예약 못하게만들기*/
												if (checkDate <= nowDate) { //&& flag == truenowDate
													alert("예약시간이 아닙니다...");
													check2 = false;
													date=null;
												} else if (checkHoliday == false) {
													alert("영업시간이 아닙니다.");
													date=null;

												} else {
													$('#calendarModal').modal();
													$('#reserDate').html(date.format('YYYY년MM월DD일 HH시mm분'));
												}
											} else {
												console.log(i);
												alert("휴무일입니다.");
												date=null;

											}

											$("#result-reservaiton").one('click', function() {
												/*받아오기*/
												var title = $('#reservation-userName').val();
												var description = title + "-" + $('select[name=choice-employee]').val() + "디자이너 님 예약"
												var id = $('#reservation-id').val();
												var choice1 = $('#choice1').val();
												var choice2 = $('#choice2').val();
												var choice_employee = $('#choice-employee').val();

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
												javaScriptRelease += (1800000 * 2); //시간으로바꾸기

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
											//  var check = calEvent.choice1;
											console.log(jsEvent);
											//$("#choice1").val("Someoranges").attr("selected", "selected");


											//$('#choice1').val(calEvent.choice1).prop("selected", true);;
											//$('#choice2').option(calEvent.choice2).attr("selected", "selected");
											//$('#choice_employee').val(calEvent.choice_employee).attr("selected", "selected");

											$('#calendarModal').modal();

											/*alert('Event: ' + calEvent.start.format());
											alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
											alert('View: ' + view.name);*/
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
						</script>
						<div id='calendar'></div>
						<div id='calendarModal' class="modal fade pop-up-1" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel-1" aria-hidden="true">
							<div class="modal-dialog" style="width:400px;">
								<form class="" action="" method="post">

									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
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
																	<p id="reserName" for="sel1">홍성진</p>
																	<!---->
																</td>
															</tr>
														</thead>
														<tbody>

															<tr>
																<td><label for="sel1">예약일시:</label></td>
																<td colspan="6">
																	<p id="reserDate" for="sel1"></p>
																	<!--<input type="type" id="reservation-timepicker" class="timepicker form-control input-sm" name="reservation-timepicker" style="width:130px;" />-->
																	<input type="hidden" id="reservation-userName" name="reservation-userName" value="홍성진" />
																	<input type="hidden" id="reservation-id" name="reservation-id" value="10" />
																</td>
															</tr>

															<tr>
																<td><label for="sel1">시술선택:</label></td>
																<td style="width:72">
																	<select class="form-control input-sm" id="choice1" name='choice1'> <!--점주레벨이 아니면 disabled-->
				                        <option>손</option>
				                        <option>발</option>
				                        </select>
																</td>
																<td colspan="5" style="width: 172px;">
																	<select class="form-control input-sm" id="choice2" name='choice2'>  <!--점주레벨이 아니면 disabled-->
				                          <option>메뉴1</option>
				                          <option>메뉴2</option>
				                          <option>메뉴3</option>
				                          </select>
																</td>
															</tr>

															<tr>
																<td><label for="sel1">담당자:</label></td>
																<td>
																	<select class="form-control input-sm" id="choice-employee" name="choice-employee">  <!--점주레벨이 아니면 disabled-->
				                        <option value="a">원장</option>
				                        <option value="b">디자이너1</option>
				                        <option value="c">디자이너2</option>
				                        </select></td>
															</tr>
													</table>
													</tbody>
													<hr>
													<div class="col-xs-2"></div>
													<div class="col-xs-4" style="text-align:right;"><button id="result-reservaiton" type="button" class="btn btn-success" name="button">확인</button></div>
													<!--점주만 삭제-->
													<div class="col-xs-4" style="text-align:left;"><button id="remove-reservaiton" type="button" class="btn btn-danger" name="button">삭제</button></div>
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
								<p>Nail Shop Tel 02.355.2311 </p>
								<p>KakaoChat : nail0997</p>
								<p>instagram : @beautyU21</p>
							</div>
							<!--가게 Info 끝-->
							<div class="col-lg-7 col-md-7 col-sm-7 col-xs-10">
								<form class="" action="/insertQnA.html" method="post">
									<div class="form-group">
										<label> 문의사항 :  <input type="text" class="form-control" placeholder="제목 입력" autofocus size="20"></label>
										<br>
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
					<div style="position:fixed;">
						<ul>
							<li class="shop active">
								<div class="icon active">
									<img src="icons/shop.svg" alt="">
								</div>
								Shop
							</li>
							<li class="map">
								<div class="icon">
									<img src="icons/map.svg" alt="">
								</div>
								Map(지도)
							</li>
							<li class="reserve">
								<div class="icon">
									<img src="icons/calander.svg" alt="">
								</div>
								Reserve(예약)
							</li>
							<li class="qna">
								<div class="icon">
									<img src="icons/customer.svg" alt="">
								</div>
								Contact(문의)
							</li>
						</ul>
					</div>
				</div>
			</div>
			<script src="https://maps.googleapis.com/maps/api/js"></script>
			<script>
				// 구글맵 세팅
				$(function() {
					var mapCanvas = document.getElementById("map");
					var mapOptions = {
						center: new google.maps.LatLng(51.5, -0.2),
						zoom: 10
					};
					var map = new google.maps.Map(mapCanvas, mapOptions);
				})
				// 반응형 적용
				$(window).resize(function() {
					if ($(window).width() < 640) {
						$(".shop").addClass("active");
						$(".map").removeClass("active");
						$(".reserve").removeClass("active");
						$(".qna").removeClass("active");
						$("#line").addClass("one");
						$("#line").removeClass("two");
						$("#line").removeClass("three");
						$("#line").removeClass("four");
					}
				});
				// 메뉴 이동
				$(".shop").click(function() {
					$(".shop").addClass("active");
					$(".map").removeClass("active");
					$(".reserve").removeClass("active");
					$(".qna").removeClass("active");
					$("#line").addClass("one");
					$("#line").removeClass("two");
					$("#line").removeClass("three");
					$("#line").removeClass("four");
				})
				$(".map").click(function() {
					$(".map").addClass("active");
					$(".shop").removeClass("active");
					$(".reserve").removeClass("active");
					$(".qna").removeClass("active");
					$("#line").addClass("two");
					$("#line").removeClass("one");
					$("#line").removeClass("three");
					$("#line").removeClass("four");
				})

				$(".reserve").click(function() {
					$(".reserve").addClass("active");
					$(".map").removeClass("active");
					$(".shop").removeClass("active");
					$(".qna").removeClass("active");
					$("#line").addClass("three");
					$("#line").removeClass("two");
					$("#line").removeClass("one");
					$("#line").removeClass("four");
				})

				$(".qna").click(function() {
					$(".qna").addClass("active");
					$(".map").removeClass("active");
					$(".reserve").removeClass("active");
					$(".shop").removeClass("active");
					$("#line").addClass("four");
					$("#line").removeClass("two");
					$("#line").removeClass("three");
					$("#line").removeClass("one");
				})

				$(".shop").click(function() {
					$("#first").addClass("active");
					$("#second").removeClass("active");
					$("#third").removeClass("active");
					$("#fourth").removeClass("active");
				})

				$(".map").click(function() {
					$("#first").removeClass("active");
					$("#second").addClass("active");
					$("#third").removeClass("active");
					$("#fourth").removeClass("active");
				})

				$(".reserve").click(function() {
					$("#first").removeClass("active");
					$("#second").removeClass("active");
					$("#third").addClass("active");
					$("#fourth").removeClass("active");
				})

				$(".qna").click(function() {
					$("#first").removeClass("active");
					$("#second").removeClass("active");
					$("#third").removeClass("active");
					$("#fourth").addClass("active");
				})
				//메뉴이동 끝

				//북마크 기능
				$("#b_icon").click(function() {
					if ($('#b_icon').val().trim() == 'false') {
						$('#b_icon').addClass("active");
						$('#b_icon').val().trim() == 'true';
					} else {
						$('#b_icon').removeClass("active");
						$('#b_icon').val().trim() == 'false';
					}
				})
			</script>

			<script type="text/javascript">
				//작은케러셀
				// Instantiate the Bootstrap carousel
				$('.multi-item-carousel').carousel({
					interval: false
				});

				// for every slide in carousel, copy the next slide's item in the slide.
				// Do the same for the next, next item.
				$('.multi-item-carousel .item').each(function() {
					var next = $(this).next();
					if (!next.length) {
						next = $(this).siblings(':first');
					}
					next.children(':first-child').clone().appendTo($(this));

					if (next.next().length > 0) {
						next.next().children(':first-child').clone().appendTo($(this));
					} else {
						$(this).siblings(':first').children(':first-child').clone().appendTo($(this));
					}
				});
			</script>

		</div>
		<!-- 푸터부분 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>	