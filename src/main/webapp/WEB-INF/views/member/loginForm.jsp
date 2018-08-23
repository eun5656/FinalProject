	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var='path' value="${pageContext.request.contextPath}" />

<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<link rel="stylesheet" type="text/css" href="${path }/resources/css/util.css">
<link rel="stylesheet" type="text/css" href="${path }/resources/css/main.css">
<link rel="icon" type="image/png" href="${path }/resources/images/icons/favicon.ico" />
<link rel="stylesheet" type="text/css" href="${path }/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="${path }/resources/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<link rel="stylesheet" type="text/css" href="${path }/resources/vendor/animate/animate.css">
<link rel="stylesheet" type="text/css" href="${path }/resources/vendor/css-hamburgers/hamburgers.min.css">
<link rel="stylesheet" type="text/css" href="${path }/resources/vendor/animsition/css/animsition.min.css">
<link rel="stylesheet" type="text/css" href="${path }/resources/vendor/select2/select2.min.css">
<link rel="stylesheet" type="text/css" href="${path }/resources/vendor/daterangepicker/daterangepicker.css">

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="로그인" name="pageTitle" />
</jsp:include>


<div class="limiter">
	<div class="container-login100">
		<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-50" style=" margin-top: 40px;">
			<form class="login100-form validate-form" method="post" action="${path }/member/Login.do">
				<span class="login100-form-title p-b-33">로그인</span>
				<div class="wrap-input100 validate-input">
					<input class="input100" type="text" name="memberId" placeholder="ID" />
					<span class="focus-input100-1"></span>
					<span class="focus-input100-2"></span>
				</div>
				<div class="wrap-input100 rs1 validate-input" data-validate="Password is required">
					<input class="input100" type="password" name="memberPw" placeholder="Password" />
					<span class="focus-input100-1"></span>
					<span class="focus-input100-2"></span>
				</div>
				<br>
				<div class="container-login100-form-btn m-t-20">
					<button class="login100-form-btn" type="submit">로그인</button>
					
				</div>
				<div class="container-login100-form-btn m-t-20">
					<a href="#" data-target="#idModal" data-toggle="modal">아이디찾기/</a>
					<a href="#" data-target="#pwdModal" data-toggle="modal">비밀번호찾기</a>
				</div>
				
			</form>
		</div>
	</div>
</div>

<!--modal-->
<div id="idModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
  <div class="modal-content">
      <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
          <h1 class="text-center">아이디찾기</h1>
      </div>
      <div class="modal-body">
          <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="text-center">
                          
                            <div class="panel-body">
                               	<form action="${path }/member/findId.do" method="post">
                               	 	<div class="form-group">
                                        <input class="form-control input-lg" placeholder="E-mail Address" name="memberEmail" type="email">
                                    </div>
                                    <input class="login100-form-btn" value="Send My ID" type="submit">
                               	</form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
      </div>
      <div class="modal-footer">
          <div class="col-md-12">
          <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
		  </div>	
      </div>
  </div>
  </div>
</div>

<!--modal-->
<div id="pwdModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
  <div class="modal-content">
      <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
          <h1 class="text-center">비밀번호찾기</h1>
      </div>
      <div class="modal-body">
          <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="text-center">
                          
                            <div class="panel-body">
                               	<form action="${path }/member/findPw.do" method="post">
                               	 	<div class="form-group">
                                        <input class="form-control input-lg" placeholder="E-mail Address" name="memberEmail" type="email">
                                    </div>
                                    <input class="login100-form-btn" value="Send My Password" type="submit">
                               	</form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
      </div>
      <div class="modal-footer">
          <div class="col-md-12">
          <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
		  </div>	
      </div>
  </div>
  </div>
</div>

<style>
.guide{
display: none;
}
</style>


<script src="${path }/resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<script src="${path }/resources/vendor/animsition/js/animsition.min.js"></script>
<script src="${path }/resources/vendor/bootstrap/js/popper.js"></script>
<script src="${path }/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="${path }/resources/vendor/select2/select2.min.js"></script>
<script src="${path }/resources/vendor/daterangepicker/moment.min.js"></script>
<script src="${path }/resources/vendor/daterangepicker/daterangepicker.js"></script>
<script src="${path }/resources/vendor/countdowntime/countdowntime.js"></script>
<script src="${path }/resources/js/main.js"></script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />