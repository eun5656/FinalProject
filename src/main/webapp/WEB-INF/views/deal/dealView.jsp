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
	.container{
		margin-top:50px;
		margin-bottom:50px;
	}
</style>


	<div class="container center-block">
		<div class="col-xs-1"></div>
		<div class="col-xs-10">
		
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3>${deal.getDealTitle() }</h3>
			</div>
			<div class="panel-body">
				${deal.dealContent }
			</div>
		
			
		</div>	
		  <div class="row text-right">
		  	
          <div class="btn-group">
 			<button type="button" class="btn btn-primary" onclick="location.href='${path}/deal/dealList.do'">목록</button>
  			<button type="button" class="btn btn-primary" onclick="location.href='${path}/deal/dealUpdate.do?dealPk=${deal.dealPk}'">수정</button>
  			<button type="button" class="btn btn-primary" onclick='fn_delete()'>삭제</button>
  				<script>
  				function fn_delete(){
  					var check=confirm("거래글을 삭제하시겠습니까?");
  					if(check==true){
  						location.href='${path}/deal/dealDelete.do?dealPk=${deal.dealPk}';
  					}
  				}
  			</script>
  		
		</div>
     	 </div>
    	</div>
    	<div class="col-xs-1"></div>
	</div>






















<jsp:include page="/WEB-INF/views/common/footer.jsp" />