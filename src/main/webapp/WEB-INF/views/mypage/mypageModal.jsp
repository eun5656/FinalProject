<%@page import="com.kh.spring.reserve.model.vo.Reserve"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var='path' value="${pageContext.request.contextPath}"/>

<div class="modal-dialog">
    
      						
     								 <div class="modal-content">
       									 <div class="modal-header">
        									  <button type="button" class="close" data-dismiss="modal">&times;</button>
          										<h4 class="modal-title">결제 내역${payment.reserve_pk }</h4>
        							</div>
        							<div class="modal-body">
          								<p>결제 번호 : ${payment.payment_num }</p>
          								<br>
          								<p>결제자 : ${payment.member_name }</p>
          								<br>
          								<p>결제 상태 : ${payment.payment_check }</p>
       								 </div>
       								 <div class="modal-footer">
       								 <c:if test="${!(payment.payment_check eq '결제 취소 요청') and !(payment.payment_check eq '결제 취소 완료') }">
       								 	<button type="button" class="btn btn-default" onclick="fn_update(${payment.payment_pk});">결제 취소</button>
       								 </c:if>
          								<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        								</div>
      									</div>
      						<script>
      						function fn_update(p){      
      							
      							var check=confirm("결제 취소를 요청하시겠습니까?");
      							
      							if(check){
      								location.href='${path}/mypage/mypagePaymentUpdate.do?payment_pk=${payment.payment_pk}';
      								
      							}
      							
      						}
      						
      						
      						</script>
      						
      						
   										 </div> 