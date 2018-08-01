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
		<div class="page-header">
			<h2>쪽지함</h2>
		</div>
		
		<table class="table table-condensed table-hover">
			<thead>
				<tr>
					<th></th>
					<th>번호</th>
					<th>보낸이</th>
					<th>쪽지내용</th>
					<th>날짜</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input type="checkbox"><a href="#"><i class="icon-star-empty"></i></a></td>
					<td><strong>번호</strong></td>
					<td><strong>John Doe</strong></td>
					<td><strong>Message body goes here</strong></td>
					<td><strong>11:23 PM</strong></td>
				</tr>
				
			</tbody>
		</table>
	</div>

</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />