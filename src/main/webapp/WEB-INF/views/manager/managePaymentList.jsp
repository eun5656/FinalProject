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
          			<li role="presentation"><a href="${path}/manager/manageList.do">점포 관리</a></li>
          			<li class="active" role="presentation"><a href="${path}/manager/managePayment.do">결제 내역 관리</a></li>
          			
        		</ul>
			
			</div>
			<div class="panel-body">
			
		
		<div class="page-header">
			<h2>결제 내역 관리</h2>
		</div>
		
		<table class="table table-condensed table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>결제 고유 번호</th>
					<th>결제자</th>
					<th>결제금액</th>
					<th>결제 상태</th>
					
				</tr>
			</thead>
			<tbody>
			
			<c:if test="${not empty list }">
							<c:forEach var='payment' items='${list}' varStatus="vs">
			
				<tr>
					<td><strong>${payment.payment_pk }</strong></td>
					<td><strong>${payment.payment_num }</strong></td>
					<td><strong>${payment.member_name }</strong></td>
					<td><strong>${payment.payment_price }</strong></td>
					<td><strong>${payment.payment_check }</strong></td>
					<td>
					<c:if test="${payment.payment_check eq '결제 취소 요청' }">
					<button type="button" class="btn btn-info btn-sm" onclick="fn_payment(${payment.payment_pk },${payment.reserve_pk });" >취소 승인</button>
					</c:if>
					</td>
				</tr>
					<script>
		function fn_payment(m,p){
			alert(m);
			var payment_pk=m;
			var reserve_pk=p;
			
			var check=confirm("결제 취소를 승인합니다.");
			
			if(check){
				location.href='${path}/manager/managePaymentUpdate.do?payment_pk='+payment_pk+"&reserve_pk="+reserve_pk;
			}
			
			
		}
	</script>

					
				
				
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