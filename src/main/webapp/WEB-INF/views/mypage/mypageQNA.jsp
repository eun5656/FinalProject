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
          <li class="active" role="presentation"><a href="${path}/mypage/mypageQNA.do">1대1문의</a></li>
          <li role="presentation"><a href="${path}/mypage/mypageQNAList.do">문의내역</a></li>
          <li role="presentation"><a href="${path}/mypage/mypageMessage.do">쪽지내역</a></li>
          <li class="presentation"><a href="${path}/mypage/mypageChange.do">회원정보수정</a></li>
          <li role="presentation"><a href="${path}/mypage/mypageDelete.do">탈퇴</a></li>
        </ul>

        <div class="panel-body">
          <div class="page-header">
            <h2>1대1문의</h2>
          </div>
          <div class="container">
                  <div class="panel">

                    <form class="form-horizontal">

                            <div class="form-group">
                              <label class="col-sm-3 control-label" for="">아이디 </label>
                            <div class="col-sm-6">
                              <input class="form-control" type="text" placeholder="아이디">
                            </div>
                            </div>


                          <div class="form-group">
                                <label class="col-sm-3 control-label" for="">제목 </label>
                              <div class="col-sm-6">
                                <input class="form-control" type="text" placeholder="제목을 입력하세요.">
                              </div>
                            </div>

                            <div class="form-group">
                                <label for="" class="col-sm-3 control-label">내 용 </label>
                                <div class="col-sm-6">
                                        <textarea class="form-control" rows="13" style="resize: none;"></textarea>
                                </div>

                            </div>
                            <div class="form-group">

                  </div>

                            <div class="form-group">
                                <button type="submit" class="btn btn-default center-block">제출하기</button>
                            </div>

                    </form>

                              </div>
                      </div>



          </div>

        </div>
      </div>
    </div>
  </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>