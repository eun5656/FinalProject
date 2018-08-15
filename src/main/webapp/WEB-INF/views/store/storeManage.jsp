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
<link href="${path }/resources/css/storeManage.css?ver=4"
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
													<h4 class="modal-title">시술정보 추가</h4>
													<button type="button" class="close" data-dismiss="modal">&times;</button>
												</div>

												<!-- Modal body -->
												<div class="modal-body">
													<div class="wh100 animatepop">
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
													
  <div id="select-nail-bar" class="w3-bar" style="text-align:center;">

	<!-- 지우면 꺠짐 hiddien으로 해놨음 -->
    <div id="first-dropdown" class="w3-dropdown-hover" >
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
    <div class="w3-dropdown-hover" >
      <div id="main-nail-color" class="w3-border w3-hover-border-pale-red  w3-round" style="padding-left:10px;" value="전체">
        <img src="${path }/resources/images/nails/all-color.jpg" class="w3-circle" alt="Cinque Terre" width="20" height="20"><button class="select-menu w3-button w3-round w3-hover-white">전체</button></div>
      <div  class="w3-dropdown-content w3-card-12 w3-border w3-round" style="z-index: 999">
        <!--media로 조정해주기 default는 height 3.5%-->
        <ul id="dropdown-menu">
          <li class="nail-color" value="레드" >
            <a>
              <div  style="text-align:center">
              <img src="https://www.colorcombos.com/images/colors/FF0000.png" class="w3-circle" alt="Cinque Terre" width="30" height="30" > </div>
              레드
            </a>
          </li>
          <li class="nail-color" value="핑크">
            <a>
              <div style="text-align:center">
              <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOAAAADhCAMAAADmr0l2AAAAA1BMVEX/tN+PJ63OAAAASElEQVR4nO3BMQEAAADCoPVPbQdvoAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABOA8XBAAGwGMP0AAAAAElFTkSuQmCC" class="w3-circle"
                  alt="Cinque Terre" width="30" height="30"></div>
              핑크
            </a>
          </li>
          <li class="nail-color" value="오렌지">
            <a>
              <div style="text-align:center"><img src="https://vignette.wikia.nocookie.net/symbolism/images/4/43/Orange.png/revision/latest?cb=20140818120046" class="w3-circle" alt="Cinque Terre" width="30" height="30"></div>
              오렌지
            </a>
          </li>
          <li class="nail-color" value="옐로우">
            <a>
              <div style="text-align:center"><img src="http://bdfjade.com/data/out/119/6226995-yellow-images.gif" class="w3-circle" alt="Cinque Terre" width="30" height="30"></div>
              옐로우
            </a>
          </li>
          <li class="nail-color" value="그린">
            <a>
              <div style="text-align:center"><img src="https://i.ytimg.com/vi/pNWz84Sn1oo/maxresdefault.jpg" class="w3-circle" alt="Cinque Terre" width="30" height="30"></div>
              그린
            </a>
          </li>
          <li class="nail-color" value="민트">
            <a>
              <div style="text-align:center"><img src="https://wallpapertag.com/wallpaper/middle/7/5/8/143301-full-size-mint-green-background-1920x1419-for-iphone-6.jpg" class="w3-circle" alt="Cinque Terre" width="30" height="30"></div>
              민트
            </a>
          </li>
          <li class="nail-color" value="블루">
            <a>
              <div style="text-align:center"><img src="	" class="w3-circle" alt="Cinque Terre" width="30" height="30"></div>
              블루
            </a>
          </li>
          <li class="nail-color" value="라벤더">
            <a>
              <div style="text-align:center"><img src="https://img.etsystatic.com/il/c7a8e4/1513338021/il_340x270.1513338021_9myj.jpg?version=0" class="w3-circle" alt="Cinque Terre" width="30" height="30"></div>
              라벤더
            </a>
          </li>
          <li class="nail-color" value="화이트">
            <a>
              <div style="text-align:center; "><img src="http://www.ignytebrands.com/wp-content/uploads/white.png" style="border:1px solid black;" class="w3-circle" alt="Cinque Terre" width="30" height="30"></div>
              화이트
            </a>
          </li>
          <li class="nail-color" value="그레이">
            <a>
              <div style="text-align:center"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAASwAAACoCAMAAABt9SM9AAAAA1BMVEWAgICQdD0xAAAAR0lEQVR4nO3BAQEAAACCIP+vbkhAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAO8GxYgAAb0jQ/cAAAAASUVORK5CYII=" class="w3-circle"
                  alt="Cinque Terre" width="30" height="30"></div>
              그레이
            </a>
          </li>
          <li class="nail-color" value="블랙">
            <a>
              <div style="text-align:center"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Solid_black.svg/2000px-Solid_black.svg.png" class="w3-circle" alt="Cinque Terre" width="30" height="30"></div>
              블랙
            </a>
          </li>
          <li class="nail-color" value="베이지">
            <a>
              <div style="text-align:center"><img src="https://thumbs.dreamstime.com/b/natural-light-beige-recycled-paper-texture-seamless-square-back-natural-light-beige-recycled-paper-texture-seamless-square-104529523.jpg" class="w3-circle" alt="Cinque Terre" width="30" height="30"></div>
              베이지
            </a>
          </li>
          <li class="nail-color" value="믹스">
            <a>
              <div style="text-align:center"><img src="https://i.ytimg.com/vi/U5ILpOCoStI/maxresdefault.jpg" class="w3-circle" alt="Cinque Terre" width="30" height="30"></div>
              믹스
            </a>
          </li>
          <li class="nail-color" value="골드">
            <a>
              <div style="text-align:center"><img src="https://www.colorcombos.com/images/colors/D7B740.png" class="w3-circle" alt="Cinque Terre" width="30" height="30"></div>
              골드
            </a>
          </li>
          <li class="nail-color" value="실버">
            <a>
              <div style="text-align:center"><img src="https://vignette.wikia.nocookie.net/p__/images/7/74/Hd7S83Q.png/revision/latest?cb=20160331044639&path-prefix=protagonist" class="w3-circle" alt="Cinque Terre" width="30" height="30"></div>
              실버
            </a>
          </li>
        </ul>
      </div>
    </div>
    
    <div class="w3-dropdown-hover">
      <div id="main-check" class="w3-border w3-hover-border-pale-red  w3-round" style="padding-left:10px;" value="네일/패디">
        <img src="${path }/resources/images/nails/nail-polish.png" class="w3-circle" alt="Cinque Terre" width="20" height="20"><button class="select-menu w3-button w3-round w3-hover-white">네일/패디</button></div>
     
      <div class="w3-dropdown-content w3-bar-block w3-card-4 w3-border w3-round" style="z-index: 999">
       
          <div class="nail-check " style="text-align:left; padding-left: 10px;" value="네일"><img src="${path }/resources/images/nails/beauty.png" class="w3-circle" alt="Cinque Terre" width="20" height="20"><button class="select-menu w3-button w3-round">네일</button></div>
        
          <div  class="nail-check" style="text-align:left; padding-left: 10px;" value="페디"><img src="${path }/resources/images/nails/footprint.png" class="w3-circle" alt="Cinque Terre" width="20" height="20"><button class="select-menu w3-button w3-round">페디</button></div>
      </div>
	</div>	


    <div class="w3-dropdown-hover">
      <div id="main-nail-style" class="w3-border w3-hover-border-pale-red  w3-round" style="padding-left:10px;" value="전체옵션">
      <img src="${path }/resources/images/nails/plus_btn.png" alt="Cinque Terre" width="20" height="20"><button class="select-menu w3-button w3-round w3-hover-white">전체옵션</button></div>
      <div id="" class="w3-dropdown-content w3-card-12 w3-border w3-round" style="z-index: 999">

        <!--media로 조정해주기 default는 height 3.5%-->
        <ul id="dropdown-menu">
          <li class="nail-style" value="프렌치" style="padding-left: 10px;">
            <a>
              <div style="text-align:center"><img src="http://www.cuded.com/wp-content/uploads/2015/04/21-French-Manicure.jpg" class="w3-circle" alt="Cinque Terre" width="30" height="30"></div>
              프렌치
            </a>
          </li>
          <li class="nail-style" value="아트">
            <a>
              <div style="text-align:center"><img src="https://1.bp.blogspot.com/-6rVc4GNTKVU/Vtfa_wIBA5I/AAAAAAAAWnQ/tll1NnimnII/s1600/constellation-nail-art-3.jpg" class="w3-circle" alt="Cinque Terre" width="30" height="30"></div>
              아트
            </a>
          </li>
          <li class="nail-style" value="파츠">
            <a>
              <div style="text-align:center"><img src="https://s-media-cache-ak0.pinimg.com/originals/cf/28/fa/cf28fa8f1d236e4479e2eb3e3e3165fd.png" class="w3-circle" alt="Cinque Terre" width="30" height="30"></div>
              파츠
            </a>
          </li>
          <li class="nail-style" value="클리터">
            <a>
              <div style="text-align:center"><img src="https://i.ytimg.com/vi/IHjdyDyd7hk/hqdefault.jpg" class="w3-circle" alt="Cinque Terre" width="30" height="30"></div>
              클리터
            </a>
          </li>
          <li class="nail-style" value="그라데이션">
            <a>
              <div style="text-align:center"><img src="https://assets.teenvogue.com/photos/55829f6ca28d9d4e0540e581/master/pass/beauty-nails-2012-04-05-gradient-nail-tutorial.jpg" class="w3-circle" alt="Cinque Terre" width="30" height="30"></div>
              그라데이션
            </a>
          </li>
          <li class="nail-style" value="풀컬러">
            <a>
              <div style="text-align:center"><img src="http://katheryne.info/images5/0917L/full-color-acrylic-nail-designs/full-color-acrylic-nail-designs-44_13.jpg" class="w3-circle" alt="Cinque Terre" width="30" height="30"></div>
              풀컬러
            </a>
          </li>
          <li class="nail-style" value="캐릭터">
            <a>
              <div style="text-align:center"><img src="http://bebelushbeauty.com/uploads/best-marvel-nail-art-request-pict-for-cute-character-inspiration-and-names-trends_FILES_28561.jpg" class="w3-circle" alt="Cinque Terre" width="30" height="30"></div>
              캐릭터
            </a>
          </li>
        </ul>
      </div>

    </div>

				 
	 <button id="reset-all" class="w3-bar-item w3-button w3-border w3-hover-border-pale-red  w3-round w3-large" style="height: 40px;"><i class="fa fa-refresh"></i>
</button>	
  </div>
  

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
												<option value="손"<c:if test="${menu.menu_check eq '손'}">selected</c:if>>손</option>
												<option value="발"<c:if test="${menu.menu_check eq '발'}">selected</c:if>>발</option>
											</select>
											<button type="button" id="menuUpdate" class="btn-success btn">
												수정</button>
											<button id="menuDelete" class="btn btn-danger" value="${menu.menu_pk }" style="float: right;">삭제</button>
											</form>
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
