<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var='path' value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value=" " name="pageTitle" />
</jsp:include>
<section>	
	<div class='container'>
		<div class='panel'>
			<ul class="nav nav-tabs">
				<li class="active" role="presentation"><a href="${path}/message/receiveMessage.do?send_user=${memberLoggedIn.member_id}">보낸쪽지함</a></li>
          		<li role="presentation"><a href="${path}/message/receiveMessage2.do?receive_user=${memberLoggedIn.member_id}">받은쪽지함</a></li>
        	</ul>
        	<div class='panel-body'>
				<div class="page-header">
					<h2>보낸 쪽지함</h2>
				</div>
				<table class="table table-condensed table-hover">
					
						<tr>
							<th></th>
							<th>번호</th>
							<th>받는이</th>
							<th>쪽지내용</th>
							<th>날짜</th>
							<th>읽음여부</th>
						</tr>
				
				
					<c:forEach  var='m' items='${messageList}' varStatus="vs">
						<tr>
							<td><input type="checkbox"><a href="#"><i class="icon-star-empty"></i></a></td>
							<td>${vs.count}</td>
							<td>${m.receive_user }</td>
							<td>${m.send_content }</td>
							<td>${m.send_date}</td>
							<th>${m.send_read_check}</th>
						</tr>
					</c:forEach>
				
				</table>
			</div>	
		</div>
	</div>

</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />