<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.spring.store.model.vo.Store"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	Store store = (Store) request.getAttribute("store");
%>
<!-- 해더부분 -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="NailStore" name="pageTitle" />
</jsp:include>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!-- storeManage css -->
<link href="${path }/resources/css/storeManage.css?ver=7"
	rel="stylesheet" />
<script type="text/javascript">
// 외부 js 에서 쓰이는 변수 setting
var path = "${pageContext.request.contextPath }";
var store_pk="${store.store_pk}"
</script>
<!-- storeManage js -->
<script src="${path }/resources/js/storeManage.js?ver=3"></script>

	<div id="wrapper">

<div id="left-side">
			<div id="second" class="active">
				
    <div class='container'>
      <div class="panel">
		
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
                          <td class="col-sm-1 col-md-1" style="text-align: center">
                          <strong>${m.reserve_start_time }</strong>
                          </td>
                          <td class="col-sm-2 col-md-2 text-center"><strong>${m.reserve_status}</strong></td>
                          <td class="col-sm-1 col-md-1 text-center"><strong>${m.store_phone}</strong></td>
                      
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
  
<!-- 				추가하는 부분 -->
				
				
				
				
				
			</div>

</div>


<div id="right-side">
<div id="border">
	<div id="line" class="two" style="position:fixed;"></div>
</div>
	<div style="position: fixed;">
		<ul>
			<li class="shop">
				<div class="icon">
					<img src="${path }/resources/icons/shop.svg" alt="">
				</div> Shop
			</li>
			<li class="sales active">
				<div class="icon active">
					<img src="${path }/resources/icons/paper.svg" alt="">
				</div> 예약 리스트
			</li>
			<li class="reserve">
				<div class="icon">
					<img src="${path }/resources/icons/calander.svg" alt="">
				</div> Reserve(예약)
			</li>
			<li class="qna">
				<div class="icon">
					<img src="${path }/resources/icons/customer.svg" alt="">
				</div> QnA(문의)
			</li>
		</ul>
	</div>
</div>
</div>
<!-- wrapper 끝 -->





<!-- 푸터부분 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
