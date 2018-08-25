<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var='path' value="${pageContext.request.contextPath}"/>    
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value=" " name="pageTitle"/>
</jsp:include>

<section id='mypage' style="padding-top: 100px;">
    <div class='container'>
      <div class="panel">

        <ul class="nav nav-tabs">
          <li role="presentation"><a href="${path}/mypage/mypage.do?memberPk=${memberLoggedIn.memberPk}">예약현황</a></li>
          <li class="active" role="presentation"><a href="${path}/mypage/mypageBookmark.do?member_pk=${memberLoggedIn.memberPk}">즐겨찾기</a></li>
          <li role="presentation"><a href="${path}/mypage/mypageQNAList.do?member_pk=${memberLoggedIn.memberPk}">문의내역</a></li>
          <li role="presentation"><a href="${path}/mypage/mypageUpdate.do">회원정보수정</a></li>
		  <li role="presentation"><a href="${path}/mypage/mypagePwchange.do">비밀번호변경</a></li>
          <li role="presentation"><a href="${path}/mypage/mypageDelete.do">탈퇴</a></li>
        </ul>

        <div class="panel-body">
          <div class="page-header">
            <h2>즐겨찾기</h2>
          </div>
          <div class="container-fluid">
          <div class="container">
          
              <div class="row">
              <c:forEach  var='m' items='${list}' varStatus="vs">
              <div class="col-sm-3">
                  <div class="box">
                  <div class="imgbox">
                      <img src="${path}/resources/images/nails/${m.nail_re_img}" class="img-responsive">
                      </div>
                      <div class="content">
                          <a href="${path}/store/store.do?store_pk=${m.store_pk}" class="btn btn-default btnD">자세히</a>
                      </div>
                  </div>
                  </div>
                 
                  </c:forEach>
              </div>
              
          </div>
          </div>

        </div>
      </div>
      
    </div>
  </section>
  
  
  <style>
@import url('https://fonts.googleapis.com/css?family=Roboto+Condensed');
body
{
    margin: 0;
    padding: 0;
    font-family: 'Roboto Condensed', sans-serif;
}
section
{
    padding: 120px 0 0;
    
}
.box
{
    position: relative;
    width: 80%;
    height: 180px;
    overflow: hidden;
    border-radius: 10px;
    background: #000;
    box-shadow: 0 5px 15px rgba(0,0,0,.5);
    transition: .5s;
    margin-bottom: 35px;
}
.box:hover
{
    transform: translateY(-30px);
    box-shadow: 0 50px 50x rgba(0,0,0,.5);
}
.box .imgbox
{
    position: relative;
}
.box .imgbox img
{
    transition: .5s;
}
.box:hover .imgbox img
{
   opacity: .5;
    transform: translateY(-40px);
}
.box .content
{
    position: absolute;
    bottom: -40px;
    left: 0;
    padding: 20px;
    box-sizing: border-box;
    transition: .5s;
    opacity: 0;
    
}
.box:hover .content
{
    opacity: 1;
    bottom: 0;
}
.box .content h3
{
    font-size: 48px;
    color: #fff;
    font-weight: 700;
}
.box .content p
{
    font-size: 18px;
    color: #fff;
    font-weight: 400;
}
.box .content .btnD
{
    border: none;
    background: #ff0000;
    color: #fff;
    font-size: 18px;
    padding: 10px 20px;
    font-weight: 700;
    transition: .5s;
}
.box .content .btnD:hover
{
    background: #ff3232;
    
}
</style>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>