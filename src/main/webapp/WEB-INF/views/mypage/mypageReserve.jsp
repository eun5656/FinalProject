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
          <li class="active" role="presentation"><a href="${path}/mypage/mypage.do">예약현황</a></li>
          <li role="presentation"><a href="${path}/mypage/mypageBookmark.do">즐겨찾기</a></li>
          <li role="presentation"><a href="${path}/mypage/mypageQNAList.do?member_pk=${memberLoggedIn.member_pk}">문의내역</a></li>
          <li class="presentation"><a href="${path}/mypage/mypageChange.do">회원정보수정</a></li>
          <li role="presentation"><a href="${path}/mypage/mypageDelete.do">탈퇴</a></li>
        </ul>

        <div class="panel-body">
          <div class="page-header">
            <h2>예약현황</h2>
          </div>
          <div class="container">
      <div class="row">
          <div class="col-sm-12 col-md-10 col-md-offset-1">
              <table class="table table-hover">
                  <thead>
                      <tr>
                          <th>네일샵</th>
                          <th>예약날짜</th>
                          <th class="text-center">예약상태</th>
                          <th class="text-center">전화번호</th>
                          <th> </th>
                      </tr>
                  </thead>
                  <tbody>
                      <tr>
                          <td class="col-sm-8 col-md-6">
                          <div class="media">
                              <a class="thumbnail pull-left" href="#"> <img class="media-object" src="http://icons.iconarchive.com/icons/custom-icon-design/flatastic-2/72/product-icon.png" style="width: 72px; height: 72px;"> </a>
                              <div class="media-body">
                                  <h4 class="media-heading"><a href="#">nailshop name</a></h4>
                              </div>
                          </div></td>
                          <td class="col-sm-1 col-md-1" style="text-align: center">
                          <strong>날짜</strong>
                          </td>
                          <td class="col-sm-1 col-md-1 text-center"><strong>완료</strong></td>
                          <td class="col-sm-1 col-md-1 text-center"><strong>02586945987</strong></td>
                          <td class="col-sm-1 col-md-1">
                          <button type="button" class="btn btn-danger">
                              <span class="glyphicon glyphicon-remove"></span> 예약취소
                          </button></td>
                      </tr>

                  </tbody>

              </table>
          </div>
      </div>
  </div>

        </div>
      </div>
    </div>
  </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>