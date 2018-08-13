<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Home Spring" name="pageTitle" />
</jsp:include>

<c:set var='path' value="${pageContext.request.contextPath}" />
<link href="${path }/resources/css/carousel.css" rel="stylesheet">
<link href="${path }/resources/css/smallcarousel.css" rel="stylesheet">
<link href="${path }/resources/css/naillist.css" rel="stylesheet">

<div class="container-fluid">
	<div class="row">
		<div class="col-xs-12">
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
				</ol>
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<img src="${path }/resources/images\slide-4-1-1920x780.jpg"
							alt="Image">
						<div class="carousel-caption">
							<h3>Sell $</h3>
							<p>Money Money.</p>
						</div>
					</div>
					<div class="item">
						<img src="${path }/resources/images\slide-4-1-1920x780.jpg"
							alt="Image">
						<div class="carousel-caption">
							<h3>More Sell $</h3>
							<p>Lorem ipsum...</p>
						</div>
					</div>
				</div>
				<script type="text/javascript">
					$(document).ready(function() {
						$('.myCarousel').carousel({
							interval : 1000
						});
					});
				</script>
			</div>
			<br>
			<!--작은 케러셀-->
			<div class="row">
				<div class="col-md-12">
					<span><strong style="font-size: 20pt; color: rgb(71, 51, 51)"><i class="fa fa-angellist"></i>이달의 추천 네일</strong></span>
					<hr id="custom-hr">
				</div>
				<div class="col-xs-12" style="">
					<div class="controls pull-left">
						<a class="left fa fa-chevron-left btn  btn-outline-light text-dark" href="#carousel-example-generic" data-slide="prev"></a>
					</div>
					<div class="controls pull-right">
						<a class="right fa fa-chevron-right btn  btn-outline-light text-dark" href="#carousel-example-generic" data-slide="next"></a>
					</div>
				</div>
			</div>
			<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
				<div class="carousel-inner">
					<div class="item active">
						<div class="row">
							<c:forEach begin="0" end="2" items="${storelist}" var="store" varStatus="status">
								<div class="col-sm-4">
									<div class="col-item">
										<div class="photo store_img" style="cursor: pointer;">
											<input id="store_pk" type="hidden" value="${store.store_pk}">
											<img src="${path }/resources/images/nail_store/${store.store_re_img}" class="img-responsive" alt="a" />
										</div>
										<div class="info">
											<div class="row">
												<div class="price col-sm-6">
													<h5 style="margin-bottom: 7px;">
														1위 :
														<c:out value="${store.store_name}" />
														샵
													</h5>
													<h6 class="">
														<c:out value="주소 : ${store.store_address}" />
													</h6>
												</div>
												<div class="rating col-sm-6">
													<c:forEach begin="1" end="${store.store_rank}">
														<i class="price-text-color fa fa-star"></i>
													</c:forEach>
													<c:forEach begin="1" end="${5-store.store_rank}">
														<i class=" fa fa-star"></i>
													</c:forEach>
												</div>
											</div>
											<div class="separator clear-left">
												<p class="btn-add" style="">
													<button class="btn btn-warning store_reservaiton" style="width: 90%; z-index: 10;">
														<span class="glyphicon glyphicon-time"></span>예약하기
													</button>
												</p>
												<p class="btn-details">
													<button class="btn btn-info store_review" style="width: 90%;">
														<span class="glyphicon glyphicon-comment"></span>리뷰&nbsp;&nbsp;
														<c:out value="${store.store_review_count}" />
														개
													</button>
												</p>
											</div>
											<div class="clearfix"></div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="item">
						<div class="row">
							<c:forEach begin="3" end="5" items="${storelist}" var="store" varStatus="status">
								<div class="col-sm-4">
									<div class="col-item">
										<div class="photo store_img" style="cursor: pointer;" value="${store.store_pk}">
											<input id="store_pk" type="hidden" value="${store.store_pk}">
											<img src="${path }/resources/images/nail_store/${store.store_re_img}" class="img-responsive" alt="a" />
										</div>
										<div class="info">
											<div class="row">
												<div class="price col-sm-6">
													<h5 style="margin-bottom: 7px;">
														1위 :
														<c:out value="${store.store_name}" />
														샵
													</h5>
													<h6 class="">
														<c:out value="주소 : ${store.store_address}" />
													</h6>
												</div>
												<div class="rating col-sm-6">
													<c:forEach begin="1" end="${store.store_rank}">
														<i class="price-text-color fa fa-star"></i>
													</c:forEach>
													<c:forEach begin="1" end="${5-store.store_rank}">
														<i class=" fa fa-star"></i>
													</c:forEach>
												</div>
											</div>
											<div class="separator clear-left">
												<p class="btn-add" style="">
													<button class="btn btn-warning store_reservaiton" style="width: 90%; z-index: 10;">
														<span class="glyphicon glyphicon-time"></span>예약하기
													</button>
												</p>
												<p class="btn-details">
													<button class="btn btn-info store_review" style="width: 90%;">
														<span class="glyphicon glyphicon-comment"></span>리뷰&nbsp;&nbsp;
														<c:out value="${store.store_review_count}" />
														개
													</button>
												</p>
											</div>
											<div class="clearfix"></div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
			<br>
			<div id="select-nail-bar" class="w3-bar" style="text-align: center;">
				<div id="first-dropdown" class="w3-dropdown-hover">
					<button class="w3-button">Dropdown</button>
					<div class="w3-dropdown-content w3-card-4">
						<a href="#" class="w3-bar-item w3-button">Link 1</a>
						<a href="#" class="w3-bar-item w3-button">Link 2</a>
						<a href="#" class="w3-bar-item w3-button">Link 3</a>
						<a href="#" class="w3-bar-item w3-button">Link 3</a>
						<a href="#" class="w3-bar-item w3-button">Link 3</a>
					</div>
				</div>
				<!--nail 선택-->
				<div class="w3-dropdown-hover">
					<div id="main-nail-color" class="w3-border w3-hover-border-pale-red  w3-round" style="padding-left: 10px;" value="전체">
						<img src="${path }/resources/images/nails/all-color.jpg" class="w3-circle" alt="Cinque Terre" width="20" height="20">
						<button class="select-menu w3-button w3-round w3-hover-white">전체</button>
					</div>
					<div class="w3-dropdown-content w3-card-12 w3-border w3-round" style="z-index: 999">
						<ul id="dropdown-menu">
							<li class="nail-color" value="레드"><a>
									<div style="text-align: center">
										<img src="https://www.colorcombos.com/images/colors/FF0000.png"
											class="w3-circle" alt="Cinque Terre" width="30" height="30">
									</div>레드
							</a></li>
							<li class="nail-color" value="핑크"><a>
									<div style="text-align: center">
										<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOAAAADhCAMAAADmr0l2AAAAA1BMVEX/tN+PJ63OAAAASElEQVR4nO3BMQEAAADCoPVPbQdvoAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABOA8XBAAGwGMP0AAAAAElFTkSuQmCC"
											class="w3-circle" alt="Cinque Terre" width="30" height="30">
									</div>핑크
							</a></li>
							<li class="nail-color" value="오렌지"><a>
									<div style="text-align: center">
										<img src="https://vignette.wikia.nocookie.net/symbolism/images/4/43/Orange.png/revision/latest?cb=20140818120046"
											class="w3-circle" alt="Cinque Terre" width="30" height="30">
									</div>오렌지
							</a></li>
							<li class="nail-color" value="옐로우"><a>
									<div style="text-align: center">
										<img src="http://bdfjade.com/data/out/119/6226995-yellow-images.gif"
											class="w3-circle" alt="Cinque Terre" width="30" height="30">
									</div>옐로우
							</a></li>
							<li class="nail-color" value="그린"><a>
									<div style="text-align: center">
										<img src="https://i.ytimg.com/vi/pNWz84Sn1oo/maxresdefault.jpg"
											class="w3-circle" alt="Cinque Terre" width="30" height="30">
									</div>그린
							</a></li>
							<li class="nail-color" value="민트"><a>
									<div style="text-align: center">
										<img src="https://wallpapertag.com/wallpaper/middle/7/5/8/143301-full-size-mint-green-background-1920x1419-for-iphone-6.jpg"
											class="w3-circle" alt="Cinque Terre" width="30" height="30">
									</div>민트
							</a></li>
							<li class="nail-color" value="블루"><a>
									<div style="text-align: center">
										<img src="" class="w3-circle" alt="Cinque Terre" width="30" height="30">
									</div> 블루
							</a></li>
							<li class="nail-color" value="라벤더"><a>
									<div style="text-align: center">
										<img src="https://img.etsystatic.com/il/c7a8e4/1513338021/il_340x270.1513338021_9myj.jpg?version=0"
											class="w3-circle" alt="Cinque Terre" width="30" height="30">
									</div>라벤더
							</a></li>
							<li class="nail-color" value="화이트"><a>
									<div style="text-align: center;">
										<img src="http://www.ignytebrands.com/wp-content/uploads/white.png"
											style="border: 1px solid black;" class="w3-circle"
											alt="Cinque Terre" width="30" height="30">
									</div>화이트
							</a></li>
							<li class="nail-color" value="그레이"><a>
									<div style="text-align: center">
										<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAASwAAACoCAMAAABt9SM9AAAAA1BMVEWAgICQdD0xAAAAR0lEQVR4nO3BAQEAAACCIP+vbkhAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAO8GxYgAAb0jQ/cAAAAASUVORK5CYII="
											class="w3-circle" alt="Cinque Terre" width="30" height="30">
									</div>그레이
							</a></li>
							<li class="nail-color" value="블랙"><a>
									<div style="text-align: center">
										<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Solid_black.svg/2000px-Solid_black.svg.png"
											class="w3-circle" alt="Cinque Terre" width="30" height="30">
									</div>블랙
							</a></li>
							<li class="nail-color" value="베이지"><a>
									<div style="text-align: center">
										<img src="https://thumbs.dreamstime.com/b/natural-light-beige-recycled-paper-texture-seamless-square-back-natural-light-beige-recycled-paper-texture-seamless-square-104529523.jpg"
											class="w3-circle" alt="Cinque Terre" width="30" height="30">
									</div>베이지
							</a></li>
							<li class="nail-color" value="믹스"><a>
									<div style="text-align: center">
										<img src="https://i.ytimg.com/vi/U5ILpOCoStI/maxresdefault.jpg"
											class="w3-circle" alt="Cinque Terre" width="30" height="30">
									</div>믹스
							</a></li>
							<li class="nail-color" value="골드"><a>
									<div style="text-align: center">
										<img src="https://www.colorcombos.com/images/colors/D7B740.png"
											class="w3-circle" alt="Cinque Terre" width="30" height="30">
									</div>골드
							</a></li>
							<li class="nail-color" value="실버"><a>
									<div style="text-align: center">
										<img src="https://vignette.wikia.nocookie.net/p__/images/7/74/Hd7S83Q.png/revision/latest?cb=20160331044639&path-prefix=protagonist"
											class="w3-circle" alt="Cinque Terre" width="30" height="30">
									</div>실버
							</a></li>
						</ul>
					</div>
				</div>
				<div class="w3-dropdown-hover">
					<div id="main-check" class="w3-border w3-hover-border-pale-red  w3-round" style="padding-left: 10px;" value="네일/패디">
						<img src="${path }/resources/images/nails/nail-polish.png" class="w3-circle" alt="Cinque Terre" width="20" height="20">
						<button class="select-menu w3-button w3-round w3-hover-white">네일/패디</button>
					</div>
					<div class="w3-dropdown-content w3-bar-block w3-card-4 w3-border w3-round" style="z-index: 999">
						<div class="nail-check" style="text-align: left; padding-left: 10px;" value="네일">
							<img src="${path }/resources/images/nails/beauty.png" class="w3-circle" alt="Cinque Terre" width="20" height="20">
							<button class="select-menu w3-button w3-round">네일</button>
						</div>
						<div class="nail-check" style="text-align: left; padding-left: 10px;" value="페디">
							<img src="${path }/resources/images/nails/footprint.png" class="w3-circle" alt="Cinque Terre" width="20" height="20">
							<button class="select-menu w3-button w3-round">페디</button>
						</div>
					</div>
				</div>
				<div class="w3-dropdown-hover">
					<div id="main-nail-style" class="w3-border w3-hover-border-pale-red  w3-round" style="padding-left: 10px;" value="전체옵션">
						<img src="${path }/resources/images/nails/plus_btn.png" alt="Cinque Terre" width="20" height="20">
						<button class="select-menu w3-button w3-round w3-hover-white">전체옵션</button>
					</div>
					<div id="" class="w3-dropdown-content w3-card-12 w3-border w3-round" style="z-index: 999">
						<!--media로 조정해주기 default는 height 3.5%-->
						<ul id="dropdown-menu">
							<li class="nail-style" value="프렌치" style="padding-left: 10px;"><a>
									<div style="text-align: center">
										<img src="http://www.cuded.com/wp-content/uploads/2015/04/21-French-Manicure.jpg"
											class="w3-circle" alt="Cinque Terre" width="30" height="30">
									</div>프렌치
							</a></li>
							<li class="nail-style" value="아트"><a>
									<div style="text-align: center">
										<img src="https://1.bp.blogspot.com/-6rVc4GNTKVU/Vtfa_wIBA5I/AAAAAAAAWnQ/tll1NnimnII/s1600/constellation-nail-art-3.jpg"
											class="w3-circle" alt="Cinque Terre" width="30" height="30">
									</div>아트
							</a></li>
							<li class="nail-style" value="파츠"><a>
									<div style="text-align: center">
										<img src="https://s-media-cache-ak0.pinimg.com/originals/cf/28/fa/cf28fa8f1d236e4479e2eb3e3e3165fd.png"
											class="w3-circle" alt="Cinque Terre" width="30" height="30">
									</div>파츠
							</a></li>
							<li class="nail-style" value="글리터"><a>
									<div style="text-align: center">
										<img src="https://i.ytimg.com/vi/IHjdyDyd7hk/hqdefault.jpg"
											class="w3-circle" alt="Cinque Terre" width="30" height="30">
									</div>글리터
							</a></li>
							<li class="nail-style" value="그라데이션"><a>
									<div style="text-align: center">
										<img
											src="https://assets.teenvogue.com/photos/55829f6ca28d9d4e0540e581/master/pass/beauty-nails-2012-04-05-gradient-nail-tutorial.jpg"
											class="w3-circle" alt="Cinque Terre" width="30" height="30">
									</div> 그라데이션
							</a></li>
							<li class="nail-style" value="풀컬러"><a>
									<div style="text-align: center">
										<img
											src="http://katheryne.info/images5/0917L/full-color-acrylic-nail-designs/full-color-acrylic-nail-designs-44_13.jpg"
											class="w3-circle" alt="Cinque Terre" width="30" height="30">
									</div> 풀컬러
							</a></li>
							<li class="nail-style" value="캐릭터"><a>
									<div style="text-align: center">
										<img
											src="http://bebelushbeauty.com/uploads/best-marvel-nail-art-request-pict-for-cute-character-inspiration-and-names-trends_FILES_28561.jpg"
											class="w3-circle" alt="Cinque Terre" width="30" height="30">
									</div> 캐릭터
							</a></li>
						</ul>
					</div>
				</div>
				<button id="reset-all" class="w3-bar-item w3-button w3-border w3-hover-border-pale-red  w3-round w3-large" style="height: 40px;">
					<i class="fa fa-refresh"></i>
				</button>
			</div>
			<script type="text/javascript">
				$(function() {
					var main_nail_color_img = $("#main-nail-color").find("img");
					var main_nail_color_button = $("#main-nail-color").find("button");
					var main_nail_style_img = $("#main-nail-style").find("img");
					var main_nail_style_button = $("#main-nail-style").find("button");
					var main_nail_check_img = $("#main-check").find("img");
					var main_nail_check_button = $("#main-check").find("button");
					var selectbar = $("#select-nail-bar");
					var selectAry = {
						nail_color : null,
						nail_style : null,
						nail_check : null
					}
					$(".nail-color").on("click", function(event) {
						var color = $(this).find("img").attr('src');
						var value = $(this).attr('value');
						selectAry.nail_color = value;
						main_nail_color_img.attr('src', color);
						main_nail_color_button.html(value);
						$.ajax({
							url : "${path}/nail/selectNailColor.do",
							data : {
								nail_color : selectAry.nail_color,
								nail_style : selectAry.nail_style,
								nail_check : selectAry.nail_check
							},
							type : "post",
							dataType : "json",
							success : function(data) {
								$("#nail-list *").remove();
								var html1 = "<div id='nail-list'><div>";
								var html2 = "";
								for (var i = 0; i < data.list.length; i++) {
									html2 += "<div class='cover-card col-sm-"+data.col_i[i]+"'>";
									html2 += "<img src='${path }/resources/icons/love_blank.svg' alt='false' class='b_icon zindex'id='b_icon'>"
									html2 += "<input class='nail_pk' name='nail_pk' type='hidden' value='"+data.list[i].NAIL_PK+"'>";
									html2 += "<input class='store_pk' name='store_pk' type='hidden' value='"+data.list[i].STORE_PK+"'>";
									html2 += "<input class='member_pk' name='member_pk' type='hidden' value='${memberLoggedIn.memberPk}' >";
									html2 += "<input class='bookmark_pk' name='bookmark_pk' type='hidden' value='1' >";
									//구현되면 나머지도 member_pk,bookmark_pk 추가
									html2 += "<div class='hovereffect'>";
									html2 += "<img id='nail-img1' class='img-responsive nail-main-images' src='${path }/resources/images/nails/"+data.list[i].NAIL_RE_IMG+"'>";
									html2 += "<div class='overlay'>";
									html2 += "<p>";
									html2 += "<h2>" + data.list[i].NAIL_NAME + "</h2>";
									html2 += "<a href='#'>" + data.list[i].NAIL_STYLE + "</a><br><br><br><br>";
									html2 += "<a href='${path}/store/store.do?store_pk=" + data.list[i].STORE_PK + "'>점포로 이동</a>";
									html2 += "</p>";
									html2 += "</div></div></div>";
								}
								console.log(html2);
								selectbar.after(html1);
								$("#nail-list").html(html2);
								eventBind()
							},
							error : function(jpxhr, textStatus, errormsg) {
								console.log("ajax전송실패");
								console.log(jpxhr);
								console.log(textStatus);
								console.log(errormsg);
							}
						})
					});
					$(".nail-check").on("click", function(event) {
						var check = $(this).find("img").attr('src');
						var value = $(this).attr('value');
						selectAry.nail_check = value;
						main_nail_check_img.attr('src', check);
						main_nail_check_button.html(value);
						$.ajax({
							url : "${path}/nail/selectNailColor.do",
							data : {
								nail_color : selectAry.nail_color,
								nail_style : selectAry.nail_style,
								nail_check : selectAry.nail_check
							},
							type : "post",
							dataType : "json",
							success : function(data) {
								$("#nail-list *").remove();
								var html1 = "<div id='nail-list'><div>";
								var html2 = "";
								for (var i = 0; i < data.list.length; i++) {
									html2 += "<div class='cover-card col-sm-"+data.col_i[i]+"'>";
									html2 += "<img src='${path }/resources/icons/love_blank.svg' alt='false' class='b_icon zindex'id='b_icon'>"
									html2 += "<input class='nail_pk' name='nail_pk' type='hidden' value='"+data.list[i].NAIL_PK+"'>";
									html2 += "<input class='store_pk' name='store_pk' type='hidden' value='"+data.list[i].STORE_PK+"'>";
									html2 += "<input class='member_pk' name='member_pk' type='hidden' value='${memberLoggedIn.memberPk}' >";
									html2 += "<input class='bookmark_pk' name='bookmark_pk' type='hidden' value='1' >";
									//구현되면 나머지도 member_pk,bookmark_pk 추가
									html2 += "<div class='hovereffect'>";
									html2 += "<img id='nail-img1' class='img-responsive nail-main-images' src='${path }/resources/images/nails/"+data.list[i].NAIL_RE_IMG+"'>";
									html2 += "<div class='overlay'>";
									html2 += "<p>";
									html2 += "<h2>" + data.list[i].NAIL_NAME + "</h2>";
									html2 += "<a href='#'>" + data.list[i].NAIL_STYLE + "</a><br><br><br><br>";
									html2 += "<a href='${path}/store/store.do?store_pk=" + data.list[i].STORE_PK + "'>점포로 이동</a>";
									html2 += "</p>";
									html2 += "</div></div></div>";
								}
								selectbar.after(html1);
								$("#nail-list").html(html2);
								eventBind()
							},
							error : function(jpxhr, textStatus, errormsg) {
								console.log("ajax전송실패");
								console.log(jpxhr);
								console.log(textStatus);
								console.log(errormsg);
							}
						})
					});
					$(".nail-style").on("click", function(event) {
						var style = $(this).find("img").attr('src');
						var value = $(this).attr('value');
						selectAry.nail_style = value;
						main_nail_style_img.addClass("w3-circle");
						main_nail_style_img.attr('src', style);
						main_nail_style_button.html(value);
						$.ajax({
							url : "${path}/nail/selectNailColor.do",
							data : {
								nail_color : selectAry.nail_color,
								nail_style : selectAry.nail_style,
								nail_check : selectAry.nail_check
							},
							type : "post",
							dataType : "json",
							success : function(data) {
								$("#nail-list *").remove();
								var html1 = "<div id='nail-list'><div>";
								var html2 = "";
								for (var i = 0; i < data.list.length; i++) {
									html2 += "<div class='cover-card col-sm-"+data.col_i[i]+"'>";
									html2 += "<img src='${path }/resources/icons/love_blank.svg' alt='false' class='b_icon zindex'id='b_icon'>"
									html2 += "<input class='nail_pk' name='nail_pk' type='hidden' value='"+data.list[i].NAIL_PK+"'>";
									html2 += "<input class='store_pk' name='store_pk' type='hidden' value='"+data.list[i].STORE_PK+"'>";
									html2 += "<input class='member_pk' name='member_pk' type='hidden' value='${memberLoggedIn.memberPk}' >";
									html2 += "<input class='bookmark_pk' name='bookmark_pk' type='hidden' value='1' >";
									//구현되면 나머지도 member_pk,bookmark_pk 추가
									html2 += "<div class='hovereffect'>";
									html2 += "<img id='nail-img1' class='img-responsive nail-main-images' src='${path }/resources/images/nails/"+data.list[i].NAIL_RE_IMG+"'>";
									html2 += "<div class='overlay'>";
									html2 += "<p>";
									html2 += "<h2>" + data.list[i].NAIL_NAME + "</h2>";
									html2 += "<a href='#'>" + data.list[i].NAIL_STYLE + "</a><br><br><br><br>";
									html2 += "<a href='${path}/store/store.do?store_pk=" + data.list[i].STORE_PK + "'>점포로 이동</a>";
									html2 += "</p>";
									html2 += "</div></div></div>";
								}
								console.log(html2);
								selectbar.after(html1);
								$("#nail-list").html(html2);
								eventBind()
							},
							error : function(jpxhr, textStatus, errormsg) {
								console.log("ajax전송실패");
								console.log(jpxhr);
								console.log(textStatus);
								console.log(errormsg);
							}
						})
					});
					$("#reset-all").on("click", function() {
						selectAry.nail_color = null;
						selectAry.nail_check = null;
						selectAry.nail_style = null;
						main_nail_color_img.attr("src", "${path }/resources/images/nails/all-color.jpg");
						main_nail_color_button.html("전체");
						main_nail_check_img.attr("src", "${path }/resources/images/nails/nail-polish.png");
						main_nail_check_button.html("네일/페디");
						main_nail_style_img.removeClass("w3-circle");
						main_nail_style_img.attr("src", "${path }/resources/images/nails/plus_btn.png");
						main_nail_style_button.html("전체옵션");
						$.ajax({
							url : "${path}/nail/selectNailreset.do",
							data : {
								reset : "reset"
							},
							type : "post",
							dataType : "json",
							success : function(data) {
								$("#nail-list *").remove();
								var html1 = "<div id='nail-list'><div>";
								var html2 = "";
								for (var i = 0; i < data.list.length; i++) {
								html2 += "<div class='cover-card col-sm-"+data.col_i[i]+"'>";
								html2 += "<img src='${path }/resources/icons/love_blank.svg' alt='false' class='b_icon zindex'id='b_icon'>"
								html2 += "<input class='nail_pk' name='nail_pk' type='hidden' value='"+data.list[i].NAIL_PK+"'>";
								html2 += "<input class='store_pk' name='store_pk' type='hidden' value='"+data.list[i].STORE_PK+"'>";
								html2 += "<input class='member_pk' name='member_pk' type='hidden' value='${memberLoggedIn.memberPk}' >";
								html2 += "<input class='bookmark_pk' name='bookmark_pk' type='hidden' value='1' >";
								//구현되면 나머지도 member_pk,bookmark_pk 추가
								html2 += "<div class='hovereffect'>";
								html2 += "<img id='nail-img1' class='img-responsive nail-main-images' src='${path }/resources/images/nails/"+data.list[i].NAIL_RE_IMG+"'>";
								html2 += "<div class='overlay'>";
								html2 += "<p>";
								html2 += "<h2>" + data.list[i].NAIL_NAME + "</h2>";
								html2 += "<a href='#'>" + data.list[i].NAIL_STYLE + "</a><br><br><br><br>";
								html2 += "<a href='${path}/store/store.do?store_pk=" + data.list[i].STORE_PK + "'>점포로 이동</a>";
								html2 += "</p>";
								html2 += "</div></div></div>";
								}
								console.log(html2);
								selectbar.after(html1);
								$("#nail-list").html(html2);
								eventBind();
							},
							error : function(jpxhr, textStatus, errormsg) {
								console.log("ajax전송실패");
								console.log(jpxhr);
								console.log(textStatus);
								console.log(errormsg);
							}
						})
					})
					$('.good-btn').on("click", function() {
						$(this).toggleClass("selected");
					})
					$(".store_img").click(function() {
						location.href = "${path}/store/store.do?store_pk=" + $(this).children("#store_pk").val();
					});
					$(".store_reservaiton").click(function() {
						alert("예약");
						//  location.href="${path}/store/store.do"; //예약하기 바로갈수있는 로직으로..
					})
					$(".store_review").click(function() {
						alert("리뷰");
						//  location.href="${path}/store/store.do"; //예약하기 바로갈수있는 로직으로..
					})
					eventBind();
				})
				function eventBind() {
					$(".b_icon").click(function() {
						var memberLoggedIn = "${memberLoggedIn}";
						if (memberLoggedIn.length != 0) 
						{
							var temp = $(this);
							var bookmark_val = 
							{
									nail_pk : temp.nextAll("[name='nail_pk']").val(),
									member_pk : temp.nextAll("[name='member_pk']").val(),
									store_pk : temp.nextAll("[name='store_pk']").val(),
									bookmark_check : null
							}
							if (temp.attr("alt") == 'false') 
							{
								bookmark_val.bookmark_check = "ture";
								var jsonData = JSON.stringify(bookmark_val);
								jQuery.ajaxSettings.traditional = true;
								//*json 객체로 바로넘기기					    							    		
								$.ajax({
									url : "${path}/bookmark/insertBookmark.do",
									data : {
										"bookmark_val" : jsonData
									},
									type : "post",
									dataType : "json",
									success : function(data) {
										alert(data);
										temp.attr("alt", "true");
										temp.attr("src", "/spring/resources/icons/love_filled.svg");
									},
									error : function(jpxhr, textStatus, errormsg) {
										console.log("ajax전송실패");
										console.log(jpxhr);
										console.log(textStatus);
										console.log(errormsg);
									}
								})
							}
							else
							{
								var bookmark_pk = temp.nextAll("[name='bookmark_pk']").val();
								var member_pk = temp.nextAll("[name='member_pk']").val()
								$.ajax({
									url : "${path}/bookmark/deleteBookmark.do",
									data : {
										"bookmark_pk" : temp.nextAll("[name='bookmark_pk']").val(),
										"member_pk" : temp.nextAll("[name='member_pk']").val()
									},
									type : "post",
									dataType : "json",
									success : function(data) {
										alert(data);
										temp.attr("alt", "false");
										temp.attr("src", "/spring/resources/icons/love_blank.svg");
									},
									error : function(jpxhr, textStatus, errormsg) {
										console.log("ajax전송실패");
										console.log(jpxhr);
										console.log(textStatus);
										console.log(errormsg);
									}
								})
							}
						}
						else
						{
							alert("로그인해주세요");
						}
					});
				})
			</script>
			<div id="nail-list">
				<c:forEach items="${nailist}" var="nail" varStatus="status">
					<div class="cover-card col-sm-${col_i[status.index]}">
						<img src="${path }/resources/icons/love_blank.svg" alt="false" class="b_icon zindex" id="b_icon">
						<input class="nail_pk" name="nail_pk" type="hidden" value="${nail.nail_pk}">
						<input class="store_pk" name="store_pk" type="hidden" value="${nail.store_pk}">
						<input class="member_pk" name="member_pk" type="hidden" value="${memberLoggedIn.member_pk}">
						<input class="bookmark_pk" name="bookmark_pk" type="hidden" value="1">
						<div class="hovereffect">
							<img id='nail-img1' class="img-responsive nail-main-images" src="${path }/resources/images/nails/${nail.nail_re_img}">
							<div class="overlay">
								<p>
								<h2>${nail.nail_name}</h2>
								<a href="#">${nail.nail_style}</a><br> <br> <br>
								<br>
								<a href="${path}/store/store.do?store_pk=${nail.nail_pk}">점포로 이동</a>
								</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />