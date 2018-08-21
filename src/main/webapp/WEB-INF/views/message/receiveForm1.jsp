<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var='path' value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value=" " name="pageTitle" />
</jsp:include>

<script>
function fn_refuse(value){
	
	 $.ajax({
		url:"${pageContext.request.contextPath}/message/deleteMessage.do",
		dataType:"json",
		data:{message_pk:value},
	
		success :function(data)
		{
			if(data.result==1)
			{
				alert("삭제완료");
			    location.reload();
				
			}
			else
			{
				
				alert("삭제못함");
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
	
	
	
}
</script>

<section style="padding-top: 100px;">	
	<div class='container'>
		<div class='panel'>
			<ul class="nav nav-tabs">
				<li class="active" role="presentation"><a href="${path}/message/receiveMessage.do?send_user=${memberLoggedIn.memberId}">보낸쪽지함</a></li>
          		<li role="presentation"><a href="${path}/message/receiveMessage2.do?receive_user=${memberLoggedIn.memberId}">받은쪽지함</a></li>
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
							<th><a href="${path}/message/receiveContent.do?send_user=${memberLoggedIn.memberId}">쪽지내용</th>
							<th>날짜</th>
							<th>읽음여부</th>
							<th>삭제</th>
						</tr>
				
				
					<c:forEach  var='m' items='${messageList}' varStatus="vs">
						<tr>
							<td></td>
							<td>${vs.count}</td>
							<td>${m.receive_user }</td>
							<td>${m.send_content }</td>
							<td>${m.send_date}</td>
							<td>${m.send_read_check}</td>
							<td><button class="btn btn-danger" type="button" onclick="fn_refuse(${m.message_pk})" value="${m.message_pk}">삭제</i></button></td>
						</tr>
					</c:forEach>
				</table>
				
				  <div class="row1 text-center" id="paging">
        ${pageBar}
      </div>
     
			</div>	
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />