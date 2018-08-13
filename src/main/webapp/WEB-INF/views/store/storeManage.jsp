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
												<option value="손"<c:if test="${menu.menu_check eq '손'}">selected</c:if>>손</option>
												<option value="발"<c:if test="${menu.menu_check eq '발'}">selected</c:if>>발</option>
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
