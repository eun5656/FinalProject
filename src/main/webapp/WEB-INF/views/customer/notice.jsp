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
<section>
    <div class="row">
				<div class="col-12">
					<h1 class="text-green mb-4 text-center">공지사항</h1>
				</div>
      </div>


    <div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingOne">
                        <h4 class="panel-title">
                            <a class="" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                <i class="fa fa-bars"></i>Section 1
                            </a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                        <div class="panel-body">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc dui ligula, blandit non maximus id, tempus vitae nulla. Cras nec turpis vitae libero eleifend consequat. Phasellus eu rutrum erat. Etiam id urna sed odio placerat gravida. Integer molestie lectus eu.
                        </div>
                    </div>
                </div>
                <!-- <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingTwo">
                        <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                <i class="fa fa-link"></i>Section 2
                            </a>
                        </h4>
                    </div>
                    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                        <div class="panel-body">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc dui ligula, blandit non maximus id, tempus vitae nulla. Cras nec turpis vitae libero eleifend consequat. Phasellus eu rutrum erat. Etiam id urna sed odio placerat gravida. Integer molestie lectus eu.
                        </div>
                    </div>
                </div> -->
                <!-- <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingThree">
                        <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                <i class="fa fa-comment"></i>Section 3
                            </a>
                        </h4>
                    </div>
                    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                        <div class="panel-body">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc dui ligula, blandit non maximus id, tempus vitae nulla. Cras nec turpis vitae libero eleifend consequat. Phasellus eu rutrum erat. Etiam id urna sed odio placerat gravida. Integer molestie lectus eu.
                        </div>
                    </div>
                </div> -->
            </div>
        </div>
    </div>
</div>
  </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>