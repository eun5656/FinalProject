<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="ErrorPage" name="pageTitle"/>
</jsp:include>

<div id="error-container">
	<h1>Error</h1>
	<h2 style="color:red;"><%=exception.getMessage() %></h2>
	<a href="${pageContext.request.contextPath }">첫화면으로 돌아가기</a>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>