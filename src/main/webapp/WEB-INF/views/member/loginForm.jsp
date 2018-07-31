<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var='path' value="${pageContext.request.contextPath}" />

<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<link rel="stylesheet" type="text/css"
	href="${path }/resources/css/util.css">
<link rel="stylesheet" type="text/css"
	href="${path }/resources/css/main.css">
<link rel="icon" type="image/png"
	href="${path }/resources/images/icons/favicon.ico" />
<link rel="stylesheet" type="text/css"
	href="${path }/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="${path }/resources/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<link rel="stylesheet" type="text/css"
	href="${path }/resources/vendor/animate/animate.css">
<link rel="stylesheet" type="text/css"
	href="${path }/resources/vendor/css-hamburgers/hamburgers.min.css">
<link rel="stylesheet" type="text/css"
	href="${path }/resources/vendor/animsition/css/animsition.min.css">
<link rel="stylesheet" type="text/css"
	href="${path }/resources/vendor/select2/select2.min.css">
<link rel="stylesheet" type="text/css"
	href="${path }/resources/vendor/daterangepicker/daterangepicker.css">

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>


<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value=" " name="pageTitle" />
</jsp:include>

<div class="limiter">
	<div class="container-login100">
		<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-50">
			<form class="login100-form validate-form">
				<span class="login100-form-title p-b-33"> 로그인 </span>

				<div class="wrap-input100 validate-input"
					data-validate="Valid email is required: ex@abc.xyz">
					<input class="input100" type="text" name="email" placeholder="ID">
					<span class="focus-input100-1"></span> <span
						class="focus-input100-2"></span>
				</div>

				<div class="wrap-input100 rs1 validate-input"
					data-validate="Password is required">
					<input class="input100" type="password" name="pass"
						placeholder="Password"> <span class="focus-input100-1"></span>
					<span class="focus-input100-2"></span>
				</div>
				<br>
				<div class="text-center">
					<input type="radio" name="memberLevel">사용자 <input
						type="radio" name="memberLevel">점주

				</div>
				<div class="container-login100-form-btn m-t-20">
					<button class="login100-form-btn">로그인</button>
				</div>

				<a id="custom-login-btn" href="javascript:loginWithKakao()"> <img
					src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg"
					width="300" />
				</a>
				<script type='text/javascript'>
					//<![CDATA[
					// 사용할 앱의 JavaScript 키를 설정해 주세요.
					Kakao.init('61bb522db3c5e5558c39de876bb4067f');
					function loginWithKakao() {
						// 로그인 창을 띄웁니다.
						Kakao.Auth.login({
							success : function(authObj) {
								alert(JSON.stringify(authObj));
									location.href="https://kauth.kakao.com/oauth/authorize?client_id= REST API d9017667478b08f250cdb1d058a4d03a &redirect_uri=http://localhost:9191/oauth&response_type=code";
							},
							fail : function(err) {
								alert(JSON.stringify(err));
							}
						});
					};
				</script>

				<script type="text/javascript">
					
				</script>

				<div class="text-center p-t-45 p-b-4">
					<span class="txt1"> Forgot </span> <a href="#" class="txt2 hov1">
						Username / Password? </a>
				</div>

				<div class="text-center">
					<span class="txt1"> Create an account? </span> <a href="#"
						class="txt2 hov1"> Sign up </a>
				</div>
			</form>
		</div>
	</div>
</div>



<!--===============================================================================================-->
<script src="${path }/resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="${path }/resources/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
<script src="${path }/resources/vendor/bootstrap/js/popper.js"></script>
<script src="${path }/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="${path }/resources/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
<script src="${path }/resources/vendor/daterangepicker/moment.min.js"></script>
<script
	src="${path }/resources/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
<script src="${path }/resources/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
<script src="${path }/resources/js/main.js"></script>



<jsp:include page="/WEB-INF/views/common/footer.jsp" />