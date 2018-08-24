<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이메일 인증</title>
</head>
<script>
	function check() {
		var form = document.authenform;
		var eMailNum = ${ra};

		if (!form.authNum.value) {
			alert("인증번호를 입력하세요.");
		
		}
		if (form.authNum.value != eMailNum) {
			alert("틀린 인증번호입니다. 인증번호를 다시입력해주세요.");
			form.authnum.value = "";
			
		}
		if (form.authNum.value == eMailNum) {
			alert("인증완료");
			checkEm=true;
			
			console.log("과연"+checkEm);
			$("#myModal").modal('hide');
			
		}
	}
</script>

<div class="modal-dialog">
    
      						
     								 <div class="modal-content">
       									 <div class="modal-header">
        									  <button type="button" class="close" data-dismiss="modal">&times;</button>
          										<h4 class="modal-title">이메일 인증</h4>
        							</div>
        							<div class="modal-body">
          								<form method="post" name="authenform" >
											<input type="text" name="authNum">
											<input type="button" class="btn btn-danger" onclick="return check();" value="인증">
										</form>
       								 </div>
       						
   										 </div> 



</html>