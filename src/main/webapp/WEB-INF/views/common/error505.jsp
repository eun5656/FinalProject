<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
  <c:set var='path' value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="ErrorPage" name="pageTitle" />
</jsp:include>


<style media="screen">
body {
	background-image: url("../images/.jpg");
	background-color: white;
	background-attachment: scroll;
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
	line-height: 5px;
}

.display-1 {
	text-align: center;
	color: #e1b7b7;
}

.display-1 .fa {
	animation: fa-spin 5s infinite linear;
}

.display-3 {
	text-align: center;
	color: #df726a;
}

.lower-case {
	text-align: center;
}
.jumbotron{
padding-top:100px;
padding-bottom:100px;
background: rgba(237, 88, 149, 0.1) !important;
}
</style>




<div id="error-container">
	<!---- for body container ---->

	<div class="jumbotron">
	<br>
		<h1 class="display-1">
			5<i class="fa  fa-spin fa-cog fa-3x"></i>5
		</h1>
		<h1 class="display-3">ERROR</h1>
		<p class="lower-case">Aw !! webpage not found please try to
			refresh</p>
		<p class="lower-case">Maybe the page is under maintenance</p><br>
		<p class="lower-case"><a href="${path}">Go Home</a></p>

	</div>

	<!-------mother container middle class------------------->


	<!--<h1>Error</h1>
	<h2 style="color:red;"></h2>
	<a href="${pageContext.request.contextPath }">첫화면으로 돌아가기</a>-->
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />