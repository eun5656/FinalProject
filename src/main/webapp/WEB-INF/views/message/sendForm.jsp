<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var='path' value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value=" " name="pageTitle" />
</jsp:include>

<style>
.guide{
display: none;
}
</style>

<section>
	<div class='container'>
		<div class="page-header">
			<h2>쪽지쓰기</h2>
		</div>
		<div class="container">
			<div class="panel">
				<form class="form-horizontal" action="${path}/message/sendMessageEnd.do?sendUser=${memberLoggedIn.member_id}" method="post">
					<div class="form-group">
						<label class="col-sm-3 control-label" for="">보내는사람 </label>
						<div class="col-sm-6">
							<input class="form-control" type="text" id="send_user" name="send_user" placeholder="아이디" value="${memberLoggedIn.member_id}" readonly>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-3 control-label" for="">받는사람</label>
						<div class="col-sm-6">
							<input class="form-control" type="text" id="receive_user" name="receive_user" placeholder="아이디">
							<span class="guide ok">이 아이디는 사용가능합니다.</span>
							<span class="guide error">존재하지 않는 아이디입니다.</span>
							<input type="hidden" name="idDuplicateCheck" id='idDuplicateCheck' value=0/>
							
						</div>
					</div>
					
					<div class="form-group">
						<label for="" class="col-sm-3 control-label">내 용 </label>
						<div class="col-sm-6">
							<textarea class="form-control" id="send_content" name="send_content" rows="13" style="resize: none;"></textarea>
						</div>
					</div>
				
					<div class="form-group">
						<button type="submit" id="sendBtn" name="sendBtn" class="btn btn-default center-block" onclick="return fn_submit();">보내기</button>
					</div>
				</form>
				
				<script>	
				//내용무조건입력
				function fn_submit() {
						var receive_user = $("#receive_user").val();
						var send_content = $("#send_content").val();
						

						receive_user = $.trim(receive_user);
						send_content = $.trim(send_content);

						if (receive_user.length == 0 || receive_user == null) {
							alert("받는사람을 입력하세요")
							$("#receive_user").focus();
							return false;
						}
						
	
						if (send_content.length == 0 || send_content == null) {
							alert("내용을 입력하세요");
							$("#send_content").focus();
							return false;
						}
						return true;
					}
				
				$(function(){
					$('#receive_user').on('keyup',function(){
			
						$.ajax({
							url:"${pageContext.request.contextPath}/member/checkId.do",
							data:{receive_user:$(this).val()},
							dataType:"json",
							success:function(data)
							{
								
								if(data.check==true)
								{
									$('.guide.ok').hide();
									$('.guide.error').show();
									$('#idDuplicateCheck').val(0);
									
								}
								else
								{
									$('.guide.error').hide();
									$('.guide.ok').show();
									$('#idDuplicateCheck').val(1);
									
								}
							},
							error:function(jpxhr, textStatus,errormsg)
							{
								console.log("ajax전송실패");
								console.log(jpxhr);
								console.log(textStatus);
								console.log(errormsg);
							}
							
						});
					});
				});
				</script>

			</div>
		</div>
	</div>

</section>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />