<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Home Spring" name="pageTitle"/>
</jsp:include>

<c:set var='path' value="${pageContext.request.contextPath}"/> 
 <link href="${path }/resources/css/carousel.css" rel="stylesheet">
  <link href="${path }/resources/css/smallcarousel.css" rel="stylesheet">
  <link href="${path }/resources/css/shop.css" rel="stylesheet">

<div class="container-fluid">

         <div class="row">
          <div class="col-md-12">
            <span>
              <strong style="font-size:20pt; color:rgb(71, 51, 51)"><i class="fa fa-angellist"></i>점포상세검색</strong><span>
            <hr id="custom-hr">
          </div>
        </div>
        
        
         <div class="row">
        <div class="col-xs-9">
        
        </div>
            <div class="col-xs-3">
      <form name="sort_group" id="sort_group" action=	"#">
        <select class="form-control" name="selectSort" id="select_sort">
          <option value="basic">전체</option>
          <option value="review">리뷰순(갯수)</option>
          <option value="rank">평점 순</option>
          <option value="bookmark">즐겨찾기 순</option>
          </select>
          </form>
      </div>
      </div>
      <script type="text/javascript">
			$(function() {
					$("#select_sort").on("change", function() {
						$.ajax({
						 	url:"${path}/shop/shopSort.do",
							data:{"sort_value":$(this).val()},
							type: "post",
							dataType: "json",
							success: function(data){
								$("#nail-list *").remove();
								
							},
							error: function(jpxhr,textStatus,errormsg) {
								console.log("ajax전송실패");
								console.log(jpxhr);
								console.log(textStatus);
								console.log(errormsg);
							}
						});	
					})
			})
	  </script>


    <div  id="nail-list" class="row">


 <c:forEach items="${shopList}" var="shop" varStatus="status">
  <div class="col-md-4" style="padding-top: 10px;">
    <div class="col-item">
      <div class="photo">
        <img src="${path }/resources/images/nail_store/${shop.store_re_img}" class="img-responsive" alt="a" />
      </div>
      <div class="info">
        <div class="row">
          <div class="price col-xs-6">
            <h5 style="margin-bottom:7px;">1위  :<c:out value="${shop.store_name}"/> 샵</h5>
            <h6 class=""><c:out value="주소 : ${shop.store_address}"/></h6>
          </div>
                 
          
          <div class="rating col-xs-6" style="text-align: right;">
          <c:forEach begin="1" end="${shop.store_rank}">
            <i class="price-text-color fa fa-star"></i>
            </c:forEach>
            <c:forEach begin="1" end="${5-shop.store_rank}">
              <i class=" fa fa-star"></i>
           </c:forEach>    
          </div>
        </div>
    <div class="separator clear-left">
          <p class="btn-add" style=""> 

                          <button href="#" class="btn btn-warning" style="width:90%"><span class="glyphicon glyphicon-time"></span>예약하기</button>
          </p>
          <p class="btn-details">
            <button href="#" class="btn btn-info" style="width:90%"><span class="glyphicon glyphicon-comment"></span> 리뷰&nbsp;&nbsp;<c:out value="${shop.store_review_count}"/>개</button>
        </div>
        <div class="clearfix">
        </div>
      </div>
    </div>
  </div>
 
  
</c:forEach>
  
  
    </div>
  <br>



  
  <!--</div>-->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
