<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var='path' value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value=" " name="pageTitle" />
</jsp:include>

<section style="padding-top: 100px;">	
	<div class='container'>
		<div class='panel'>
			<ul class="nav nav-tabs">
				<li role="presentation"><a href="${path}/message/receiveMessage.do?send_user=${memberLoggedIn.memberId}">보낸쪽지함</a></li>
          		<li class="active" role="presentation"><a href="${path}/message/receiveMessage2.do?receive_user=${memberLoggedIn.memberId}">받은쪽지함</a></li>
        	</ul>
        	<div class='panel-body'>
				<div class="page-header">
					<h3>받은 쪽지함 내역</h3>
				</div>
				<div class="row">
				<label for="" class="col-sm-2 control-label" >보낸사람</label>
				<div class="col-sm-3"><p>${msg.send_user}</p></div>
			</div>
			<div class="row">
				<label for="" class="col-sm-2 control-label">받은시간</label>
				<div class="col-sm-3"><p>${msg.send_date }</p></div>
			</div>	
			<hr>
			<div class="row">
				<div class="col-sm-6 text-center"><textarea class="form-control" id="send_content" name="send_content" rows="13" style="resize: none;" read only>${msg.send_content }</textarea></div>
			</div>
			<br>
			<div class="row">
				<div class="col-sm-2">
					<button type="button" class="btn btn-default">
						<a href="${path}/message/receiveMessage2.do?receive_user=${memberLoggedIn.memberId}">목록으로</a>
					</button>
				</div>
			
			<div class="row">
				<div class="col-sm-2">
					<button type="button" class="btn btn-info">
						<a href="${path}/message/sendMessage.do">답장</a>
					</button>
					
				</div>
				
			
				
				
				
			</div>
			
	
		
		
			</div>	
		</div>
	</div>
</section>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />