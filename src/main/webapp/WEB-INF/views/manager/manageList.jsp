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
		margin-top:100px;
	}
	.table{
		text-align:center;
	}
	th{
		text-align:center;
	}
</style>

<section>
	<div class='container'>
		<div class="panel">
			<div class="panel-heading">
			  <ul class="nav nav-tabs">
          			<li class="active" role="presentation"><a href="${path}/manager/manageList.do">점포 관리</a></li>
          			<li role="presentation"><a href="${path}/manager/managePayment.do">결제 내역 관리</a></li>
          			
        		</ul>
			
			</div>
			<div class="panel-body">
			
		
		<div class="page-header">
			<h2>점포 관리</h2>
		</div>
		
		<table class="table table-condensed table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>점포명</th>
					<th>사업자 번호</th>
					<th>전화 번호</th>
					
				</tr>
			</thead>
			<tbody>
			
			<c:if test="${not empty list }">
							<c:forEach var='store' items='${list}' varStatus="vs">
			
				<tr>
					<td><strong><a href="${path }/manage/storeManager.do?store_pk=${store.store_pk}">${vs.count }</a></strong></td>
					<td><strong><a href="${path }/manage/storeManager.do?store_pk=${store.store_pk}">${store.store_name}</a> </strong></td>
					<td><strong><a href="${path }/manage/storeManager.do?store_pk=${store.store_pk}">${store.store_num}</a></strong></td>
					<td><strong><a href="${path }/manage/storeManager.do?store_pk=${store.store_pk}">${store.store_phone}</a></strong></td>
				</tr>
			</c:forEach>
			</c:if>
						
			</tbody>
		</table>
		
		<div class="row text-center" id="paging">
        ${pageBar}
     	 </div>
    	</div>
		</div> 	 
    
	</div>

</section>













<jsp:include page="/WEB-INF/views/common/footer.jsp" />