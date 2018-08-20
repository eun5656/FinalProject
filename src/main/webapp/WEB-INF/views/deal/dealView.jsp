<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var='path' value="${pageContext.request.contextPath}" />



<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value=" " name="pageTitle" />
</jsp:include>
<link href="${path }/resources/css/review.css" rel="stylesheet" />
<style>
	.container{
		margin-top:100px;
		margin-bottom:50px;
	}
	
	img { max-width: 100%; };
	.row{
		margin-top:30px;
	}
	.media-body {
    width: 900px;
}
	
</style>

<script type="text/javascript">
// 외부 js 에서 쓰이는 변수 setting

var deal_pk ="${deal.deal_pk}";
</script>

	<div class="container center-block">
		<div class="row">
		<div class="col-xs-1"></div>
		<div class="col-xs-10">
		
		<div class="panel panel-default">
			<div class="panel-heading deal-title">
			
				<h3 style="padding-left:15px;">${deal.deal_title }</h3>
			</div>
			<div class="panel-body">
				<div class="row text-right">
					<div class="col-sm-1"></div>
					<div class="col-sm-8"></div>
					<div class="col-sm-2"> <fmt:formatDate value="${deal.deal_date}" pattern="yyyy/MM/dd HH:mm"/></div>
					<div class="col-sm-1"></div>	
					 
				</div>
				<div class="row">
					<div class="col-sm-1"></div>
					<div class="col-sm-10">${deal.deal_content }</div>
					<div class="col-sm-1"></div>
				</div>	
				 <div class="row text-right">
		  			<div class="col-sm-1"></div>
					<div class="col-sm-7"></div>
					<div class="col-sm-3"> 
					  	
          				<div class="btn-group">
 							<button type="button" class="btn btn-primary" onclick="location.href='${path}/deal/dealList.do'">목록</button>
  							<button type="button" class="btn btn-primary" onclick="location.href='${path}/deal/dealUpdate.do?deal_pk=${deal.deal_pk}'">수정</button>
  							<button type="button" class="btn btn-primary" onclick='fn_delete()'>삭제</button>
  				<script>
  				function fn_delete(){
  					var check=confirm("거래글을 삭제하시겠습니까?");
  					if(check==true){
  						location.href='${path}/deal/dealDelete.do?deal_pk=${deal.deal_pk}';
  					}
  				}
  				</script>
  		
			</div>
							
					</div>
					<div class="col-sm-1"></div>
		  	
		
     	 </div>
				
			</div>
		
			
		</div>	
		 
    	</div>
    	<div class="col-xs-1"></div>
    	</div>
    	<div class="row">
    	
    	
    		
		<div class="col-sm-1"></div>
		<div class="col-sm-10">


	<ul id='comment-main-'></ul>
	

	<c:forEach var="dealreview" items="${dealreviews }" varStatus="status" >
	
	
	<!--<c:if test="${review.review_level==2 }"></c:if>-->
	<ul id='comment-main-${status.index}' class="media comment-box level1">
	
	
	
     <c:if test="${dealreview.deal_review_level==1}">
      <li>
        <div class="media-left">
        <!-- 경로바꿔주기 -->
          <img class="member_profile" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">
        </div>
        <div class="media-body">
      <div class="media-heading row" style="margin-right: 0px;margin-left: 0px; font-size: 13pt;"><div class="col-xs-3">${dealreview.deal_review_writer}</div>
                     			<div class="col-xs-9" style="text-align: right;"><c:out value="${dealreview.deal_review_date }"></c:out>
								</div>
							</div>
                  <div class="review_content">
                    <p>
                    <c:if test="${dealreview.deal_review_re_img != null}">
                    <img class="review-img"alt="" src="${path}/resources/upload/dealReview/${dealreview.deal_review_re_img}">                
                    </c:if>
                    <c:out value="${dealreview.deal_review_content}"></c:out>
                    </p>
                 <div class="reply-btn-positon">
             
             
             			<!--모든사람이 답변을 달 수 있다.  -->
						<button id="reply-btn-${status.index}" class='btn btn-light basic-btn btn-reply' value="1" type="button" onclick="fn_reply(${status.index },${dealreview.deal_review_pk},${dealreview.deal_pk})">답글</button>               		
					
					<!--삭제시에는 해당 작성자만 지울 수 있도록  -->	
					<c:if test="${memberLoggedIn.memberPk== dealreview.member_pk}">
                 	 <button id='reply-del-btn-${status.index}'  class='btn btn-light basic-btn btn-delete' type='button' onclick='fn_reply_delete(${status.index },${dealreview.deal_review_pk})'>삭제</button>
                 
                 	</c:if>
	
                 </div>
                  </div>

              </div>
              <br>
         	  <br>
            </li>
            </c:if>
 
             
              	
             
         
             	<ul class="media comment-box level2 comment-reply">
             	<li></li>
             	<c:if test="${dealreview.deal_review_level==2 !=null}"></c:if>
             	
             	
					<c:forEach var="dealreview2" items="${dealreviews }" varStatus="status1" >
                <c:if test="${dealreview2.deal_review_level==2 && dealreview2.deal_review_ref==dealreview.deal_review_pk}">                     		
         		 <li>
                   <div class="media-left">
                           <img class="member_profile" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">
                   </div>
                   <div class="media-body">
                     <div class="media-heading row" style="margin-right: 0px;margin-left: 0px; font-size: 13pt;"><div class="col-xs-3">${dealreview2.deal_review_writer}</div>
                     			<div class="col-xs-9" style="text-align: right;"><c:out value="${dealreview2.deal_review_date }"></c:out>
								</div>
							</div>
                       <div class="review_content">
               		   <p>
                    <c:out value="${dealreview2.deal_review_content}"></c:out>
                    </p>
                      <div class="result-btn-positon">
                     <c:if test="${memberLoggedIn.memberPk==dealreview2.member_pk}">
                     	<button class='btn btn-light basic-btn btn-update' type="button" onclick="">수정</button>
                 	 	<button  class='btn btn-light basic-btn btn-delete reply2-del-btn' type='button' value="${dealreview2.deal_review_pk }">삭제</button>
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
						<input type="hidden" value="${memberLoggedIn.memberId }" name="deal_review_writer"/>
                		<input type="hidden" value="${deal.deal_pk  }" name="deal_pk"/>
                		<input type="hidden" value="${currTime }" name="deal_review_date"/>
                	    <input type="hidden" value="1" name="deal_review_level"/>
                	
                		 <div class="media-left">
                         <img class="member_profile" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">
                 		</div>
                		 <div class="media-body purple-border input_comment">
                     		<div class="media-heading row" style="margin-right: 0px;margin-left: 0px; font-size: 13pt;"><div class="col-xs-3">${memberLoggedIn.memberId}</div>
                     			<div class="col-xs-9" style="text-align: right;"><fmt:formatDate value="${currTime}" pattern="yyyy-MM-dd HH:mm"/>
								</div>
							</div>
                     		<div class="form-group" style="margin-bottom:0px;">
                        		 <textarea class="form-control" id="" rows="3" name="deal_review_content" required=" 	"></textarea>
                     		</div>
                 <div class="row" style="margin-right:0px;">
                     <!--별점 받아오던곳  -->
                     <div class="col-sm-5">
                    
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
                         <input type="file" accept="image/png, image/jpeg, image/gif" name="deal_review_ori_img" id='deal_review_ori_img'/> <!-- rename it -->
                     </div>
                 </span> 
                 </div>

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
	                    formData.append("deal_pk", $('input[name=deal_pk]'));
	                    formData.append("deal_review_writer", $('input[name=deal_review_writer]'));
	                    formData.append("deal_review_date", $('input[name=deal_review_date]'));
	                    formData.append("deal_review_level",$('input[name=deal_review_level]'));
	                    formData.append("deal_review_content", $('input[name=deal_review_content]'));
	                    formData.append("deal_review_ori_img", $('input[name=deal_review_ori_img]'));
	                    
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
        		 	        url: "${path}/dealReview/dealReviewInsert.do",
        		 	        data: formData,
							dataType: "json",
        		 	        processData: false,
        		 	        contentType: false,
        		 	        cache: false,
        		 	        success: function (data) {
								alert(data.dealreview_value.deal_review_pk);
							//var re_img;
							/*re_img+=data.review_value.review_re_img;
								    re_img+="'";
        		 	        	alert(re_img);*/
        		 	        	
        		 	        	var re_img = new String(data.dealreview_value.deal_review_re_img);
        		 	        	//re_img =String.valueOf(re_img);
        		 				alert(isFinite(re_img));
        		 				
								 var html1="<ul id='comment-main-"+index+"' class='media comment-box level1'></ul>";
								 var html2="<li>";
								 html2+="<div class='media-left'>";
								 html2+="<img class='member_profile' src='${path}/images/member/${memberLoggedIn.memberReImg}'>";
								 html2+="</div>";
								 html2+="<div class='media-body'>";
								 html2+="<div class='media-heading row' style='margin-right: 0px;margin-left: 0px; font-size: 13pt;''><div class='col-xs-3'>"+data.dealreview_value.deal_review_writer+"</div>";
								 html2+="<div class='col-xs-9' style='text-align: right;''>";
								 html2+= "<fmt:formatDate value='${currTime}' pattern='yyyy-MM-dd HH:mm:ss'/>"
								 
								 html2+="</div>";
								 html2+="</div>";
								 html2+="<div class='review_content'>";
								 html2+=" <p>";
								
								 if(data.dealreview_value.deal_review_ori_img!=null){
								 html2+="<img class='review-img'alt='' src='${path}/resources/upload/dealReview/"+data.dealreview_value.deal_review_re_img+"'>";
								 }
								 html2+=""+data.dealreview_value.deal_review_content+"";
								
								 html2+="</p>";
								 html2+="<div class='reply-btn-positon'>";
								 html2+="<button id='reply-btn-"+index+"' class='btn btn-light basic-btn btn-reply' value='1' type='button' onclick='fn_reply("+index+","+data.dealreview_value.deal_review_pk+","+data.dealreview_value.deal_pk+")'>답글</button>";
								 html2+=" <button id='reply-del-btn-'"+index+"  class='btn btn-light basic-btn btn-delete' type='button' onclick='fn_reply_delete("+index+","+data.dealreview_value.deal_review_pk+")'>삭제</button>";
			               		 html2+="</div>";
								 html2+="</div>";
								 html2+="<div class='row'>";
								 html2+="<div class='col-sm-3' style='padding-top:10px;'>";
								
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





function fn_reply(index,deal_review_pk,deal_pk) {

var memberLoggedIn= "${memberLoggedIn}";
var reply_btn=$("#reply-btn-"+index);
if(memberLoggedIn.length!=0){
 if(reply_btn.val()=="1"){
 var li = $('<li></li>'); 
 var html='';
	html+="<div class='media comment-box insertComment'>";
	html+="<form name='reply_insert"+index+"' action='#' method='post'>";
	html+="<input type='hidden' value='${memberLoggedIn.memberPk }' name='member_pk'/>";
	html+="<input type='hidden' value='${memberLoggedIn.memberId }' name='deal_review_writer'/>";
	html+="<input type='hidden' value='"+deal_pk+"' name='deal_pk'/>";
	html+="<input type='hidden' value='"+deal_review_pk+"' name='deal_review_pk'/>";
	html+="<input type='hidden' value='2' name='deal_review_level'/>";
	html+="<input type='hidden' value='"+index+"' name='index'/>";
	html+="<div class='media-left'>";
	html+="<img class='member_profile' src='https://ssl.gstatic.com/accounts/ui/avatar_2x.png'>";
//	html+="<img class='member_profile' src='${path}/resources/member_profile/${memberLogged.memberReImg}'>";
	//null일때 처리
	html+="</div>";
	html+="<div class='media-body purple-border input_comment'>";
	html+="<div class='media-heading row' style='margin-right: 0px;margin-left: 0px; font-size: 13pt;'><div class='col-xs-3'>${memberLoggedIn.memberId}</div>";
    html+="<div class='col-xs-9' style='text-align: right;'><fmt:formatDate value='${currTime}' pattern='yyyy-MM-dd HH:mm'/>";
    html+="</div>";	
    html+="</div>";	
	html+="<div class='form-group' style='margin-bottom:0px;'>";
	html+="<textarea name='deal_review_content' class='form-control' id='' rows='3' placeholder='댓글을 작성하세요' required></textarea>";
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
  };
};
 reply_btn.parents('ul').children('ul').toggle();
};




function fn_reply_delete(index,deal_review_pk){
	reply_del_btn=$("#reply-del-btn-"+index);
	   $.ajax({
	        url: "${path}/dealReview/dealReviewDelete.do",
		data:{deal_review_pk: deal_review_pk},
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
 	        url: "${path}/dealReview/dealReviewDelete.do",
			data:{deal_review_pk:$(this).val()},
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
 	
	 $.ajax({
 	        url: "${path}/dealReview/dealReviewReplyInsert.do",
			data: $(this).serialize(),
			type: "post",
			dataType: "json",
 	        success: function (data) {
 	        	 var li = $('<li></li>'); 
	 	       	 var html='';
	 	       		html+="<div class='media-left'>";
	 	     	  	html+="<img class='member_profile' src='https://ssl.gstatic.com/accounts/ui/avatar_2x.png'>";
	 	   			//	html+="<img class='member_profile' src='${path}/resources/member_profile/${memberLogged.memberReImg}'>";
	 	   			//null일때 처리
	 	       		html+="</div>";
	 	       		html+="<div class='media-body'>";
	 	       		html+="<div class='media-heading row' style='margin-right: 0px;margin-left: 0px; font-size: 13pt;'><div class='col-xs-3'>"+data.dealreview_value.deal_review_writer+"</div>";
					html+="<div class='col-xs-9' style='text-align: right;'><fmt:formatDate value='${currTime}' pattern='yyyy-MM-dd HH:mm:ss'/>";
	 	       		html+="</div>";
	 	       		html+="</div>";
	 	       		html+="<div class='review_content'>";
	 	       		html+="<p>";
	 	       		html+=""+data.dealreview_value.deal_review_content+"";
	 	       		html+="</p>";
	 	       		html+="<div class='result-btn-positon'>";
					if("${memberLoggedIn.memberPk}"==data.dealreview_value.member_pk){
	 	       		html+="<button class='btn btn-light basic-btn btn-update' type='button' onclick='''>수정</button>";
	 	       		html+=" <button class='btn btn-light basic-btn btn-delete reply2-del-btn' type='button' value='"+data.dealreview_value.deal_review_pk+"'>삭제</button>";
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
      	 });	
});
}

           </script>
							<br><br><br><br><br>
							</div>
						
							<div class="col-sm-1"></div>
							
    	
	</div>

</div>




















<jsp:include page="/WEB-INF/views/common/footer.jsp" />