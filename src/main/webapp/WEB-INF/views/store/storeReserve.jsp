<%@page import="com.kh.spring.reserve.model.vo.Reserve"%>
<%@page import="java.util.ArrayList"%>
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
<link href="${path }/resources/css/storeReserve.css" rel="stylesheet" />
<link href="${path }/resources/css/final_scheduler.css" rel="stylesheet" />
<link href="${path }/resources/css/fullcalendar.min.css" rel="stylesheet" />
<link href="${path }/resources/css/scheduler.min.css" rel="stylesheet" />
<!-- store js -->

<!--결제시스템  -->

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<style>
#result-reservaiton{
margin-right: 40px;
}
</style>


<script type="text/javascript">
// 외부 js 에서 쓰이는 변수 setting
var path = "${pageContext.request.contextPath }";
var store_pk ="${store.store_pk}";
</script>
<script src="${path }/resources/js/store.js?ver=3"></script>
<script src="${path }/resources/js/moment.min.js"></script>
<script src="${path }/resources/js/fullcalendar.min.js"></script>
<script src="${path }/resources/js/gcal.min.js"></script>
<script src="${path }/resources/js/scheduler.min.js"></script>
<script src="${path }/resources/js/ko.js"></script>

  <script>
    $(function() {
      //영업시작시간~~
      var min = '10:00:00';
      var max = '23:00:00';
      var reserDate;
      var startTime;
      var endTime;



      //전체휴일
      var businessHours1 = [

        {
          start: '2018-07-30',
          end: '2018-07-30',
        },
        {
          start: '2018-08-21',
          end: '2018-08-21',
        },

      ];
      

      /*변수 초기화*/
      var reservaiton = [
         {
          id: '',
          resourceId: '',
          start: '',
          end: '',
          title: '',
          description: ''

        }
      ];
      
      var employee = [{
          id: 'a',
          title: '원장님',
          eventColor: 'blue',
          businessHours1: businessHours1,
          businessHours: [ // specify an array instead
            {
              dow: [1, 2, 3, 4, 5], // Monday, Tuesday, Wednesday
              start: '08:00', // 8am
              end: '23:00' // 6pm
            },

            {
              dow: [6], // Thursday, Friday
              start: '11:00', // 10am
              end: '21:00' // 4pm
            },
            {
              dow: [0], // Thursday, Friday
              start: '11:00', // 10am
              end: '21:00' // 4pm
            }
          ]
        },

        {
          id: 'b',
          title: '디자이너1',
          eventColor: 'green',
          businessHours1: businessHours1,
          businessHours: [ // specify an array instead
            {
              dow: [1, 2, 3, 4, 5], // Monday, Tuesday, Wednesday
              start: '08:00', // 8am
              end: '23:00' // 6pm
            },

            {
              dow: [6], // Thursday, Friday
              start: '11:00', // 10am
              end: '21:00' // 4pm
            },
            {
              dow: [0], // Thursday, Friday
              start: '11:00', // 10am
              end: '21:00' // 4pm
            }
          ]

        },
        {
          id: 'c',
          title: '디자이너2',
          eventColor: 'orange',
          businessHours1: businessHours1,
          businessHours: [ // specify an array instead
            {
              dow: [1, 2, 3, 4, 5], // Monday, Tuesday, Wednesday
              start: '08:00', // 8am
              end: '23:00' // 6pm
            },

            {
              dow: [6], //
              start: '11:00',
              end: '21:00'
            },
            {
              dow: [0], //
              start: '11:00',
              end: '21:00'
            }
          ]
        },
      ];
      

      
   
      <c:forEach items="${reserveList}" var="reserve">
     	 reservaiton.push({
        	 id:"${reserve.reserve_pk}", 
        	 resourceId:"${reserve.designer_id}",
        	 start:"${reserve.reserve_start_time}",
       		 end:"${reserve.reserve_end_time}",
        	 title:"-${reserve.member_name}- 님 예약완료",
         	 description:"-${reserve.member_name}-님 예약완료",
         	 member_name:"${reserve.member_name}",
         	 reserve_start_time:"${reserve.reserve_start_time}",
         	 reserve_end_time:"${reserve.reserve_end_time}",
         	 designer_name:"${reserve.designer_name}",
         	 menu_pk:"${reserve.menu_pk}"
        });
      </c:forEach>
      
      
      
      
      
      $('#calendar').fullCalendar({
        themeSystem: 'bootstrap3',

        
        //시작 페이지
  		defaultView: 'month',
  		
        //// uncomment this line to hide the all-day slot
        allDaySlot: false,

        //설정
        //영업 시작, 종료시간
        minTime: min,
        maxTime: max,

        //디자이너 추가
        resources: employee,

        //예약내역 추가
        events: reservaiton,

        //이벤트에 시각까지 보여주기
        displayEventTime: true,


        //editable: true, //드래그해서 움직이는것
        eventLimit: true, // allow "more" link when too many events
        displayEventTime: true,

        navLinks: true, // can click day/week names to navigate views
        businessHours: false,

        slotEventOverlap: false,

        lang: "ko",

        //shows time in 15 min slot
        slotDuration: '00:30:00',
        slotLabelInterval: 60,
        slotLabelFormat: 'a HH :mm ',

        /*점포 휴무일
        businessHours: {
          // days of week. an array of zero-based day of week integers (0=Sunday)
          dow: [1, 2, 3, 4], // Monday - Thursday

          start: '10:00', // a start time (10am in this example)
          end: '18:00', // an end time (6pm in this example)
        },*/




        header: {
          left: 'prev,next',
          center: 'title',
          right: 'month,agendaThreeDay,agendaDay' //agendaTwoDay
        },

        views: {
          agendaThreeDay: {
            duration: {
              days: 3
            },
            type: 'agenda',
            // views that are more than a day will NOT do this behavior by default
            // so, we need to explicitly enable it
            groupByResource: true
            //// uncomment this line to group by day FIRST with resources underneath
            //groupByDateAndResource: true
          },
          agendaDay: {
            // options apply to basicWeek and basicDay views
          }
        },


        googleCalendarApiKey: "AIzaSyDcnW6WejpTOCffshGDDb4neIrXVUA1EAE", // Google API KEY
        eventSources: [
          // 대한민국의 공휴일
          {
            googleCalendarId: "ko.south_korea#holiday@group.v.calendar.google.com",
            className: "koHolidays",
            color: "#be0000",
            textColor: "#FFFFFF"
          }
        ],


        /* hover시 예약내역보여주기*/
        eventRender: function(eventObj, $el) {
          $el.popover({
            title: '예약내역',
            content: eventObj.description,
            trigger: 'hover',
            placement: 'top',
            container: 'body'
          });
        },

      
        dayClick: function(date, jsEvent, view, resource) {
        	
        	
        	console.log(date._i);
        	console.log(jsEvent);
        	console.log(view);
        	console.log(resource);
        	//resource.title
        	
                       
                        console.log("message"+message);
                        console.log("reserveCheck"+reserveCheck);
        	
        	
        	
        	
        	
        	
     	   if(resource!=null){   
           	  var checkHoliday = true;
               	console.log(resource.businessHours[1].dow[0])
             	console.log(resource.businessHours[2].dow[0])

             	var mydateObj = new Date(date);
             	var chosenDay = mydateObj.getUTCDay();

             if (chosenDay == resource.businessHours[1].dow[0]) {
                  if (resource.businessHours[1].start.substr(0, 2) > date.format("HH") || resource.businessHours[1].end.substr(0, 2) <= date.format("HH")) {
                    checkHoliday = false;
                    console.log(checkHoliday)
                  }
                }
              if (chosenDay == resource.businessHours[2].dow[0]) {
                  if (resource.businessHours[2].start.substr(0, 2) > date.format("HH") || resource.businessHours[2].end.substr(0, 2) <= date.format("HH")) {
                    checkHoliday = false;
                    console.log(checkHoliday)
                     }
                }


                var check = true;
                //휴무일. 특정 휴무일 (일로 받았을떄 처리)
                for (var i = 0; i < businessHours1.length; i++) {
                     if (date.format('YYYY-MM-DD') == businessHours1[i].start || date.format('YYYY-MM-DD') == businessHours1[i].end) {
                       check = false; //휴무일.
                  }
                }
               if (check == true) {
                     var now = new Date;
                     var nowDate = new Date(now.getFullYear(), now.getMonth(), now.getDate(), now.getHours() + 1);
                     console.log("now" + nowDate);


                     var checkDate = new Date(date.format());
                     console.log("check" + checkDate);

                     /*1시간전 예약 못하게만들기*/
                     if (checkDate <= nowDate) { //&& flag == truenowDate
                       alert("예약할 수 없는 시간입니다.");
                       check2 = false;
                       date=null;
                     } 
                     else if (checkHoliday == false) {
                          alert("영업시간이 아닙니다.");
                          date=null;
                     }
                     
                     else {
                         	 if("${memberLoggedIn}".length >0){
                         		 
                         		var start_time=date.format("YYYY-MM-DD HH:mm:ss");
                            	var reserveCheck = {
                            			 reserve_start_time: start_time,
                            			 store_pk:store_pk,
                            			 designer_id: resource.id
                               		}
                            	var reserveCheck = JSON.stringify(reserveCheck);
                            	var message='';
                                        $.ajax({
                                           type: "POST",
                                           url:"${path}/reserve/storeReserveCheck.do",
                                           data: {"reserveCheck":reserveCheck},
                                           dataType: "json",
                                           success: function (data) {
                                              		message=data.msg;
                                                	reserveCheck=data.result;
                                                	if(reserveCheck==0){
                                                		 $('#calendarModal').modal();
                                                 		 $('#designer').html(resource.title);
                                              			 $('#reserDate').html(date.format('YYYY년MM월DD일 HH시mm분'));
                                                	}
                                                	else{
                                                		alert(message);
                                                	}
                                           		},
                                          	    error: function (e) {
                                                console.log("ERROR : ", e);
                                             }
                                          });
                       	  	 }
                         
                        	 else{
                        			 if(reserveCheck>0){
                        		 	    alert(message);
                        	 		 }
                        			 else{
	                            		alert('로그인을 해주세요');
	                                    //로그인페이지로보내기.........할까말까

                        			 }
                        	 }
                     }
                }
           else {
                     console.log(i);
                  	 alert("휴무일입니다.");
                     date=null;
                }
                   
        
                   
              //x버튼 눌렀을떄 date 초기화
            $("#close-modal").on('click',function() {
             date=null;
            //location.reload();
           // $('.reserve').trigger('click');
            });
            $(document).keyup(function(e) {
              if(e.keyCode==27){
                date=null;
              }
            });
        }
		
     	   
        
        
          $("#result-reservaiton").one('click', function() {
           
             var IMP = window.IMP; // 생략가능
             IMP.init('iamport'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
          
                var payCheck=$('#choice4 option:selected').val();
                 var title ="-${memberLoggedIn.memberName}- 님 예약완료";
                 var description ="-${memberLoggedIn.memberName}- 님 예약완료";;
                 var id = $('#reservation-id').val();
                 var choice1 = $('#choice1 option:selected').val();
                 var choice2;
                 if(choice1=='손'){
                  choice2= $('#choice2 option:selected').val();
                 }
                 else{
                    choice2=$('#choice3 option:selected').val();
                 }
                 
                 //가격가져오기
                 choice2 = choice2.split(',');
                 var menu_price=choice2[1];
                 console.log(menu_price);
                 choice2=choice2[0];
               		//console.log(choice2);
               		
               		 var store_reserve = { 
                           	  member_pk: "${memberLoggedIn.memberPk}",
                              member_name:"${memberLoggedIn.memberName}",
                          	  store_pk: store_pk,
                              menu_pk: choice2,
                              designer_name:resource.title, //pk로 던저줄지는 생각해봐야함..   
                              designer_id:resource.id,    
                              reserve_start_time:date,             
                              reserve_end_time:date          
                           }
                        
                         var store_payment = {
                        		  member_pk: "${memberLoggedIn.memberPk}",
                                  member_name:"${memberLoggedIn.memberName}",
                              	  store_pk: store_pk,
                        		  merchant_uid1:'merchant_' + new Date().getTime(),
                        		}
             	  
	
             			  var jsonData = JSON.stringify(store_reserve);
             			  var jsonData2 = JSON.stringify(store_payment);
                   			   jQuery.ajaxSettings.traditional = true;
                   			   
                   			   
                   			   
                   			   
               
                   			   
               	 IMP.request_pay({
                       pg : 'inicis', // version 1.1.0부터 지원.
                       pay_method : payCheck,
                       merchant_uid : store_payment.merchant_uid1,
                       name : '주문명:결제테스트',//메뉴이름
                       amount :100,
                      // amount :100,
                       buyer_email : "${memberLoggedIn.memberEmail}",
                       buyer_name : "${memberLoggedIn.memberName}",
                       buyer_tel : "${memberLoggedIn.memberPhone}",
                       buyer_addr : "${memberLoggedIn.memberAddress}",
                      
                       m_redirect_url : 'https://www.yourdomain.com/payments/complete'
                   }, 
                      function(rsp) {
                       if ( rsp.success ) {
                           var msg = '결제가 완료되었습니다.';
                           msg += '고유ID : ' + rsp.imp_uid;
                           msg += '상점 거래ID : ' + rsp.merchant_uid;
                           msg += '결제 금액 : ' + rsp.paid_amount;
                           msg += '카드 승인번호 : ' + rsp.apply_num;
                           
                        //성공시에 디비에 인서트함   
                        $.ajax({
                            type: "POST",
                        	url:"${path}/reserve/storeReserveInsert.do",
                          	data: {"store_reserve":jsonData,"store_payment":jsonData2},
                            dataType: "json",
                            success: function (data) {
                           //console.log(data.reserve.menu_pk);
                           alert(data.msg);
                          
                           if(data.msg=="예약완료"){
                           /*화면에 등록시키기*/
                           //console.log(description);
                            	$('#calendar').fullCalendar('renderEvent', {
                             	title: title,
                             	start: data.reserve.reserve_start_time, //specify start date
                             	id:  data.reserve.reserve_pk,  //예약아이디로....
                             	description: description,
                             	resourceId: data.reserve.designer_id,
                             	end: data.reserve.reserve_end_time,
                             	member_name:data.reserve.member_name,
                             	reserve_start_time:data.reserve.reserve_start_time,
                             	reserve_end_time:data.reserve.reserve_end_time,
                             	designer_name:data.reserve.designer_name,
                             	menu_pk:data.reserve.menu_pk
                            });
                            $('#close-modal-btn').trigger('click');
                           }
                           else{
                        	   
                        	   
                           }
                        },
                        error: function (e) {
                            console.log("ERROR : ", e);
                        }

                      });
                     	  } else {
                           var msg = '결제에 실패하였습니다.';
                           msg += '에러내용 : ' + rsp.error_msg;
                           $('#close-modal-btn').trigger('click');
                       }
                       alert(msg);
                   });    
          });
        },


        eventClick: function(calEvent, jsEvent, view) {
          
          	$('#reserName').html(calEvent.member_name);
          	$('#reserDate').html(calEvent.reserve_start_time+" ~ "+calEvent.reserve_end_time);
          	var choice1="";
          	var choice2="";
            <c:forEach var="menu" items="${menuList}">
            	if (calEvent.menu_pk=="${menu.menu_pk}") {
            	choice1="${menu.menu_check}";
				choice2="${menu.menu_name}"+"("+"${menu.menu_info}"+")"+" "+"${menu.menu_price}"+"원";
				}
        	 </c:forEach>
        	 

          	$("#myLargeModalLabel-1").html('예약확인');
          	$("#choice1").parent().html(choice1);
        	$("#choice1").parent().css('padding-top','13px');
          	//$("#choice1").css('disabled');
          	
        	$("#choice2").parent().html(choice2);
        	$("#choice2").parent().css('padding-top','13px');
          	$("#designer").html(calEvent.designer_name);
          	$("#payment").remove();
          	$("#result-reservaiton").remove();
        	var modal_view= $('#calendarModal').modal();
    
          
          $('#remove-reservaiton').one('click', function() {
            var check1 = confirm("삭제하시겠습니까?")
            if (check1 == true) {
              $('#calendar').fullCalendar('removeEvents', calEvent.id);
              $('#calendarModal').modal('toggle');
            }
          })
        }
      });
      
    	$('#close-modal-btn').on('click', function() {
      		location.reload();
     	 });
    	  $(document).keyup(function(e) {
              if(e.keyCode==27){
                	location.reload();
              }
            });
		

      /*하루 날린timepicker...
      $('input.timepicker').timepicker({
        defaultTime: '09:00 AM',
        timeFormat: 'HH시mm분',
        // year, month, day and seconds are not important
        minTime: min,
        maxTime: max,
        // time entries start being generated at 6AM but the plugin
        // shows only those within the [minTime, maxTime] interval
        startHour: 6,
        // the value of the first item in the dropdown, when the input
        // field is empty. This overrides the startHour and startMinute
        // options
        //  startTime: new Date(0, 0, 0, 8, 20, 0),
        // items in the dropdown are separated by at interval minutes
        interval: 60, //몇분단위
        autoclose: true

      });*/




    });
  </script>
<div>
<div id="wrapper">
   
   <div id="left-side">
      <div id="third" class="active">
        <div class="row" style="margin-top: 100px;">
            <strong style="font-size:20pt; color:rgb(71, 51, 51)"><c:out value="${store.store_name}점포 "/>예약페이지</strong>
            <strong style="font-size:20pt; color:rgb(71, 51, 51)"><i class="fa fa-angellist"></i>예약페이지</strong>
      </div>  
         <div id='calendar' style="margin-top: 20px;"></div>
         <div id='calendarModal' class="modal fade pop-up-1" tabindex="-1"
            role="dialog" aria-labelledby="myLargeModalLabel-1"
            aria-hidden="true">
            <div class="modal-dialog">
               <form id='reser-modal'action="#" method="post">

                  <div class="modal-content">
                     <div class="modal-header">
                        <button id='close-modal-btn' type="button" class="close" data-dismiss="modal"  aria-hidden="true">×</button>
                        <h4 class="modal-title" id="myLargeModalLabel-1">예약등록</h4>
                     </div>
                     <div class="modal-body">

                        <div class="row" style="margin: 0px;">
                           <div class="form-group">
                              <table id="reservaiton-form" class="table">
                                 <thead>
                                    <tr>
                                       <td colspan="1"><label for="sel1">예약자 :</label></td>
                                       <td colspan="4">
                                          <p id="reserName" class="member_info" style=" padding-left: 0px;">홍성진</p> <!---->
                                       </td>
                                    </tr>
                                 </thead>
                                 <tbody>

                                    <tr>
                                       <td colspan="1"><label for="sel1">예약일시 :</label></td>
                                       <td colspan="4">
                                          <p id="reserDate" class="member_info" style=" padding-left: 0px;"></p> <!--<input type="type" id="reservation-timepicker" class="timepicker form-control input-sm" name="reservation-timepicker" style="width:130px;" />-->
                                       </td>
                                    </tr>

                                    <tr>
                                       <td colspan="1"><label for="sel1">시술선택 :</label></td>
                                       <td colspan="1" style="width: 72">
                                       <select class="form-control input-sm" id="choice1" name='choice1'>
                                             <!--점주레벨이 아니면 disabled-->
                                             <option value="손"  selected="selected">손</option>
                                             <option value="발">발</option>
                                       </select></td>
                                    
                                       <td colspan="3" id="hand" style="width: 172px;">
                                          <select  id='choice2' class="form-control input-sm"  name='choice2'>
                                             <!--점주레벨이 아니면 disabled-->
                                             <c:forEach var="menu" items="${menuList}">
                                                <c:if test="${menu.menu_check eq '네일'}">
                                                <option value="${menu.menu_pk},${menu.menu_price}">${menu.menu_name}(${menu.menu_info})&nbsp;&nbsp;${menu.menu_price} 원</option>
                                                
                                                </c:if>
                                             </c:forEach>
                                             
                                          </select>
                                       </td>
                                       
                                       <td  colspan="3" id="foot"style="width: 172px; display: none;">
                                          <select id='choice3' class="form-control input-sm"  name='choice3'>
                                             <!--점주레벨이 아니면 disabled-->
                                             <c:forEach var="menu" items="${menuList}">
                                                <c:if test="${menu.menu_check eq '페디'}">
                                                <option value='${menu.menu_pk }'>${menu.menu_name}(${menu.menu_info})&nbsp;&nbsp;${menu.menu_price} 원</option>
                                                </c:if>
                                             </c:forEach>
                                             
                                          </select>
                                       </td>
                                       
                                       <script type="text/javascript">
                                                   $('#choice1').change(function() {
                                                      var check=$(this).val();
                                                      console.log(check);
                                                      if(check=='발'){
                                                         $('#hand').css("display", "none");  
                                                         $('#foot').css("display", "inline-block");  
                                                      }
                                                      else{
                                                         $('#hand').css("display", "inline-block");  
                                                         $('#foot').css("display", "none");  
                                                      }
                                                   });
                                             </script>
                                             
                                       
                                    </tr>

                                    <tr>
                                       <td><label for="sel1">담당자:</label></td>
                                       <td>
                                         <p id='designer' style="padding-left: 0px; padding-top:5pt; font-size: 12pt;"></p>
                                       </td>
                                    </tr>
                                    
                                    <tr id='payment'>
                                          <td colspan="1"><label for="choice4">결제수단 :</label></td>
                                       
                                       <td  colspan="4" id="foot"style="width: 100px; ">
                                          <select id='choice4' class="form-control input-sm"  name='choice4'>
                                                <option value="card">카드</option>
                                                <option value="trans">실시간계좌이체</option>
                                                <option value="vbank">가상계좌</option>
                                                <option value="phone">휴대폰 소액 결제</option>

                                                
                                          </select>
                                       </td>
                                    </tr>
                              
                                    <tr >
                                       <td colspan="7" style="text-align: center;">
                                       <button id="result-reservaiton" type="button" class="btn btn-success" name="button" >확인</button>
                                       <button style="display: none" id="remove-reservaiton" type="button" class="btn btn-danger" name="button">삭제</button>
                                       </td>
                                    </tr>
                              </tbody>
                              </table>
                           </div>

                        </div>
                     </div>
                     <!-- /.modal-content -->
               </form>
            </div>
            <!-- /.modal-dialog -->
         </div>
         <!-- /.modal mixer image -->
      </div>
   </div>
</div>   
<!-- leftEnd -->
<div id="border">
   <div id="line" class="three"></div>
</div>
<div id="right-side">
   <div style="position: fixed;">
      <ul>
         <li class="shop ">
            <div class="icon ">
               <img src="${path }/resources/icons/shop.svg" alt="">
            </div> Shop
         </li>
         <li class="map">
            <div class="icon">
               <img src="${path }/resources/icons/map.svg" alt="">
            </div> Map
         </li>
         <li class="reserve active">
            <div class="icon  active">
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
<!-- wrapper End -->

<!-- 푸터부분 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />