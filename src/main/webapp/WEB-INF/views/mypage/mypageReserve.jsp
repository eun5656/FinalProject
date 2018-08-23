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
		<div class="panel-heading">
        <ul class="nav nav-tabs">
          <li class="active" role="presentation"><a href="${path}/mypage/mypage.do?memberPk=${memberLoggedIn.memberPk}">예약현황</a></li>
          <li role="presentation"><a href="${path}/mypage/mypageBookmark.do?member_pk=${memberLoggedIn.memberPk}">즐겨찾기</a></li>
          <li role="presentation"><a href="${path}/mypage/mypageQNAList.do?member_pk=${memberLoggedIn.memberPk}">문의내역</a></li>
          <li role="presentation"><a href="${path}/mypage/mypageUpdate.do">회원정보수정</a></li>
		  <li role="presentation"><a href="${path}/mypage/mypagePwchange.do">비밀번호변경</a></li>
          <li role="presentation"><a href="${path}/mypage/mypageDelete.do">탈퇴</a></li>
        </ul>
		</div>
        <div class="panel-body">
          <div class="page-header">
            <h2>예약현황</h2>
          </div>
          
      <div class="row">
          <div class="col-sm-12 col-md-10 col-md-offset-1">
              <table class="table table-hover">
                  <thead>
                      <tr>
                          <th>네일샵</th>
                          <th class="text-center">예약날짜</th>
                          <th class="text-center">예약상태</th>
                          <th class="text-center">전화번호</th>
                          <th> </th>
                      </tr>
                  </thead>
                  <tbody>
                  <c:forEach  var='m' items='${list}' varStatus="vs">
                      <tr>
                          <td class="col-sm-6 col-md-6">
                          <div class="media">
                              <a class="thumbnail pull-left" href="#"> <img class="media-object" src="${path}/resources/images/${m.store_re_img}" style="width: 72px; height: 72px;"> </a>
                              <div class="media-body">
                                  <h4 class="media-heading"><a href="#">${m.store_name}</a></h4>
                              </div>
                          </div>
                          </td>
                          <td class="col-sm-2 col-md-2" style="text-align: center">
                      
							   
                          <strong> <fmt:parseDate value="${m.reserve_start_time }" var="reserveDate"  pattern="yyyy-MM-dd HH:mm:ss"/>
                          			<fmt:formatDate value="${reserveDate}" pattern="yyyy-MM-dd HH:mm"/>
                          </strong>
                          </td>
                          <td class="col-sm-2 col-md-2 text-center"><strong>${m.reserve_status}</strong></td>
                          <td class="col-sm-1 col-md-1 text-center"><strong>${m.store_phone}</strong></td>
                          <td class="col-sm-1 col-md-1">
                        	<button type="button" class="btn btn-info btn-lg" onclick="fn_payment(${m.reserve_pk});" >결제 내역</button>
                          </td>
                          <script>
                          function fn_payment(m){
                        	  var reserve_pk=m;
                          
                        	  $.ajax({
                        		  type: "POST",
                                  url:"${path}/mypage/mypagePayment.do",
                                  data: {"reserve_pk":reserve_pk},
                                  success: function (data) { 
                        	  			$('#myModal').html(data);
                        	  			$("#myModal").modal('show');
                        	  			
                                  }
                        	  });
                          }
                          </script>
                        
                      </tr>
					</c:forEach>
                  </tbody>
				  		
                           <!-- Modal -->
  								<div class="modal fade" id="myModal" role="dialog">
   								
  								</div>
              </table>
              <div class="row1 text-center" id="paging">${pageBar}</div>
          </div>
      </div>
 

        </div>
      </div>
    </div>
  </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>