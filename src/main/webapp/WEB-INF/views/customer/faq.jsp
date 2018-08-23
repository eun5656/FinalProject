<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>   
<c:set var='path' value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" type="text/css" href="${path }/resources/css/customer.css">  
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value=" " name="pageTitle"/>
</jsp:include>
<style>
#btn-enroll{
padding-top:40px;
}

</style>

<section style="padding-top: 100px;">
    <div class="row">
				<div class="col-12">
					<h1 class="text-green mb-4 text-center">자주묻는질문</h1>
				</div>
      </div>


    <div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
          			  
            <c:if test="${not empty list }">
				<c:forEach var='faq' items='${list}' varStatus="vs">
               
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="${heading}${vs.index}">
                        <h4 class="panel-title">
                            <a class="" role="button" data-toggle="collapse" data-parent="#accordion" href="#${collapse}${vs.index}" aria-expanded='<c:if test="${vs.index==0 }">true</c:if><c:if test="${vs.index!=0 }">false</c:if>' aria-controls="${collapse}${vs.index}">
                               <span style="color: #de4d4e;font-size: 14px;font-weight: bolder;">Q.</span> ${faq.faqTitle }
                            </a>
                        </h4>
                    </div>
                    <div id="${collapse}${vs.index}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="${heading}${vs.index}">
                        <div class="panel-body">
                        <div class="row">
                        	<div class="col-xs-1"></div>
                        	<div class="col-xs-10"><span style="color: #de4d4e;font-size: 14px;font-weight: bolder;">A.</span> ${faq.faqContent }</div>
                        	<div class="col-xs-1"></div>
                        
                       </div>
                        <c:if test="${memberLoggedIn.memberLevel==1 }">
                       <div class="row text-right">
                            <div class="btn-group">
  								<button type="button" class="btn btn-warning" onclick="location.href='${path}/customer/faqUpdate.do?faqPk=${faq.faqPk}'">수정</button>
  								<button type="button" class="btn btn-warning" onclick="location.href='${path}/customer/faqDelete.do?faqPk=${faq.faqPk}'">삭제</button>
  							</div>
  							</div>
  						</c:if>
  		
                       
                        </div>
                    </div>
                </div>
              </c:forEach>
			</c:if>
                
          
            </div>
            </div>
        </div>
         <c:if test="${memberLoggedIn.memberLevel==1 }">
         <div class="row text-right" id="btn-enroll">
          <button type="button" class="btn btn-warning" onclick="location.href='${path}/customer/faqForm.do'">글 등록</button>
      	</div>
      	</c:if>
      	 <div class="row text-center" id="paging">
        ${pageBar}
     	 </div>
     
    </div>
  
  			
    	
   
  </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>