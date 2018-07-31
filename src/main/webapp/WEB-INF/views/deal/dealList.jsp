<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var='path' value="${pageContext.request.contextPath}" />



<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value=" " name="pageTitle" />
</jsp:include>
<link rel="stylesheet" type="text/css" href="${path }/resources/css/dealList.css">



<section>
  <div class="container">
    <div class="panel" style="padding-top:30px;">
      <div class="panel-heading">
        <h2>Market</h2>

      </div>

   <div class="panel-body">
    
      <div class="col-xs-7"></div>
     
   
    <div class="col-xs-5">
      <form>
          <div class="col-xs-12">
          <div class="input-group">
                  <div class="input-group-btn search-panel">
                      <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                        <span id="search_concept">선택</span> <span class="caret"></span>
                      </button>
                      <ul class="dropdown-menu" role="menu">
                        <li><a href="#contains">제목</a></li>
                        <li><a href="#its_equal">내용</a></li>
                        <li><a href="#greather_than">제목+내용</a></li>
                       
                        
                      </ul>
                  </div>
                  <input type="hidden" name="search_param" value="all" id="search_param">         
                  <input type="text" class="form-control" name="x" placeholder="Search term...">
                  <span class="input-group-btn">
                      <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-search"></span></button>
                  </span>
              </div>
         
    </div>
        </form>
      
      </div>

	<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
					<div class="table">

						<div class="row1 header">
              
							<div class="cell">
                  Full Name
							</div>
							<div class="cell">
								Age 
							</div>
							<div class="cell">
								Job Title
							</div>
							<div class="cell">
								Location
              </div>
           
						</div>

						<div class="row1">
							<div class="cell" data-title="Full Name">
                  <a href="dealForm.html">Vincent Williamson</a>
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
		
					</div>
				
      </div>
      <div class="row1 text-right" id="btn-enroll">
          <button type="button" class="btn btn-warning" style=""><a href="dealForm.html">글 등록</a></button>
      </div>
    
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
</section>














<jsp:include page="/WEB-INF/views/common/footer.jsp" />