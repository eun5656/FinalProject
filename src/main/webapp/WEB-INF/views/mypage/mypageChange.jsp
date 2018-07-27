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
          <li class="presentation"><a href="${path}/mypage/mypage.do">예약현황</a></li>
          <li role="presentation"><a href="${path}/mypage/mypageBookmark.do">즐겨찾기</a></li>
          <li role="presentation"><a href="${path}/mypage/mypageQNA.do">1대1문의</a></li>
          <li role="presentation"><a href="${path}/mypage/mypageQNAList.do">문의내역</a></li>
          <li role="presentation"><a href="${path}/mypage/mypageMessage.do">쪽지내역</a></li>
          <li class="active" role="presentation"><a href="${path}/mypage/mypageChange.do">회원정보수정</a></li>
          <li role="presentation"><a href="${path}/mypage/mypageDelete.do">탈퇴</a></li>
        </ul>

        <div class="panel-body">
          <div class="page-header">
            <h2> 회원 정보 수정</h2>
          </div>
          <form class="form-horizontal">

            <div class="form-group">
              <label class="col-sm-3 control-label" for="inputId">아이디</label>
              <div class="col-sm-6">
                <input class="form-control" id="userId" type="text" placeholder="아이디">
              </div>
            </div>


            <div class="form-group">
              <label class="col-sm-3 control-label" for="inputPassword"> 현재 비밀번호</label>
              <div class="col-sm-6">
                <input class="form-control" id="inputPassword" type="password" placeholder="비밀번호">

              </div>
            </div>

            <div class="form-group">
              <label class="col-sm-3 control-label" for="inputPassword"> 새로운 비밀번호</label>
              <div class="col-sm-6">
                <input class="form-control" id="inputPassword" type="password" placeholder="비밀번호">
                <p class="help-block">숫자, 특수문자 포함 8자 이상</p>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-3 control-label" for="inputPasswordCheck">비밀번호 확인</label>
              <div class="col-sm-6">
                <input class="form-control" id="inputPasswordCheck" type="password" placeholder="비밀번호 확인">
                <p class="help-block"> 새로운 비밀번호를 한번 더 입력해주세요.</p>
              </div>
            </div>

            <div class="form-group">
              <label class="col-sm-3 control-label" for="inputName">이름</label>
              <div class="col-sm-6">
                <input class="form-control" id="inputName" type="text" placeholder="이름">
              </div>
            </div>


            <div class="form-group">
              <label class="col-sm-3 control-label" for="">이메일</label>
              <div class="col-sm-6">

                <input type="email" class="form-control" placeholder="이메일을 입력해 주세요" />

              </div>
            </div>

            <div class="form-group">
              <label class="col-sm-3 control-label" for="inputNumber">휴대폰번호</label>
              <div class="col-sm-6">
                <input class="form-control" id="inputNumber" type="text" placeholder="- 없이 입력해 주세요">
              </div>
            </div>

            <div class="form-group">
              <div class="col-sm-12 text-center">
                <button class="btn btn-primary" type="submit">수정 완료<i class="fa fa-check spaceLeft"></i></button>
                <button class="btn btn-danger" type="reset">취소<i class="fa fa-times spaceLeft"></i></button>
              </div>
            </div>


          </form>

        </div>
      </div>
    </div>
  </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>