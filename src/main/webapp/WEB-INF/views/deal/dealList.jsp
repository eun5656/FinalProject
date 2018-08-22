<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var='path' value="${pageContext.request.contextPath}" />



<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value=" " name="pageTitle" />
</jsp:include>
<style>



</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/dealList.css">


  <div class="container">
    <div class="panel" style="padding-top:30px;">
      <div class="panel-heading">
        <h2>Market</h2>
      </div>

   	<div class="panel-body">
    <div class="row">
    <div class="col-xs-6"></div>
    <div class="col-xs-5">
      <form action="${path }/deal/dealSelect.do" method="post">
          <div class="col-xs-12">
          	<div class="input-group">
                  <div class="input-group-btn search-panel">
                     	<select name="selectOption" title="" class="btn btn-default" style="width:90px;height:34px;">
					<option selected="" value="1">제목</option>
					<option value="2">내용</option>
					<option value="3">작성자</option>
					<option value="4">제목+내용</option>
				
				</select>
                  </div>
                  <input type="hidden" name="search_param" value="all" id="search_param">         
                  <input type="text" class="form-control" name="searchOption" id="searchOption" placeholder="검색" required>
                  <span class="input-group-btn">
                      <button class="btn btn-default" type="submit" style="height:34px;" onclick="return fn_select();"><span class="glyphicon glyphicon-search"></span></button>
                  </span>
              </div>
         
    	</div>
       </form>
      
      </div>
      <div class="col-xs-1"></div>
     </div>

	<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100" >
					<div class="table">

						<div class="row1 header">
              
							<div class="cell">
               				 번호
							</div>
							<div class="cell">
							제목 
							</div>
							<div class="cell">
							작성자
							</div>
							<div class="cell">
							작성 일자
             				</div>
           
						</div>


						<c:if test="${not empty list }">
							<c:forEach var='deal' items='${list}' varStatus="vs">

						<div class="row1">
							<div class="cell" data-title="번호">
                 			 <a href="${path }/deal/dealView.do?deal_pk=${deal.deal_pk}">${deal.deal_pk}</a>
							</div>
							<div class="cell" data-title="제목">
								<a href="${path }/deal/dealView.do?deal_pk=${deal.deal_pk}">${deal.deal_title }</a>
							</div>
							<div class="cell" data-title="작성자">
								${deal.deal_writer }
							</div>
							<div class="cell" data-title="작성일자">
								<fmt:formatDate value="${deal.deal_date}" pattern="MM/dd HH:mm"/>
             				 </div>
            
						</div>
							</c:forEach>
						</c:if>
						
					
		
					</div>
				
      </div>
      
      <c:if test="${memberLoggedIn!=null }">
      <div class="row1 text-right" id="btn-enroll">
          <button type="button" class="btn btn-warning" onclick="location.href='${path}/deal/dealForm.do'">글 등록</button>
      </div>
      </c:if>
      <div class="row1 text-center" id="paging">
        ${pageBar}
      </div>
     
		<script>
		function fn_select(){
			
			
			if($("#searchOption").val().length==0&&$("#searchOption").val("")){
				alert("검색어를 입력해주세요.");
				return false;
				
			}
			return true;
		}
		</script>
		
		
	
	
  </div>
  </div>
  </div>
</div>

</div>



		
	











<jsp:include page="/WEB-INF/views/common/footer.jsp" />