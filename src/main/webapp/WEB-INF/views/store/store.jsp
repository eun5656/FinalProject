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

<link href="${path }/resources/css/store.css?ver=7" rel="stylesheet" />
<link href="${path }/resources/css/review.css" rel="stylesheet" />
 <link href="${path }/resources/css/smallcarousel.css" rel="stylesheet">
<!-- store js -->
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDmfjiMcgfcCVI6QKs42Kk4AvHUVdOQtso"></script>
<script src="http://malsup.github.com/jquery.form.js"></script> 


<script type="text/javascript">
// 외부 js 에서 쓰이는 변수 setting
var path = "${pageContext.request.contextPath }";
var store_pk ="${store.store_pk}";
var holiday ="${store.store_holiday}";
var flag="${flag}";
$(function() {
	var holidaycheck ="#"+holiday;
	 $(holidaycheck).removeAttr("style","display:none;");
	 console.log(holidaycheck);
	//휴일 선택
	console.log(flag);
	if(flag=='true'){
		$('#review_tab').trigger('click');
		$('.level2').hide();
	}
	
});
</script>
<script src="${path }/resources/js/store.js?ver=11"></script>

<div id="wrapper">

	<div id="left-side">

		<div class="row">

				<!-- 가게 이미지 시작 -->					
				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 animatepop">		
					<div class="hovereffect">
						<img class="img-responsive radius14"
							src="${path }/resources/images/nail_store/${store.store_re_img }" alt="출력 실팽">
						<div class="overlay">
							<h2>${store. store_name }</h2>
							<p>
								<a href="#storeModal" data-toggle="modal">크게 보기</a>
							</p>
						</div>
					</div>
				</div>
				<!-- Modal start -->
											<div class="modal fade" id="storeModal">
										<div class="modal-dialog">
											<div class="modal-content">

												<!-- Modal Header -->
												<div class="modal-header">
													<h4 class="modal-title">${store. store_name }</h4>
													<button type="button" class="close" data-dismiss="modal">&times;</button>
												</div>

												<!-- Modal body -->
												<div class="modal-body">
													<div>
															<img class="img-responsive radius14" style="width:500px;"
															src="${path }/resources/images/nail_store/${store.store_re_img }" alt="스토어 사진">
													</div>
												</div> 
												<!-- Modal footer -->
												<div class="modal-footer">
												</div>

											</div>
										</div>
									</div>
									<!-- Modal End -->
				<!--가게 이미지 끝-->
				<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
					<h3>${store. store_name }</h3>
					<p>장소 : ${store. store_address }${store.store_address_detail }</p>
          			  <p> <c:forEach begin="1" end="${store_star}">
          				  <i class="price-text-color fa fa-star"></i>
           				  </c:forEach>
           				  <c:forEach begin="1" end="${5-store_star}">
             			  <i class=" fa fa-star"></i>
         				  </c:forEach>    
             		  </p>
          				  
          			  
          			  
          			  
          			  
					<p>Tel. ${store. store_phone }</p>
					<p>휴일 : 
  	<span class="holiday" id= "0" style="display:none;">일요일</span>
 	 <span class="holiday" id= "1"  style="display:none;">월요일</span>
 	 <span class="holiday" id= "2"  style="display:none;">화요일</span>
 	 <span class="holiday" id= "3"  style="display:none;">수요일</span>
 	  <span class="holiday" id= "4" style="display:none;">목요일</span>
 	   <span class="holiday" id= "5" style="display:none;">금요일</span>
  	   <span class="holiday" id= "6" style="display:none;">토요일</span>
					</p>
					<p>평일 ${store_time.store_open_time } - ${store_time.store_close_time } 주말 ${store_time.store_weekend_open } -  ${store_time.store_weekend_close }</p>
					<p>${store.store_info }</p>
				</div>
			</div>
			<div class="row" style="margin-top: 20px;">
				<marquee>${store.store_notice }</marquee>
			</div>
			<!-- tab 화면 시작-->
			<div>
				<div class="tabbable-panel"> 
					<div class="tabbable-line">
						<ul class="nav nav-tabs ">
							<li class="active"><a href="#tab_default_2"
								data-toggle="tab"> 가격 </a></li>
							<li><a href="#tab_default_1" data-toggle="tab"> 시술정보 </a></li>
							<li><a id="review_tab" href="#tab_default_3" data-toggle="tab"> 리뷰 </a></li>
								<!-- <script type="text/javascript">
								$('#reviewList').on('click',function () {
									location.href="${path}/storeReview/storeReviewList.do?store_pk=${store.store_pk}";
								});
								</script> -->
					
						</ul>
						<div class="tab-content">
							<!-- tab1 시작 -->
							<div class="tab-pane" id="tab_default_1">
								<div class="carousel slide multi-item-carousel" id="theCarousel">
									<div class="carousel-inner carouselCheck">
									<c:forEach var="nail" items="${nails }" varStatus="status" step='3'>
									<c:choose>
										<c:when test="${status.count eq 1}">									
										<div class="item active" >
										</c:when>
										<c:when test="${status.index %3 eq 0 }">									
										<div class="item">
										</c:when>
									</c:choose>	
										<c:forEach var='i'	 begin='${status.index }' end="${status.index +2 }">
										
										<a href="#NailModal${nails[i].nail_pk }" data-toggle="modal">
										
											<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 animatepop" style="margin-top: 10px; height:350px;">
												
<!-- 										bookmark start		 -->
											<jsp:useBean id="check_bookmark" class="java.lang.String" />
									<c:set var="check_bookmark" value="false"/>
 			
 							<c:forEach  var="bookmark" items="${bookmarkList}" varStatus="status">
							<c:if test="${bookmark.member_pk == memberLoggedIn.memberPk && bookmark.nail_pk == nails[i].nail_pk}">
 								<c:set var="check_bookmark" value="true"/>
 								<img src="${path }/resources/icons/love_filled.svg" alt="true" class="b_icon zindex"id="b_icon" style="max-height:400px;">
							<input class="bookmark_pk" name="bookmark_pk" type="hidden" value="${bookmark.bookmark_pk}" >
						</c:if>
							</c:forEach>
					
								<c:if test="${check_bookmark eq 'false'}">
	  						<img src="${path }/resources/icons/love_blank.svg" alt="false" class="b_icon zindex"id="b_icon">
 						<input class="bookmark_pk" name="bookmark_pk" type="hidden" value="${bookmark.bookmark_pk}" >
							</c:if>
							<input class="nail_pk" name="nail_pk" type="hidden" value="${nails[i].nail_pk}" >
							<input class="store_pk" name="store_pk" type="hidden" value="${store.store_pk}" >
							<input class="member_pk" name="member_pk" type="hidden" value="${memberLoggedIn.memberPk}" >
<!-- 							bookmarkend -->

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
													<h4 class="modal-title">${nail.nail_name }</h4>
													<button type="button" class="close" data-dismiss="modal">&times;</button>
												</div>

												<!-- Modal body -->
												<div class="modal-body">
													<div class="wh100">
													<!-- bookmark start		 -->
									<c:set var="check_bookmark" value="false"/>
 			
 							<c:forEach  var="bookmark" items="${bookmarkList}" varStatus="status">
							<c:if test="${bookmark.member_pk == memberLoggedIn.memberPk && bookmark.nail_pk == nail.nail_pk}">
 								<c:set var="check_bookmark" value="true"/>
 								<img src="${path }/resources/icons/love_filled.svg" alt="true" class="b_icon zindex"id="b_icon">
							<input class="bookmark_pk" name="bookmark_pk" type="hidden" value="${bookmark.bookmark_pk}" >
						</c:if>
							</c:forEach>
					
								<c:if test="${check_bookmark eq 'false'}">
	  						<img src="${path }/resources/icons/love_blank.svg" alt="false" class="b_icon zindex"id="b_icon">
 						<input class="bookmark_pk" name="bookmark_pk" type="hidden" value="${bookmark.bookmark_pk}" >
							</c:if>
							<input class="nail_pk" name="nail_pk" type="hidden" value="${nail.nail_pk}" >
							<input class="store_pk" name="store_pk" type="hidden" value="${store.store_pk}" >
							<input class="member_pk" name="member_pk" type="hidden" value="${memberLoggedIn.memberPk}" >
<!-- 							bookmarkend -->
															<img class="img-responsive radius14"
															src="${path }/resources/images/nails/${nail.nail_re_img}" alt="네일 사진">
													</div>
													<p>네일 정보 : ${nail.nail_info }</p>
													<p>네일 색상 : ${nail.nail_color },  타입   :  ${nail.nail_check },  종류  :  ${nail.nail_style }</p>
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



	<ul id='comment-main-'></ul>
	<c:forEach var="review" items="${reviews }" varStatus="status" >
	<!--<c:if test="${review.review_level==2 }"></c:if>-->
	<ul id='comment-main-${status.index}' class="media comment-box level1">
     <c:if test="${review.review_level==1}">
      <li>
        <div class="media-left">
        		<c:if test="${review.member_re_img==null}">
                    <img class="member_profile" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">
				</c:if>
                   			
                <c:if test="${review.member_re_img!=null}">
                    <img class="member_profile" src="${path}/resources/upload/member/${review.member_re_img}">
			    </c:if>
        </div>
        <div class="media-body">
      <div class="media-heading row" style="margin-right: 0px;margin-left: 0px; font-size: 13pt;"><div class="col-xs-3">${review.review_writer}</div>
                     			<div class="col-xs-9" style="text-align: right;"><c:out value="${review.review_date }"></c:out>
								</div>
							</div>
                  <div class="review_content">
                    <p>
                    
                    	
                    <c:out value="${review.review_content}"></c:out>
                    </p>
                 <div class="reply-btn-positon">
                   <!-- 점주만-->
						<button id="reply-btn-${status.index}" class='btn btn-light basic-btn btn-reply' value="1" type="button" onclick="fn_reply(${status.index },${review.review_pk},${review.store_pk})">댓글</button>               		
						<c:if test="${memberLoggedIn.memberPk== review.member_pk}">
                 	 <button id='reply-del-btn-${status.index}'  class='btn btn-light basic-btn btn-delete' type='button' onclick='fn_reply_delete(${status.index },${review.review_pk})'>삭제</button>
                 
                 	</c:if>
                 </div>
                  </div>
                  <div class="row">
                      <div class="col-sm-3" style="padding-top:10px;">

                        <!--for문으로 버튼 클릭안되게하기-->
                        <c:forEach begin="1" end="${review.review_star}">
                     <button type="button" class=" btn btn-xs btn-warning" class="view_star" >
                         <i class="fa fa-star" aria-hidden="true"></i>
                     </button>
                     </c:forEach>

                        <c:forEach begin="1" end="${5-review.review_star}">
                     <button type="button" class=" btn btn-xs btn-default" class="view_star" >
                         <i class="fa fa-star" aria-hidden="true"></i>
                     </button>
                      </c:forEach>
                     

                        <span class=""><c:out value="${review.review_star}"></c:out></span><small> / 5</small>
                      </div>
                  </div>
              </div>
              <br>
         	  <br>
            </li>
            </c:if>
     
             
              	
             
         
             	<ul class="media comment-box level2 comment-reply">
             	<li></li>
             	<c:if test="${review.review_level==2}"></c:if>
					<c:forEach var="review2" items="${reviews }" varStatus="status1" >
                <c:if test="${review2.review_level==2 && review2.review_ref==review.review_pk}">                     		
         		 <li>
                   <div class="media-left">
                   			<c:if test="${review.member_re_img==null}">
                    			<img class="member_profile" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">
							</c:if>
                   			
               				<c:if test="${review.member_re_img!=null}">
               	     			<img class="member_profile" src="${path}/resources/upload/member/${review.member_re_img}">
			    			</c:if>
                   </div>
                   <div class="media-body">
                     <div class="media-heading row" style="margin-right: 0px;margin-left: 0px; font-size: 13pt;"><div class="col-xs-3">${review2.review_writer}</div>
                     			<div class="col-xs-9" style="text-align: right;"><c:out value="${review2.review_date }"></c:out>
								</div>
							</div>
                       <div class="review_content">
               		   <p>
                    <c:out value="${review2.review_content}"></c:out>
                    </p>
                      <div class="result-btn-positon">
                     <c:if test="${memberLoggedIn.memberPk==review2.member_pk}">
                 	 	<button  class='btn btn-light basic-btn btn-delete reply2-del-btn' type='button' value="${review2.review_pk }">삭제</button>
                     </c:if>
                      </div>
                       </div>
                    </div>          
         	  <br>
                 </li>
           
                 </c:if>
                 </c:forEach>
                 
              </ul>
                  </ul>
               </c:forEach>

				<c:if test="${memberLoggedIn!=null}">               
					<jsp:useBean id="currTime" class="java.util.Date" />
                    <div id='insertComment' class="media comment-box insertComment"><!-- ? -->
         			  <form id="review_insert"  name="review_insert" action=""  method="POST" enctype="multipart/form-data">
						<input type="hidden" value="${memberLoggedIn.memberPk }" name="member_pk"/>
						<input type="hidden" value="${memberLoggedIn.memberId }" name="review_writer"/>
                		<input type="hidden" value="${store. store_pk  }" name="store_pk"/>
                		<input type="hidden" value="${currTime }" name="review_date"/>
                	    <input type="hidden" value="1" name="review_level"/>
                	
                		 <div class="media-left">
							<c:if test="${memberLoggedIn.memberReImg==null}">
                              <img class="member_profile" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">
                   			</c:if>
                   			
                   			<c:if test="${memberLoggedIn.memberReImg!=null}">
                   			  <img class="member_profile" src="${path}/resources/upload/member/${memberLoggedIn.memberReImg}">
							</c:if>

                 		</div>
                		 <div class="media-body purple-border input_comment">
                     		<div class="media-heading row" style="margin-right: 0px;margin-left: 0px; font-size: 13pt;"><div class="col-xs-3">${memberLoggedIn.memberId}</div>
                     			<div class="col-xs-9" style="text-align: right;"><fmt:formatDate value="${currTime}" pattern="yyyy-MM-dd HH:mm"/>
								</div>
							</div>
                     		<div class="form-group" style="margin-bottom:0px;">
                        		 <textarea class="form-control" id="" rows="3" name="review_content" required="required" autofocus="autofocus"></textarea>
                     		</div>
                 <div class="row" style="margin-right:0px;">
                     <div class="col-sm-5">
                       <input type="hidden" id="selected_rating" name=review_star value="" required="required">
                    <button type="button" class="btnrating btn btn-default btn-xs" data-attr="1" id="rating-star-1">
                        <i class="fa fa-star" aria-hidden="true"></i>
                    </button>
                    <button type="button" class="btnrating btn btn-default btn-xs" data-attr="2" id="rating-star-2">
                        <i class="fa fa-star" aria-hidden="true"></i>
                    </button>
                    <button type="button" class="btnrating btn btn-default btn-xs" data-attr="3" id="rating-star-3">
                        <i class="fa fa-star" aria-hidden="true"></i>
                    </button>
                    <button type="button" class="btnrating btn btn-default btn-xs" data-attr="4" id="rating-star-4">
                        <i class="fa fa-star" aria-hidden="true"></i>
                    </button>
                    <button type="button" class="btnrating btn btn-default btn-xs" data-attr="5" id="rating-star-5">
                        <i class="fa fa-star" aria-hidden="true"></i>
                    </button>
                       <span class="selected-rating">0</span><small> / 5</small>
                     </div>

                      <div class="col-sm-2">
                      </div>

                          <div class="col-sm-5" style="text-align:right;padding-top:1px;left: 30px;">
                            <div class="input-group btn ">
                              <input type="text" class="form-control image-preview-filename " disabled="disabled" style="background:white;"> <!-- don't give a name === doesn't send on POST/GET -->
                 <span class="input-group-btn image-preview">
                     <!-- image-preview-clear button -->
                     <button type="button" class="btn btn-default image-preview-clear basic-btn" style="display:none;">
                         <span class="glyphicon glyphicon-remove"></span> Clear
                     </button>
                     <!-- image-preview-input -->
                     <div class="btn btn-default image-preview-input basic-btn">
                         <span class="glyphicon glyphicon-folder-open"></span>
                         <span class="image-preview-input-title ">Browse</span>
                         <input type="file" accept="image/png, image/jpeg, image/gif" name="review_ori_img" id='review_ori_img'/> <!-- rename it -->
                     </div>
                 </span> </div>

                       <button id="result-button" class='btn btn-light basic-btn btn-center' type="submit">완료</button>
                       <button id="reset-button" class='btn btn-light basic-btn btn-center' type="reset">취소</button>
                     </div>
                 </div>
                </div>
             </form>
           </div>
           </c:if>
           
           <script type="text/javascript">
           $(function () {
        	   $("form[name=review_insert]").submit(function(e) {
        		        e.preventDefault();        			  	 
	
	      			   var form = $('#review_insert')[0];
	                    var formData = new FormData(form);
	                    formData.append("member_pk",  $('input[name=member_pk]'));
	                    formData.append("store_pk", $('input[name=store_pk]'));
	                    formData.append("review_writer", $('input[name=review_writer]'));
	                    formData.append("review_date", $('input[name=review_date]'));
	                    formData.append("review_level",$('input[name=review_level]'));
	                    formData.append("review_content", $('input[name=review_content]'));
	                    formData.append("review_star", $('input[name=review_star]'));
	                    formData.append("review_ori_img", $('input[name=review_ori_img]'));
	                    
	                    var insert_div=$(".insertComment");
        		        
	        		       var index= insert_div.prev().attr('id');
	        		       index=parseInt( index.charAt(index.length - 1));
	        		       if(isNaN(index)){
	        		    	   index=0;
	        		       }
	        		       else{
	        		       index=index+1;
	        		       }
	        		       console.log(index);
						 
        		 	$.ajax({
        		 	        type: "POST",
        		 	        enctype: 'multipart/form-data',
        		 	        url: "${path}/storeReview/storeReviewInsert.do",
        		 	        data: formData,
							dataType: "json",
        		 	        processData: false,
        		 	        contentType: false,
        		 	        cache: false,
        		 	        success: function (data) {
								alert(data.review_value.review_pk);
							//var re_img;
							/*re_img+=data.review_value.review_re_img;
								    re_img+="'";
        		 	        	alert(re_img);*/
        		 	        	
        		 	        	var re_img = new String(data.review_value.review_re_img);
        		 	        	//re_img =String.valueOf(re_img);
        		 				alert(isFinite(re_img));
        		 				
								 var html1="<ul id='comment-main-"+index+"' class='media comment-box level1'></ul>";
								 var html2="<li>";
								 html2+="<div class='media-left'>";
								 if("${memberLoggedIn.memberReImg}".length>0){
								 html2+="<img class='member_profile' src='${path}/resources/upload/member/${memberLoggedIn.memberReImg}'>";
								 }
								 else{
								 html2+="<img class='member_profile' src='https://ssl.gstatic.com/accounts/ui/avatar_2x.png'>";
								 }
								 html2+="</div>";
								 html2+="<div class='media-body'>";
								 html2+="<div class='media-heading row' style='margin-right: 0px;margin-left: 0px; font-size: 13pt;''><div class='col-xs-3'>"+data.review_value.review_writer+"</div>";
								 html2+="<div class='col-xs-9' style='text-align: right;''>";
								 html2+= "<fmt:formatDate value='${currTime}' pattern='yyyy-MM-dd HH:mm:ss'/>"
								 
								 html2+="</div>";
								 html2+="</div>";
								 html2+="<div class='review_content'>";
								 html2+=" <p>";
								
								 if(data.review_value.review_ori_img!=null){
								 html2+="<img class='review-img'alt='' src='${path}/resources/upload/storeReview/"+data.review_value.review_re_img+"'>";
								 }
								 html2+=""+data.review_value.review_content+"";
								
								 html2+="</p>";
								 html2+="<div class='reply-btn-positon'>";
								 html2+="<button id='reply-btn-"+index+"' class='btn btn-light basic-btn btn-reply' value='1' type='button' onclick='fn_reply("+index+","+data.review_value.review_pk+","+data.review_value.store_pk+")'>댓글</button>";
								 html2+=" <button id='reply-del-btn-'"+index+"  class='btn btn-light basic-btn btn-delete' type='button' onclick='fn_reply_delete("+index+","+data.review_value.review_pk+")'>삭제</button>";
			               		 html2+="</div>";
								 html2+="</div>";
								 html2+="<div class='row'>";
								 html2+="<div class='col-sm-3' style='padding-top:10px;'>";
								
								 for (var i = 0; i < data.review_value.review_star; i++) {
								 html2+=" <button type='button' class='btn btn-xs btn-warning' class='view_star'>";
								 html2+="<i class='fa fa-star' aria-hidden='true'></i>";
								 html2+="</button>";
								}
								 
								 for (var i = 0; i <5-data.review_value.review_star; i++) {
									 html2+=" <button type='button' class='btn btn-xs btn-default' class='view_star'>";
									 html2+="<i class='fa fa-star' aria-hidden='true'></i>";
									 html2+="</button>";
								 }
								 
								 html2+="<span>"+data.review_value.review_star+"</span><small> / 5</small>";
								 html2+="</div>";
								 html2+="</div>";
								 html2+="</div>";
								 html2+="<br>";
								 html2+="<br>";
								 html2+="</li>";
								
								 html2+="<ul class='media comment-box level2 comment-reply'>";
								 html2+="<li></li>";
								 html2+="</ul>";
								 
								 insert_div.prev().after(html1);
								 $("#comment-main-"+index).html(html2);
								// fn_reply(index,review_pk,store_pk);
			        	   		 $('#reset-button').trigger('click');
			        	   		 $('#close-preview').trigger('click');
			        	   		 $('.image-preview-clear').trigger('click');
        		 	        },
        		 	        error: function (e) {
        		 	            console.log("ERROR : ", e);
        		 	        }

        		      	 })
        		       });	
        	   

        	   $('#review_tab').one('click', function() {	
        	   	$('.comment-reply').css('display','none');
        	   });
        	      
        	   eventBind2();
        		    });
           </script>
							<br><br><br><br><br>
							</div>
							<!-- 3번째 탭 끝 -->
							
  <script type="text/javascript">
  				//별점 쿼리
             $(function () {
              $(".btnrating").on('click',(function(e) {

             var previous_value = $("#selected_rating").val();

             var selected_value = $(this).attr("data-attr");
             $("#selected_rating").val(selected_value);

             $(".selected-rating").empty();
             $(".selected-rating").html(selected_value);

             for (i = 1; i <= selected_value; ++i) {
             $("#rating-star-"+i).toggleClass('btn-warning');
             $("#rating-star-"+i).toggleClass('btn-default');
             }

             for (ix = 1; ix <= previous_value; ++ix) {
             $("#rating-star-"+ix).toggleClass('btn-warning');
             $("#rating-star-"+ix).toggleClass('btn-default');
             }
             $("input[name=review_star]").val(selected_value);
             }));

                   $("#reset-button").on('click',function() {

                     $(".selected-rating").empty();
                     $(".selected-rating").html(0);
                     for (i = 1; i <= 5; ++i) {
                     $("#rating-star-"+i).removeClass();
                     $("#rating-star-"+i).addClass('btnrating');
                     $("#rating-star-"+i).addClass('btn');
                     $("#rating-star-"+i).addClass('btn-default');
                     $("#rating-star-"+i).addClass('btn-xs');
                     }
                     $("#selected_rating").val('');
                     $("input[name=review_star]").val(0);
                   });

                    $('.view_star').attr('disabled', true);
   });
     
  				
  				//미리보기 쿼리
               $(document).on('click', '#close-preview', function(){
            	   
  $('.image-preview').popover('hide');
  // Hover befor close the preview
  $('.image-preview').hover(
      function () {
         $('.image-preview').popover('show');
      },
       function () {
         $('.image-preview').popover('hide');
      }
  );
});

$(function() {
  // Create the close button
  var closebtn = $('<button/>', {
      type:"button",
      text: 'x',
      id: 'close-preview',
      style: 'font-size: initial;',
  });
  closebtn.attr("class","close pull-right");
  // Set the popover default content
  $('.image-preview').popover({
      trigger:'manual',
      html:true,
      title: "<strong>Preview</strong>"+$(closebtn)[0].outerHTML,
      content: "There's no image",
      placement:'auto left'
  });
  // Clear event
  $('.image-preview-clear').click(function(){
      $('.image-preview').attr("data-content","").popover('hide');
      $('.image-preview-filename').val("");
      $('.image-preview-clear').hide();
      $('.image-preview-input input:file').val("");
      $(".image-preview-input-title").text("Browse");
  });
  // Create the preview image
  $(".image-preview-input input:file").change(function (){
      var img = $('<img/>', {
          id: 'dynamic',
          width:250,
          height:200
      });
      var file = this.files[0];
      var reader = new FileReader();
      // Set preview image into the popover data-content
      reader.onload = function (e) {
          $(".image-preview-input-title").text("Change");
          $(".image-preview-clear").show();
          $(".image-preview-filename").val(file.name);
          img.attr('src', e.target.result);
          $(".image-preview").attr("data-content",$(img)[0].outerHTML).popover("show");
      }
      reader.readAsDataURL(file);
  });
});

function fn_reply(index,review_pk,store_pk) {

	var memberLoggedIn= "${memberLoggedIn}";
	var reply_btn=$("#reply-btn-"+index);
	if(memberLoggedIn.length!=0){
     if(reply_btn.val()=="1"){
	 var li = $('<li></li>'); 
	 var html='';
		html+="<div class='media comment-box insertComment'>";
		html+="<form name='reply_insert"+index+"' action='#' method='post'>";
		html+="<input type='hidden' value='${memberLoggedIn.memberPk }' name='member_pk'/>";
		html+="<input type='hidden' value='${memberLoggedIn.memberId }' name='review_writer'/>";
		html+="<input type='hidden' value='"+store_pk+"' name='store_pk'/>";
		html+="<input type='hidden' value='"+review_pk+"' name='review_pk'/>";
		html+="<input type='hidden' value='2' name='review_level'/>";
		html+="<input type='hidden' value='"+index+"' name='index'/>";
		html+="<div class='media-left'>";
		if("${memberLoggedIn.memberReImg}".length>0){
		html+="<img class='member_profile' src='${path}/resources/upload/member/${memberLoggedIn.memberReImg}'>";
		}
		else{
	    html+="<img class='member_profile' src='https://ssl.gstatic.com/accounts/ui/avatar_2x.png'>";
		}
		html+="</div>";
		html+="<div class='media-body purple-border input_comment'>";
		html+="<div class='media-heading row' style='margin-right: 0px;margin-left: 0px; font-size: 13pt;'><div class='col-xs-3'>${memberLoggedIn.memberId}</div>";
	    html+="<div class='col-xs-9' style='text-align: right;'><fmt:formatDate value='${currTime}' pattern='yyyy-MM-dd HH:mm'/>";
	    html+="</div>";	
	    html+="</div>";	
		html+="<div class='form-group' style='margin-bottom:0px;'>";
		html+="<textarea name='review_content' class='form-control' id='' rows='3' placeholder='댓글을 작성하세요' required></textarea>";
		html+="</div>";
		html+="</div>";
		html+="<div class='row'>";
		html+="<div class='col-sm-4 col-sm-offset-8' style='text-align:right; padding-top:5px; left: 30px;'>";
		html+="<button class='btn btn-light basic-btn btn-center reply-sunmit' type='submit'>완료</button> ";
		html+="<button id='reply-reset"+index+"' class='btn btn-light basic-btn btn-center reply-reset' type='reset'>취소</button>";
		html+="</div>";
		html+="</div>";
		html+="</div>";
		html+="</form>";
		html+="</div>";
		html+="</br>";
		li.html(html);
		reply_btn.parent().parent().parent().parent().next().append(li);
   	    reply_btn.val('2');
   		eventBind(index);
      }
	}
     reply_btn.parents('ul').children('ul').toggle();
}

function fn_reply_delete(index,review_pk){
    	reply_del_btn=$("#reply-del-btn-"+index);
 	   $.ajax({
 	        url: "${path}/storeReview/storeReviewDelete.do",
			data:{review_pk:review_pk},
			type: "post",
			dataType: "json",
 	        success: function (data) {
 	        	$("#comment-main-"+index).remove();
					//reply_del_btn.parent().parent().parent().parent().remove();
 	        	alert(data);
 	        },
 	        error: function (e) {
 	            console.log("ERROR : ", e);
 	        }
      	 })
}
function eventBind2() {
	$('.reply2-del-btn').on('click', function() {
	//	$(this).parent().parent().parent().parent().remove();
		console.log($(this).val());
	 	   	var li=$(this).parent().parent().parent().parent();
		
		  $.ajax({
	 	        url: "${path}/storeReview/storeReviewDelete.do",
				data:{review_pk:$(this).val()},
				type: "post",
				dataType: "json",
	 	        success: function (data) {
	 	        li.remove(); 	        	
	 	        alert(data);
	 	        },
	 	        error: function (e) {
	 	            console.log("ERROR : ", e);
	 	        }
	      	 })
	      	 
	});
}

function eventBind(index) {
	$("form[name=reply_insert"+index+"]").submit(function(e) {
	 	 e.preventDefault(); 
		 var positon=$(this).parent().parent().prev();
			// if(positon[0]==null){
			//positon=$(this).parent().parent();
	       //     console.log(positon);
		 //}
	 	 alert($(this).serialize());
		 $.ajax({
	 	        url: "${path}/storeReview/storeReviewReplyInsert.do",
				data: $(this).serialize(),
				type: "post",
				dataType: "json",
	 	        success: function (data) {
	 	        	 var li = $('<li></li>'); 
		 	       	 var html='';
		 	       		html+="<div class='media-left'>";
		 	     	    if("${memberLoggedIn.memberReImg}".length>0){
		 	     		html+="<img class='member_profile' src='${path}/resources/upload/member/${memberLoggedIn.memberReImg}'>";
		 	     		}
		 	     		else{
		 	     	    html+="<img class='member_profile' src='https://ssl.gstatic.com/accounts/ui/avatar_2x.png'>";
		 	     		}
		 	       		html+="</div>";
		 	       		html+="<div class='media-body'>";
		 	       		html+="<div class='media-heading row' style='margin-right: 0px;margin-left: 0px; font-size: 13pt;'><div class='col-xs-3'>"+data.review_value.review_writer+"</div>";
						html+="<div class='col-xs-9' style='text-align: right;'><fmt:formatDate value='${currTime}' pattern='yyyy-MM-dd HH:mm:ss'/>";
		 	       		html+="</div>";
		 	       		html+="</div>";
		 	       		html+="<div class='review_content'>";
		 	       		html+="<p>";
		 	       		html+=""+data.review_value.review_content+"";
		 	       		html+="</p>";
		 	       		html+="<div class='result-btn-positon'>";
						if("${memberLoggedIn.memberPk}"==data.review_value.member_pk){
		 	       		html+=" <button class='btn btn-light basic-btn btn-delete reply2-del-btn' type='button' value='"+data.review_value.review_pk+"'>삭제</button>";
						}
		 	       		html+="</div>";
		 	       		html+="</div>";
		 	       		html+="</div>";
		 	       		html+=" <br>";
		 	     	  	li.html(html);	
			 	        positon.after(li);
			 	        eventBind2();
			 	        $("#reply-reset"+index).trigger('click');
			 	      
	 	        },
	 	        error: function (e) {
	 	            console.log("ERROR : ", e);
	 	        }
	      	 })	
 });
}
	 
     </script>
						</div>
						<!-- tab content 끝 -->
					</div>
				</div>
				<!-- tab 화면 끝 -->


			</div>
			<!-- row 끝 -->

	
</div>
<!-- left end -->
<div id="right-side">
<div id="border" >
	<div id="line" class="one" style="position:fixed;"></div>
</div>
<div style="position: fixed;">
			<ul>
			<li class="shop active ">
				<div class="icon active">
					<img src="${path }/resources/icons/shop.svg" alt="">
				</div> <span class="right"> Shop</span>
			</li>
			<li class="map ">
				<div class="icon">
					<img src="${path }/resources/icons/map.svg" alt="">
				</div> <span class="right"> Map</span>
			</li>
			<li class="reserve">
				<div class="icon">
					<img src="${path }/resources/icons/calander.svg" alt="">
				</div>
				<span class="right"> Reserve(예약)</span>
			</li>
			<li class="qna">
				<div class="icon">
					<img src="${path }/resources/icons/customer.svg" alt="">
				</div> 
				<span class="right"> QnA(문의)</span>
			</li>
		</ul>
	</div>
	
</div>

</div>
<script type="text/javascript">
$(".b_icon").click(function() {					    	
	var memberLoggedIn= "${memberLoggedIn}";
	if(memberLoggedIn.length!=0){

	var temp=$(this);
	var bookmark_val = { 
			nail_pk: temp.nextAll("[name='nail_pk']").val(),
			member_pk: temp.nextAll("[name='member_pk']").val(),
			store_pk: temp.nextAll("[name='store_pk']").val(),
			bookmark_check:null 			
			}

	
	if (temp.attr("alt")=='false') 
	{	
		bookmark_val.bookmark_check="true";
		//var nail_pk=temp.next().val();					    		
		//var member_pk=temp.next().next().val();
	  var jsonData = JSON.stringify(bookmark_val);
	  console.log(jsonData);
      jQuery.ajaxSettings.traditional = true;
		///*json 객체로 바로넘기기					    							    		
		    $.ajax({
		 	url:"${path}/bookmark/insertBookmark.do",
			data:{"bookmark_val":jsonData},
			type: "post",
			dataType: "json",
			success: function(data){
  		   		alert("등록완료");
				temp.attr("alt","true");
    			temp.attr("src","/spring/resources/icons/love_filled.svg");
    			temp.nextAll('.bookmark_pk').attr('value',data);
				},
			error: function(jpxhr,textStatus,errormsg) {
				console.log("ajax전송실패");
				console.log(jpxhr);
				console.log(textStatus);
				console.log(errormsg);
			}
		})	
		
	} 
	else {
		
		//bookmark_val.bookmark_check="false";
		//var nail_pk=temp.next().val();					    		
		//var member_pk=temp.next().next().val();\ss
		var bookmark_pk=temp.nextAll("[name='bookmark_pk']").val();
		var member_pk=temp.nextAll("[name='member_pk']").val()
	    $.ajax({
	 	url:"${path}/bookmark/deleteBookmark.do",
		data:{"bookmark_pk":temp.nextAll("[name='bookmark_pk']").val(),"member_pk":temp.nextAll("[name='member_pk']").val()},
		type: "post",
		dataType: "json",
		
		success: function(data){
  		    alert("삭제완료");
			temp.attr("alt","false");
    		temp.attr("src","/spring/resources/icons/love_blank.svg");
			temp.nextAll('.bookmark_pk').attr('value','');
			},
		error: function(jpxhr,textStatus,errormsg) {
			console.log("ajax전송실패");
			console.log(jpxhr);
			console.log(textStatus);
			console.log(errormsg);
		}
	})	
	}	
	}
	else{
		alert("로그인해주세요");
	}
});
</script>
<!-- 푸터부분 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
