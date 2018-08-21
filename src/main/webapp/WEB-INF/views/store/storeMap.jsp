<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 해더부분 -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="NailStore" name="pageTitle" />
</jsp:include>


<c:set var="path" value="${pageContext.request.contextPath }" />
<!-- store css -->

<link href="${path }/resources/css/store.css" rel="stylesheet" />
<link href="${path }/resources/css/review.css" rel="stylesheet" />
<!-- store js -->
<script type="text/javascript">
// 외부 js 에서 쓰이는 변수 setting
var path = "${pageContext.request.contextPath }";
var store_pk ="${store.store_pk}";
var store_name = "${store.store_name}";
var address = "${store.store_address}";
</script>
<script src="${path }/resources/js/store.js?ver=8"></script>
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDmfjiMcgfcCVI6QKs42Kk4AvHUVdOQtso"></script>
<script type="text/javascript">
$(function(){

var mapCanvas = document.getElementById("map");
	var mapOptions = {
		zoom : 17
	};
    var geocoder = new google.maps.Geocoder;
    var infowindow = new google.maps.InfoWindow({
        content: address
    });
	var map = new google.maps.Map(mapCanvas, mapOptions);
    geocoder.geocode( { 'address': address}, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            map.setCenter(results[0].geometry.location);
            var marker = new google.maps.Marker({
                map: map,
                // icon: image, // 마커로 사용할 이미지(변수)
    			title: store_name,
                position: results[0].geometry.location
            });
          	marker.setMap(map);
var LatLng = ""+ results[0].geometry.location;
} 
      
      marker.addListener('click', function() {
    	    infowindow.open(map, marker);//마커에정보표시
    	  });
});
})
    </script>
<div>
<div id="wrapper">

	<div id="left-side">


		<div id="second" class="active">

			<div class="NailStoreMap animatepop" id="map">
			</div>
			<div class="addrText animatepop">
			<br>
				<p>${store.store_address }</P>
			</div>
		</div>
		

</div>

<div id="right-side">
<div id="border">
	<div id="line" class="two" style="position:fixed;"></div>
</div>
	<div style="position: fixed;">
		<ul>
			<li class="shop ">
				<div class="icon ">
					<img src="${path }/resources/icons/shop.svg" alt="">
				</div> Shop
			</li>
			<li class="map active">
				<div class="icon active" >
					<img src="${path }/resources/icons/map.svg" alt="">
				</div> Map
			</li>
			<li class="reserve">
				<div class="icon">
					<img src="${path }/resources/icons/calander.svg" alt="">
				</div> Reserve
			</li>
			<li class="qna">
				<div class="icon">
					<img src="${path }/resources/icons/customer.svg" alt="">
				</div> Contact
			</li>
		</ul>
	</div>
</div>
</div>
</div>
<!-- 푸터부분 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
