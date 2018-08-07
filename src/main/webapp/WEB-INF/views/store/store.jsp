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
<!-- store js -->
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDmfjiMcgfcCVI6QKs42Kk4AvHUVdOQtso"></script>

<script type="text/javascript">
// 외부 js 에서 쓰이는 변수 setting
 var latitude = ${store.store_latitude };
 var longitude = ${store.store_longitude };
 var path = ${pageContext.request.contextPath };
</script>
<script src="${path }/resources/js/store.js?ver=2"></script>
<div>
<div id="wrapper">

	<div id="left-side">

		<div id="first" class="active">

			<div class="row">

				<!-- 가게 이미지 시작 -->
				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-10 animatepop">
					<img src="${path }/resources/icons/love_blank.svg" alt="false" class="b_icon zindex"
						id="b_icon">
					
					<div class="hovereffect">
						<img class="img-responsive radius14"
							src="${path }/resources/images/nail_store/${store.store_re_img }" alt="출력 실팽">
						<div class="overlay">
							<h2>${store. store_name }</h2>
							<p>
								<a href="#">크게 보기</a>
							</p>
						</div>
					</div>
				</div>
				<!--가게 이미지 끝-->
				<div class="col-lg-8 col-md-8 col-sm-8 col-xs-10">
					<h3>${store. store_name }</h3>
					<p>장소 : ${store. store_address }</p>
					<p>Tel. ${store. store_phone }</p>
					<p>평일 10:00 - 21:00 토요일 11:00 - 21:00 일요일 11:00 - 20:00</p>
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
									<div class="carousel-inner" >
									<c:forEach var="nail" items="${nails }" varStatus="status" step='3'>
									<c:choose>
										<c:when test="${status.count eq 1}">									
										<div class="item active" >
										</c:when>
										<c:when test="${status.index %3 eq 0 }">									
										<div class="item">
										</c:when>
									</c:choose>	
										<c:forEach var='i' begin='${status.index }' end="${status.index +2 }">
										<a href="#NailModal${nails[i].nail_pk }" data-toggle="modal">
											<div class="col-lg-4 col-md-4 col-sm-4 col-xs-10 animatepop" style="margin-top: 10px;height:250px;">
												<div class="hovereffect">
												
													<img class="img-responsive radius14 smail-carousel"
														src="${path }/resources/images/nails/${nails[i].nail_re_img}" alt="">
													<div class="overlay">
														<h2>${nails[i].nail_name}</h2>
														<p>
															<a href="#NailModal${nails[i].nail_pk }" data-toggle="modal">더보기</a>
														</p>
													</div>
													
												</div>
											</div>
											</a>																				
											</c:forEach>
											<c:choose>
										<c:when test="${status.count eq 1 }">
										</div>
										</c:when>
										<c:when test="${status.index %3 eq 0 }">
										</div>		
										</c:when>	
										</c:choose>
										<!-- item end -->						
										</c:forEach>
									</div>
									<!--  casual inner end -->
									<c:forEach var ="nail" items="${nails }">
										<!-- Modal start -->
											<div class="modal fade" id="NailModal${nail.nail_pk }">
										<div class="modal-dialog">
											<div class="modal-content">

												<!-- Modal Header -->
												<div class="modal-header">
													<h4 class="modal-title">시술정보 상세</h4>
													<button type="button" class="close" data-dismiss="modal">&times;</button>
												</div>

												<!-- Modal body -->
												<div class="modal-body">
													<div class="wh100">
															<img class="img-responsive radius14"
															src="${path }/resources/images/nails/${nail.nail_re_img}" alt="네일 사진">
													</div>
													<p>네일 색상 : ${nail.nail_color }, 타입 : ${nail.nail_check==1?'네일':'페디' }, 종류	 : ${nail.nail_style }</p>
												</div>
												<!-- Modal footer -->
												<div class="modal-footer">
												</div>

											</div>
										</div>
									</div>
									<!-- Modal End -->
									</c:forEach>
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
							<div style="width: 70%;">
										<h3 style="margin-left: 30px;">젤네일</h3>
											<hr style="margin-left: 30px;">
										<c:forEach var="menu" items="${menus }" varStatus="status">									
										<p style="width: 100%;">
											<span>${menu.menu_name }</span><span style="float: right;">${menu.menu_price }원</span>
										</p>
										<p style="margin-left: 20px; color:grey;">${menu.menu_info }</p>
										</c:forEach>
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
			<!-- row 끝 -->
		</div>


		<div id="second">

			<div class="NailStoreMap animatepop" id="map">
			</div>
			<div class="addrText animatepop">
				<p>${store.store_address }</P>
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
							placeholder="제목 입력" autofocus size="20" name ="title"></label> <br>
						<textarea name="content" cols="40" rows="6"></textarea>
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
	<div id="line" class="one"></div>
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
					<img src="${path }/resources/icons/map.svg" alt="">
				</div> Map
			</li>
			<li class="reserve">
				<div class="icon">
					<img src="${path }/resources/icons/calander.svg" alt="">
				</div> Reserve
			</li>
			<li class="qna">
				<div class="icon">
					<img src="${path }/resources/icons/customer.svg" alt="">
				</div> Contact
			</li>
		</ul>
	</div>
</div>
</div>
<!-- 푸터부분 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
