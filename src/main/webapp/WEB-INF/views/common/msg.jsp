<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<c:set var='path' value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>알림</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	if ("${member_pk}" > 0) {
		location.href = "${path}/${loc}?member_pk=${member_pk}";
	} else {
		location.href = "${path}/${loc}";
	}
	alert('${msg}');
</script>
</head>
<body>
</body>
</html>