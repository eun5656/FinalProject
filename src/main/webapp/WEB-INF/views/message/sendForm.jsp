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
			<h2>쪽지쓰기</h2>
		</div>
		<div class="container">
			<div class="panel">
				<form class="form-horizontal" action="#" method="post">
					<div class="form-group">
						<label class="col-sm-3 control-label" for="">보내는사람 </label>
						<div class="col-sm-6">
							<input class="form-control" type="text" placeholder="아이디">
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-3 control-label" for="">받는사람</label>
						<div class="col-sm-6">
							<input class="form-control" type="text" placeholder="아이디">
						</div>
					</div>
					
					<div class="form-group">
						<label for="" class="col-sm-3 control-label">내 용 </label>
						<div class="col-sm-6">
							<textarea class="form-control" rows="13" style="resize: none;"></textarea>
						</div>
					</div>
				
					<div class="form-group">
						<button type="submit" class="btn btn-default center-block">보내기</button>
					</div>
				</form>

			</div>
		</div>
	</div>

</section>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />