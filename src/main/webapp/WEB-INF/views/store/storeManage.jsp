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
<link href="${path }/resources/css/storeManage.css?ver=3"
	rel="stylesheet" />
<script type="text/javascript">
// 외부 js 에서 쓰이는 변수 setting
var path = "${pageContext.request.contextPath }";
var store_pk="${store.store_pk}"
</script>
<!-- storeManage js -->
<script src="${path }/resources/js/storeManage.js?ver=2"></script>
<div>
	<div id="wrapper">

		<div id="left-side">

			<div id="first active">

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
								
									<!-- 수정,삭제 시작 -->
									
									<c:forEach var="nail" items="${nails }" varStatus="status">
									<div class="col-lg-4 col-md-4 col-sm-4 col-xs-10 animatepop">
										<div class="wh100">
											<div class="input-group image-preview zindex bottom">
												<a href="#NailModal${nail.nail_pk }" data-toggle="modal"> 
												<button type="button" class="btn btn-default">
													<span class="glyphicon glyphicon-pencil"></span> 수정
												</button></a>
												<button type="button" class="btn btn-default" id="nailDelete" value="${nail.nail_pk }">
													<span class="glyphicon glyphicon-remove"></span> 삭제
												</button>
											</div>
										
											<img class="img-responsive radius14"
												src="${path }/resources/images/nails/${nail.nail_re_img}" alt="">
										</div>
									</div>
									<!-- 기존의 시술정보 클릭하여 수정가능 -->
							
							
									<!-- 모달 이미지 Nailmodal -->
									
									<div class="modal fade" id="NailModal">
										<div class="modal-dialog modal-lg">
											<div class="modal-content">

												<!-- Modal Header -->
												<div class="modal-header">
													<h4 class="modal-title">시술정보 추가</h4>
													<button type="button" class="close" data-dismiss="modal">&times;</button>
												</div>

												<!-- Modal body -->
												<div class="modal-body">
													<form name="nailInsert" method="post"
														action="${path }/store/storeManage/nailCRUD.do"
														enctype="multipart/form-data">
														<div class="animatepop">
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
																		<span class="glyphicon glyphicon-folder-open"></span>
																		<span class="image-preview-input-title">Browse</span>
																		<input type="file"
																			accept="image/png, image/jpeg, image/gif"
																			name="input-file-preview" />
																		<!-- rename it -->
																		<input type="hidden" name="store_pk"
																			value="${store.store_pk }"> <input
																			type="hidden" id="nail_color" name="nail_color"
																			value=""> <input type="hidden"
																			id="nail_style" name="nail_style" value=""> <input
																			type="hidden" id="nail_check" name="nail_check"
																			value="">
																	</div>
																</span>

															</div>
															<!-- /input-group image-preview [TO HERE]-->

															<img class="img-responsive radius14"
																src="http://placehold.it/350x250" alt="">

														</div>
														<label>시술이름 입력 <input type="text" name="nail_name"
															value=""></label> <label>시술정보 입력 <input
															type="text" name="nail_info" value=""></label>
														<button type="submit" class="btn btn-primary">시술정보 등록</button>
													</form>
													<div id="select-nail-bar" class="w3-bar"
														style="text-align: center;">

														<!-- 지우면 꺠짐 hiddien으로 해놨음 -->
														<div id="first-dropdown" class="w3-dropdown-hover"
															style="display: none">
															<button class="w3-button">Dropdown</button>
															<div class="w3-dropdown-content w3-card-4">
																<a href="#" class="w3-bar-item w3-button">Link 1</a> <a
																	href="#" class="w3-bar-item w3-button">Link 2</a> <a
																	href="#" class="w3-bar-item w3-button">Link 3</a> <a
																	href="#" class="w3-bar-item w3-button">Link 3</a> <a
																	href="#" class="w3-bar-item w3-button">Link 3</a>
															</div>
														</div>

														<!--nail 선택-->
														<div class="w3-dropdown-hover">
															<div id="main-nail-color"
																class="w3-border w3-hover-border-pale-red  w3-round"
																style="padding-left: 10px;" value="색상">
																<img src="${path }/resources/images/nails/all-color.jpg"
																	class="w3-circle" alt="Cinque Terre" width="20"
																	height="20">
																<button
																	class="select-menu w3-button w3-round w3-hover-white">색상선택</button>
															</div>
															<div
																class="w3-dropdown-content w3-card-12 w3-border w3-round"
																style="z-index: 999">
																<!--media로 조정해주기 default는 height 3.5%-->
																 <ul id="dropdown-menu">
                     <li class="nail-color" value="레드"><a>
                           <div style="text-align: center">
                              <img src="${path }/resources/images/indexImg/red.jpg" class="w3-circle" alt="Cinque Terre" width="30" height="30">
                           </div>레드
                     </a></li>
                     <li class="nail-color" value="핑크"><a>
                           <div style="text-align: center">
                              <img src="${path }/resources/images/indexImg/pink.png" class="w3-circle" alt="Cinque Terre" width="30" height="30">
                           </div>핑크
                     </a></li>
                     <li class="nail-color" value="오렌지"><a>
                           <div style="text-align: center">
                              <img src="${path }/resources/images/indexImg/orange.png" class="w3-circle" alt="Cinque Terre" width="30" height="30">
                           </div>오렌지
                     </a></li>
                     <li class="nail-color" value="옐로우"><a>
                           <div style="text-align: center">
                              <img src="${path }/resources/images/indexImg/yellow.jpg" class="w3-circle" alt="Cinque Terre" width="30" height="30">
                           </div>옐로우
                     </a></li>
                     <li class="nail-color" value="그린"><a>
                           <div style="text-align: center">
                              <img src="${path }/resources/images/indexImg/green.jpg" class="w3-circle" alt="Cinque Terre" width="30" height="30">
                           </div>그린
                     </a></li>
                     <li class="nail-color" value="민트"><a>
                           <div style="text-align: center">
                              <img src="${path }/resources/images/indexImg/mint.jpg" class="w3-circle" alt="Cinque Terre" width="30" height="30">
                           </div>민트
                     </a></li>
                     <li class="nail-color" value="블루"><a>
                           <div style="text-align: center">
                              <img src="${path }/resources/images/indexImg/blue.png" class="w3-circle" alt="Cinque Terre" width="30" height="30">
                           </div>블루
                     </a></li>
                     <li class="nail-color" value="라벤더"><a>
                           <div style="text-align: center">
                              <img src="${path }/resources/images/indexImg/lavender.png" class="w3-circle" alt="Cinque Terre" width="30" height="30">
                           </div>라벤더
                     </a></li>
                     <li class="nail-color" value="화이트"><a>
                           <div style="text-align: center;">
                              <img src="${path }/resources/images/indexImg/white.png" style="border: 1px solid black;" class="w3-circle" alt="Cinque Terre" width="30" height="30">
                           </div>화이트
                     </a></li>
                     <li class="nail-color" value="그레이"><a>
                           <div style="text-align: center">
                              <img src="${path }/resources/images/indexImg/gray.jpg" class="w3-circle" alt="Cinque Terre" width="30" height="30">
                           </div>그레이
                     </a></li>
                     <li class="nail-color" value="블랙"><a>
                           <div style="text-align: center">
                              <img src="${path }/resources/images/indexImg/black.jpg" class="w3-circle" alt="Cinque Terre" width="30" height="30">
                           </div>블랙
                     </a></li>
                     <li class="nail-color" value="베이지"><a>
                           <div style="text-align: center">
                              <img src="${path }/resources/images/indexImg/beige.png" class="w3-circle" alt="Cinque Terre" width="30" height="30">
                           </div>베이지
                     </a></li>
                     <li class="nail-color" value="믹스"><a>
                           <div style="text-align: center">
                              <img src="${path }/resources/images/indexImg/mix.jpg" class="w3-circle" alt="Cinque Terre" width="30" height="30">
                           </div>믹스
                     </a></li>
                     <li class="nail-color" value="골드"><a>
                           <div style="text-align: center">
                              <img src="${path }/resources/images/indexImg/gold.png" class="w3-circle" alt="Cinque Terre" width="30" height="30">
                           </div>골드
                     </a></li>
                     <li class="nail-color" value="실버"><a>
                           <div style="text-align: center">
                              <img src="${path }/resources/images/indexImg/silver.jpg" class="w3-circle" alt="Cinque Terre" width="30" height="30">
                           </div>실버
                     </a></li>
                  </ul>
               </div>
            </div>
            <div class="w3-dropdown-hover">
               <div id="main-check" class="w3-border w3-hover-border-pale-red  w3-round" style="padding-left: 10px;" value="">
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
                     <li class="nail-style" value="프렌치" style="padding-left: 10px;">
                        <a><div style="text-align: center">
                           <img src="${path }/resources/images/indexImg/french.jpg" class="w3-circle" alt="Cinque Terre" width="30" height="30">
                        </div>프렌치</a>
                     </li>
                     <li class="nail-style" value="아트">
                        <a><div style="text-align: center">
                           <img src="${path }/resources/images/indexImg/art.jpg" class="w3-circle" alt="Cinque Terre" width="30" height="30">
                        </div>아트</a>
                     </li>
                     <li class="nail-style" value="파츠">
                        <a><div style="text-align: center">
                           <img src="${path }/resources/images/indexImg/parts.JPG" class="w3-circle" alt="Cinque Terre" width="30" height="30">
                        </div>파츠</a>
                     </li>
                     <li class="nail-style" value="글리터">
                        <a><div style="text-align: center">
                           <img src="${path }/resources/images/indexImg/gliter.jpg" class="w3-circle" alt="Cinque Terre" width="30" height="30">
                        </div>글리터</a>
                     </li>
                     <li class="nail-style" value="그라데이션">
                        <a><div style="text-align: center">
                           <img src="${path }/resources/images/indexImg/gradient.jpg" class="w3-circle" alt="Cinque Terre" width="30" height="30">
                        </div>그라데이션</a>
                     </li>
                     <li class="nail-style" value="풀컬러">
                        <a><div style="text-align: center">
                           <img src="${path }/resources/images/indexImg/fullcolor.jpg" class="w3-circle" alt="Cinque Terre" width="30" height="30">
                        </div>풀컬러</a>
                     </li>
                     <li class="nail-style" value="캐릭터">
                        <a><div style="text-align: center">
                           <img src="${path }/resources/images/indexImg/char.jpg" class="w3-circle" alt="Cinque Terre" width="30" height="30">
                        </div>캐릭터</a></li>
																</ul>
															</div>

														</div>


														<button id="reset-all"
															class="w3-bar-item w3-button w3-border w3-hover-border-pale-red  w3-round w3-large"
															style="height: 40px;">
															<i class="fa fa-refresh"></i>
														</button>
													</div>


												</div>

												<!-- Modal footer -->
												<div class="modal-footer">
													<button type="button" class="btn"
														data-dismiss="modal">닫기</button>
												</div>

											</div>
										</div>
									</div>
<!-- 									modal End -->
	 								<!-- 모달 이미지 Nailmodal 편집 -->
									<div class="modal fade" id="NailModal${nail.nail_pk }">
										<div class="modal-dialog modal-lg">
											<div class="modal-content">

												<!-- Modal Header -->
												<div class="modal-header">
													<h4 class="modal-title">시술정보 편집</h4>
													<button type="button" class="close" data-dismiss="modal">&times;</button>
												</div>

												<!-- Modal body -->
												<div class="modal-body">
													<form name="nailInsert" method="post"
														action="${path }/store/storeManage/nailCRUD.do"
														enctype="multipart/form-data">
														<div class="animatepop">
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
																		<span class="glyphicon glyphicon-folder-open"></span>
																		<span class="image-preview-input-title">Browse</span>
																		<input type="file"
																			accept="image/png, image/jpeg, image/gif"
																			name="input-file-preview" />
																		<!-- rename it -->
																		<input type="hidden" name="store_pk"
																			value="${store.store_pk }"> <input
																			type="hidden" id="nail_color" name="nail_color"
																			value=""> <input type="hidden"
																			id="nail_style" name="nail_style" value=""> <input
																			type="hidden" id="nail_check" name="nail_check"
																			value="">
																	</div>
																</span>

															</div>
															<!-- /input-group image-preview [TO HERE]-->

															<img class="img-responsive radius14"
																src="${path }/resources/images/nails/${nail.nail_re_img}" alt="">

														</div>
														<label>시술이름 입력 <input type="text" name="nail_name"
															value="${nail.nail_name }"></label> <label>시술정보 입력 <input
															type="text" name="nail_info" value="${nail.nail_info }"></label>
														<button type="submit" class="btn btn-primary">시술정보 등록</button>
													</form>
													<div id="select-nail-bar" class="w3-bar"
														style="text-align: center;">

														<!-- 지우면 꺠짐 hiddien으로 해놨음 -->
														<div id="first-dropdown" class="w3-dropdown-hover"
															style="display: none">
															<button class="w3-button">Dropdown</button>
															<div class="w3-dropdown-content w3-card-4">
																<a href="#" class="w3-bar-item w3-button">Link 1</a> <a
																	href="#" class="w3-bar-item w3-button">Link 2</a> <a
																	href="#" class="w3-bar-item w3-button">Link 3</a> <a
																	href="#" class="w3-bar-item w3-button">Link 3</a> <a
																	href="#" class="w3-bar-item w3-button">Link 3</a>
															</div>
														</div>

														<!--nail 선택-->
														<div class="w3-dropdown-hover">
															<div id="main-nail-color"
																class="w3-border w3-hover-border-pale-red  w3-round"
																style="padding-left: 10px;" value="색상">
																<img src="${path }/resources/images/nails/all-color.jpg"
																	class="w3-circle" alt="Cinque Terre" width="20"
																	height="20">
																<button
																	class="select-menu w3-button w3-round w3-hover-white">${nail.nail_color }</button>
															</div>
															<div
																class="w3-dropdown-content w3-card-12 w3-border w3-round"
																style="z-index: 999">
																<!--media로 조정해주기 default는 height 3.5%-->
																 <ul id="dropdown-menu">
                     <li class="nail-color" value="레드"><a>
                           <div style="text-align: center">
                              <img src="${path }/resources/images/indexImg/red.jpg" class="w3-circle" alt="Cinque Terre" width="30" height="30">
                           </div>레드
                     </a></li>
                     <li class="nail-color" value="핑크"><a>
                           <div style="text-align: center">
                              <img src="${path }/resources/images/indexImg/pink.png" class="w3-circle" alt="Cinque Terre" width="30" height="30">
                           </div>핑크
                     </a></li>
                     <li class="nail-color" value="오렌지"><a>
                           <div style="text-align: center">
                              <img src="${path }/resources/images/indexImg/orange.png" class="w3-circle" alt="Cinque Terre" width="30" height="30">
                           </div>오렌지
                     </a></li>
                     <li class="nail-color" value="옐로우"><a>
                           <div style="text-align: center">
                              <img src="${path }/resources/images/indexImg/yellow.jpg" class="w3-circle" alt="Cinque Terre" width="30" height="30">
                           </div>옐로우
                     </a></li>
                     <li class="nail-color" value="그린"><a>
                           <div style="text-align: center">
                              <img src="${path }/resources/images/indexImg/green.jpg" class="w3-circle" alt="Cinque Terre" width="30" height="30">
                           </div>그린
                     </a></li>
                     <li class="nail-color" value="민트"><a>
                           <div style="text-align: center">
                              <img src="${path }/resources/images/indexImg/mint.jpg" class="w3-circle" alt="Cinque Terre" width="30" height="30">
                           </div>민트
                     </a></li>
                     <li class="nail-color" value="블루"><a>
                           <div style="text-align: center">
                              <img src="${path }/resources/images/indexImg/blue.png" class="w3-circle" alt="Cinque Terre" width="30" height="30">
                           </div>블루
                     </a></li>
                     <li class="nail-color" value="라벤더"><a>
                           <div style="text-align: center">
                              <img src="${path }/resources/images/indexImg/lavender.png" class="w3-circle" alt="Cinque Terre" width="30" height="30">
                           </div>라벤더
                     </a></li>
                     <li class="nail-color" value="화이트"><a>
                           <div style="text-align: center;">
                              <img src="${path }/resources/images/indexImg/white.png" style="border: 1px solid black;" class="w3-circle" alt="Cinque Terre" width="30" height="30">
                           </div>화이트
                     </a></li>
                     <li class="nail-color" value="그레이"><a>
                           <div style="text-align: center">
                              <img src="${path }/resources/images/indexImg/gray.jpg" class="w3-circle" alt="Cinque Terre" width="30" height="30">
                           </div>그레이
                     </a></li>
                     <li class="nail-color" value="블랙"><a>
                           <div style="text-align: center">
                              <img src="${path }/resources/images/indexImg/black.jpg" class="w3-circle" alt="Cinque Terre" width="30" height="30">
                           </div>블랙
                     </a></li>
                     <li class="nail-color" value="베이지"><a>
                           <div style="text-align: center">
                              <img src="${path }/resources/images/indexImg/beige.png" class="w3-circle" alt="Cinque Terre" width="30" height="30">
                           </div>베이지
                     </a></li>
                     <li class="nail-color" value="믹스"><a>
                           <div style="text-align: center">
                              <img src="${path }/resources/images/indexImg/mix.jpg" class="w3-circle" alt="Cinque Terre" width="30" height="30">
                           </div>믹스
                     </a></li>
                     <li class="nail-color" value="골드"><a>
                           <div style="text-align: center">
                              <img src="${path }/resources/images/indexImg/gold.png" class="w3-circle" alt="Cinque Terre" width="30" height="30">
                           </div>골드
                     </a></li>
                     <li class="nail-color" value="실버"><a>
                           <div style="text-align: center">
                              <img src="${path }/resources/images/indexImg/silver.jpg" class="w3-circle" alt="Cinque Terre" width="30" height="30">
                           </div>실버
                     </a></li>
                  </ul>
               </div>
            </div>
            <div class="w3-dropdown-hover">
               <div id="main-check" class="w3-border w3-hover-border-pale-red  w3-round" style="padding-left: 10px;" value="${nail.nail_check }">
                  <img src="${path }/resources/images/nails/nail-polish.png" class="w3-circle" alt="Cinque Terre" width="20" height="20">
                  <button class="select-menu w3-button w3-round w3-hover-white">${nail.nail_check }</button>
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
                  <button class="select-menu w3-button w3-round w3-hover-white">${nail.nail_style }</button>
               </div>
               <div id="" class="w3-dropdown-content w3-card-12 w3-border w3-round" style="z-index: 999">
                  <!--media로 조정해주기 default는 height 3.5%-->
                  <ul id="dropdown-menu">
                     <li class="nail-style" value="프렌치" style="padding-left: 10px;">
                        <a><div style="text-align: center">
                           <img src="${path }/resources/images/indexImg/french.jpg" class="w3-circle" alt="Cinque Terre" width="30" height="30">
                        </div>프렌치</a>
                     </li>
                     <li class="nail-style" value="아트">
                        <a><div style="text-align: center">
                           <img src="${path }/resources/images/indexImg/art.jpg" class="w3-circle" alt="Cinque Terre" width="30" height="30">
                        </div>아트</a>
                     </li>
                     <li class="nail-style" value="파츠">
                        <a><div style="text-align: center">
                           <img src="${path }/resources/images/indexImg/parts.JPG" class="w3-circle" alt="Cinque Terre" width="30" height="30">
                        </div>파츠</a>
                     </li>
                     <li class="nail-style" value="글리터">
                        <a><div style="text-align: center">
                           <img src="${path }/resources/images/indexImg/gliter.jpg" class="w3-circle" alt="Cinque Terre" width="30" height="30">
                        </div>글리터</a>
                     </li>
                     <li class="nail-style" value="그라데이션">
                        <a><div style="text-align: center">
                           <img src="${path }/resources/images/indexImg/gradient.jpg" class="w3-circle" alt="Cinque Terre" width="30" height="30">
                        </div>그라데이션</a>
                     </li>
                     <li class="nail-style" value="풀컬러">
                        <a><div style="text-align: center">
                           <img src="${path }/resources/images/indexImg/fullcolor.jpg" class="w3-circle" alt="Cinque Terre" width="30" height="30">
                        </div>풀컬러</a>
                     </li>
                     <li class="nail-style" value="캐릭터">
                        <a><div style="text-align: center">
                           <img src="${path }/resources/images/indexImg/char.jpg" class="w3-circle" alt="Cinque Terre" width="30" height="30">
                        </div>캐릭터</a></li>
																</ul>
															</div>

														</div>


														<button id="reset-all"
															class="w3-bar-item w3-button w3-border w3-hover-border-pale-red  w3-round w3-large"
															style="height: 40px;">
															<i class="fa fa-refresh"></i>
														</button>
													</div>


												</div>

												<!-- Modal footer -->
												<div class="modal-footer">
													<button type="button" class="btn"
														data-dismiss="modal">닫기</button>
												</div>

											</div>
										</div>
									</div>
<!-- 									modal End -->


									</c:forEach>
								</div>
								<!-- tab1 끝 -->
								<div class="tab-pane active" id="tab_default_2">
									<div style="width: 80%;">
										<h3 style="margin-left: 30px;">젤네일</h3>
										<hr style="margin-left: 30px;">
										<c:forEach var="menu" items="${menus }" varStatus="status">
											<form name="menuUpdate${status.count }" method="post" action="/menuUpdate.do">
											<input type="hidden" name="menu_pk" value="${menu.menu_pk }"/>
											<label for ="menu_name">제목 입력 : 
											<input type="text" placeholder="메뉴 제목 입력" name="menu_name"  id="menu_name"
												class="form-control" value="${menu.menu_name }"/></label>
											<label for="menu_info">정보 입력: 
											<input type="text" placeholder="정보 입력" name="menu_info" id="menu_info"
												class="form-control" value="${menu.menu_info }"/></label>
											<label name="menu_price">가격 입력: 
											<input type="number" placeholder="가격 입력" name="menu_price" id="menu_price"
												class="form-control" value="${menu.menu_price }"/></label>
											<select name="menu_check">
												<option value="네일"<c:if test="${menu.menu_check eq '네일'}">selected</c:if>>네일</option>
												<option value="페디"<c:if test="${menu.menu_check eq '페디'}">selected</c:if>>페디</option>
											</select>
											<button type="button" id="menuUpdate" class="btn-success btn">
												수정</button>
											<button id="menuDelete" class="btn btn-danger" value="${menu.menu_pk }">삭제</button>
											</form>
											<hr>
										</c:forEach>
										<br> <br>
										<div class="menuInsertForm" style=""></div>
										<button onclick="menuInsertForm()" class="btn btn-primary" value="" style="float: center;">추가</button>

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

<!-- first 끝 -->
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




</div>



<!-- 푸터부분 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
