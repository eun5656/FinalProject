<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
  <c:set var='path' value="${pageContext.request.contextPath}"/>
  <%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE >
<html>
<head>
  <title>메인화면</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link href="js/index.js">

  <link href="${path }/resources/css/navbar.css" rel="stylesheet">
  <link href="${path }/resources/css/carousel.css" rel="stylesheet">
  <link href="${path }/resources/css/smallcarousel.css" rel="stylesheet">
  <link href="${path }/resources/css/footer.css" rel="stylesheet">
  <link href="${path }/resources/css/naillist.css" rel="stylesheet">

  <style>


  </style>

</head>

<body>

  <header>
    <nav class="navbar navbar-icon-top navbar-default navbar-fixed-top">



      <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
          <a class="navbar-brand" href="${path}">로고~~</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav">
            <li class="active"><a href="${path}">Home <span class="sr-only">(current)</span></a></li>
            <!--active사용시 home하얀색으로 변함-->
            <li><a href="${path}/intro/intro.do">Introduce</a></li>
            <li><a href="${path}/shop/shop.do">Shop</a></li>
            <li><a href="${path}/market/market.do">Market</a></li>


          </ul>



                 </ul>

                 <ul class="nav navbar-nav">
                   <li class="dropdown">
                     <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                       <!--<i class="fa fa-user-circle-o"></i>-->
                    ServiceCenter
                     </a>
                     <ul class="dropdown-menu" style="border-radius:3px; border-color:white">
                       <li><a href="${path}/customer/notice.do">공지사항</a></li>
                       <li><a href="${path}/customer/faq.do">자주묻는질문</a></li>

                     </ul>
                   </li>
                 </ul>

          <form class="navbar-form navbar-left">
            <div class="form-group">
              <input type="text" class="form-control" placeholder="Search">
            </div>
            <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search w3-spin"></span></button>
          </form>
          <ul class="nav navbar-nav navbar-right">
            <li>
              <a href="#">
                            <i class="fa fa-envelope-o">
                                <span class="badge badge-danger">11</span>
                            </i>
                            Messages
                        </a>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                <!--<i class="fa fa-user-circle-o"></i>-->
                <img class="img-circle" src="${path }/resources/images/image-7.jpg" alt="" style="width:50px; height:50px;">
                <span class="caret"></span>
              </a>
              <ul class="dropdown-menu" style="border-radius:3px; border-color:white">
                <li><a href="${path}/member/memberLogin.do">로그인</a></li>
                <li><a href="${path}/member/memberJoin.do">회원가입</a></li>
                <li><a href="${path}/mypage/mypage.do">마이페이지</a></li>
              </ul>
            </li>
          </ul>
        </div>
        <!-- /.navbar-collapse -->
      </div>
      <!-- /.container-fluid -->
    </nav>
    <br/>
    <br/>
    <br/>
    <br/>
    
  
  </header>
	