<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
<c:set var='path' value="${pageContext.request.contextPath}"/>  
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value=" " name="pageTitle"/>
</jsp:include>
<section>
    <div class='container'>
      <div class="panel">

        <ul class="nav nav-tabs">
          <li role="presentation"><a href="${path}/mypage/mypage.do">예약현황</a></li>
          <li role="presentation"><a href="${path}/mypage/mypageBookmark.do">즐겨찾기</a></li>
          <li role="presentation"><a href="${path}/mypage/mypageQNA.do">1대1문의</a></li>
          <li role="presentation"><a href="${path}/mypage/mypageQNAList.do">문의내역</a></li>
          <li class="active" role="presentation"><a href="${path}/mypage/mypageMessage.do">쪽지내역</a></li>
          <li class="presentation"><a href="${path}/mypage/mypageChange.do">회원정보수정</a></li>
          <li role="presentation"><a href="${path}/mypage/mypageDelete.do">탈퇴</a></li>
        </ul>

        <div class="panel-body">
          <div class="page-header">
            <h2>쪽지함</h2>
          </div>
          <table class="table table-condensed table-hover">
  <thead>
    <tr>
      <th class="span1"><input type="checkbox"></th>
      <th class="span2"></th>
      <th class="span2"></th>
      <th class="span9"></th>
      <th class="span2"></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><input type="checkbox"> <a href="#"><i class="icon-star-empty"></i></a></td>
      <td><strong>John Doe</strong></td>
      <td><span class="label pull-right">Notifications</span></td>
      <td><strong>Message body goes here</strong></td>
      <td><strong>11:23 PM</strong></td>
    </tr>
    <tr>
      <td><input type="checkbox"> <a href="#"><i class="icon-star-empty"></i></a></td>
      <td>John Doe</td>
      <td><span class="label pull-right">Notifications</span></td>
      <td>Message body goes here</td>
      <td>Sept4</td>
    </tr>
    <tr>
      <td><input type="checkbox"> <a href="#"><i class="icon-star"></i></a></td>
      <td><strong>John Doe</strong></td>
      <td><span class="label pull-right">Notifications</span></td>
      <td><strong>Message body goes here</strong></td>
      <td><strong>Sept3</strong></td>
    </tr>
    <tr>
      <td><input type="checkbox"> <a href="#"><i class="icon-star"></i></a></td>
      <td><strong>John Doe</strong></td>
      <td><span class="label pull-right">Notifications</span></td>
      <td><strong>Message body goes here</strong></td>
      <td><strong>Sept3</strong></td>
    </tr>
  </tbody>
</table>

        </div>
      </div>
    </div>
  </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>