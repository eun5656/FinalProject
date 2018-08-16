<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<c:set var='path' value="${pageContext.request.contextPath}"/>   
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value=" " name="pageTitle"/>
</jsp:include>
<!-- <style>
  [ Table ]*/

.limiter {
  width: 100%;
  margin: 0 auto;
}

.container-table100 {
  width: 100%;
  min-height: 70vh;
  background: #ffffff;

  display: -webkit-box;
  display: -webkit-flex;
  display: -moz-box;
  display: -ms-flexbox;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-wrap: wrap;
  padding: 33px 30px;
}

.wrap-table100 {
  border:0.5px solid rgb(209, 208, 208);

  box-shadow: 10px 10px 5px rgb(175, 175, 175);
  width: 960px;
  border-radius: 10px;
  overflow: hidden;
}

.table {

  width: 100%;
  display: table;
  margin: 0;
  box-shadow: 10px 10px 5px black;
}

@media screen and (max-width: 768px) {
  .table {
    display: block;

  }
}

.row1 {
  display: table-row;
  background: #fff;
}

.row1.header {
  color: #ffffff;
  background:rgb(243, 127, 127);
}

@media screen and (max-width: 768px) {
  .row1 {
    display: block;
  }

  .row1.header {
    padding: 0;
    height: 0px;
  }

  .row1.header .cell {
    display: none;
  }

  .row1 .cell:before {
    font-family: Poppins-Bold;
    font-size: 12px;
    color: #808080;
    line-height: 1.2;
    text-transform: uppercase;
    font-weight: unset !important;

    margin-bottom: 13px;
    content: attr(data-title);
    min-width: 98px;
    display: block;
  }
}

.cell {
  display: table-cell;
}

@media screen and (max-width: 768px) {
  .cell {
    display: block;
  }
}

.row1 .cell {
  font-family: Poppins-Regular;
  font-size: 15px;
  color: #666666;
  line-height: 1.2;
  font-weight: unset !important;

  padding-top: 20px;
  padding-bottom: 20px;
  border-bottom: 1px solid #f2f2f2;
}

.row1.header .cell {
  font-family: Poppins-Regular;
  font-size: 18px;
  color: #fff;
  line-height: 1.2;
  font-weight: unset !important;

  padding-top: 19px;
  padding-bottom: 19px;
}

.row1 .cell:nth-child(1) {
  width: 360px;
  padding-left: 40px;
}

.row1 .cell:nth-child(2) {
  width: 160px;
}

.row1 .cell:nth-child(3) {
  width: 250px;
}

.row1 .cell:nth-child(4) {
  width: 190px;
}


.table, .row1 {
  width: 100% !important;
}
.table .row{
  width: 100% !important;
  display: table-row;
}

.row1:hover {
  background-color: #f18f8f;

}


@media (max-width: 768px) {
  .row1 {
    border-bottom: 1px solid #f2f2f2;
    padding-bottom: 18px;
    padding-top: 30px;
    padding-right: 15px;
    margin: 0;
  }

  .row1 .cell {
    border: none;
    padding-left: 30px;
    padding-top: 16px;
    padding-bottom: 16px;
  }
  .row1 .cell:nth-child(1) {
    padding-left: 30px;
  }

  .row1 .cell {
    font-family: Poppins-Regular;
    font-size: 18px;
    color: #555555;
    line-height: 1.2;
    font-weight: unset !important;
  }

  .table, .row1, .cell {
    width: 100% !important;
  }
}
#btn-enroll:hover{
  background-color: white;
}
#paging:hover{
  background-color: white;
}

  </style> -->
<section id='mypage' style="padding-top: 100px;">	
	<div class='container'>
		<div class='panel'>
			<ul class="nav nav-tabs">
				<li role="presentation"><a href="${path}/mypage/mypage.do">예약현황</a></li>
				<li role="presentation"><a href="${path}/mypage/mypageBookmark.do">즐겨찾기</a></li>
				<li class="active" role="presentation"><a href="${path}/mypage/mypageQNAList.do?member_pk=${memberLoggedIn.memberPk}">문의내역</a></li>
				<li role="presentation"><a href="${path}/mypage/mypageChange.do">회원정보수정</a></li>
				<li role="presentation"><a href="${path}/mypage/mypageDelete.do">탈퇴</a></li>
			</ul>
        	<div class='panel-body'>
				<div class="page-header">
					<h2>1대1문의내역</h2>
				</div>
				<table class="table table-condensed table-hover">
					
						<tr>
							<th></th>
							<th>번호</th>
							<th>글 제목</th>
							<th>날짜</th>
							<th>답장여부</th>
							<th>삭제</th>
						</tr>
				
				
					<c:forEach  var='m' items='${qnaList}' varStatus="vs">
						<tr>
							<td></td>
							<td>${vs.count}</td>
							<td>${m.qna_title }</td>
							<td>${m.qna_date }</td>
							<th>${m.answer_check}</th>
							<th><button class="btn btn-danger" type="button" onclick="fn_refuse(${m.qna_pk})" value="${m.qna_pk}">삭제</i></button></th>
						</tr>
					</c:forEach>
				</table>
				
				  <div class="row1 text-center" id="paging">
        ${pageBar}
      </div>
     
			</div>	
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>