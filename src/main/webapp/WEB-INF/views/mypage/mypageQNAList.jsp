<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<c:set var='path' value="${pageContext.request.contextPath}"/>   
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value=" " name="pageTitle"/>
</jsp:include>
<style>
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

  </style>
<section>
    <div class='container'>
      <div class="panel">

        <ul class="nav nav-tabs">
          <li role="presentation"><a href="${path}/mypage/mypage.do">예약현황</a></li>
          <li role="presentation"><a href="${path}/mypage/mypageBookmark.do">즐겨찾기</a></li>
          <li role="presentation"><a href="${path}/mypage/mypageQNA.do">1대1문의</a></li>
          <li class="active" role="presentation"><a href="${path}/mypage/mypageQNAList.do">문의내역</a></li>
          <li class="presentation"><a href="${path}/mypage/mypageChange.do">회원정보수정</a></li>
          <li role="presentation"><a href="${path}/mypage/mypageDelete.do">탈퇴</a></li>
        </ul>

        <div class="panel-body">
          <div class="page-header">
            <h2>문의내역</h2>
          </div>
          <div class="container">
            <div class="panel">

              <div class="limiter">
                <div class="container-table100">
                  <div class="wrap-table100">
                      <div class="table">

                        <div class="row1 header">
                          <div class="cell">
                            제목
                          </div>
                          <div class="cell">
                            작성일자
                          </div>
                          <div class="cell">
                            답변상태
                          </div>
                          <div class="cell">
                            삭제
                          </div>
                        </div>

                        <div class="row1">
                          <div class="cell" data-title="Full Name">
                            Vincent Williamson
                          </div>
                          <div class="cell" data-title="Age">
                            31
                          </div>
                          <div class="cell" data-title="Job Title">
                            iOS Developer
                          </div>
                          <div class="cell" data-title="Location">
                            Washington
                          </div>

                        </div>

                        <div class="row1">
                          <div class="cell" data-title="Full Name">
                            Joseph Smith
                          </div>
                          <div class="cell" data-title="Age">
                            27
                          </div>
                          <div class="cell" data-title="Job Title">
                            Project Manager
                          </div>
                          <div class="cell" data-title="Location">
                            Somerville, MA
                          </div>
                        </div>

                        <div class="row1">
                          <div class="cell" data-title="Full Name">
                            Justin Black
                          </div>
                          <div class="cell" data-title="Age">
                            26
                          </div>
                          <div class="cell" data-title="Job Title">
                            Front-End Developer
                          </div>
                          <div class="cell" data-title="Location">
                            Los Angeles
                          </div>
                        </div>
                        <div class="row1">
                            <div class="cell" data-title="Full Name">
                              Justin Black
                            </div>
                            <div class="cell" data-title="Age">
                              26
                            </div>
                            <div class="cell" data-title="Job Title">
                              Front-End Developer
                            </div>
                            <div class="cell" data-title="Location">
                              Los Angeles
                            </div>
                          </div>

                          <div class="row1">
                              <div class="cell" data-title="Full Name">
                                Justin Black
                              </div>
                              <div class="cell" data-title="Age">
                                26
                              </div>
                              <div class="cell" data-title="Job Title">
                                Front-End Developer
                              </div>
                              <div class="cell" data-title="Location">
                                Los Angeles
                              </div>
                            </div>

                            <div class="row1">
                                <div class="cell" data-title="Full Name">
                                  Justin Black
                                </div>
                                <div class="cell" data-title="Age">
                                  26
                                </div>
                                <div class="cell" data-title="Job Title">
                                  Front-End Developer
                                </div>
                                <div class="cell" data-title="Location">
                                  Los Angeles
                                </div>
                              </div>

                              <div class="row1">
                                  <div class="cell" data-title="Full Name">
                                    Justin Black
                                  </div>
                                  <div class="cell" data-title="Age">
                                    26
                                  </div>
                                  <div class="cell" data-title="Job Title">
                                    Front-End Developer
                                  </div>
                                  <div class="cell" data-title="Location">
                                    Los Angeles
                                  </div>
                                </div>

                                <div class="row1">
                                    <div class="cell" data-title="Full Name">
                                      Justin Black
                                    </div>
                                    <div class="cell" data-title="Age">
                                      26
                                    </div>
                                    <div class="cell" data-title="Job Title">
                                      Front-End Developer
                                    </div>
                                    <div class="cell" data-title="Location">
                                      Los Angeles
                                    </div>
                                  </div>



                      </div>

                  </div>

                  <hr>
                  <div class="row1 text-center" id="paging">
                    <ul class="pagination ">
                      <li><a href="#"><span aria-hidden="true">«</span><span class="sr-only">Previous</span></a></li>
                      <li><a href="#">1</a></li>
                      <li><a href="#">2</a></li>
                      <li><a href="#">3</a></li>
                      <li><a href="#">4</a></li>
                      <li><a href="#">5</a></li>
                      <li><a href="#"><span aria-hidden="true">»</span><span class="sr-only">Next</span></a></li>
                    </ul>
                  </div>




              </div>
              </div>
              </div>
            </div>

            </div>
      </div>



          </div>

        </div>
      </div>
    </div>
  </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>