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
      var reservaiton = [{
          id: '1',
          resourceId: 'a',
          start: '2018-04-06',
          end: '2018-04-08',
          title: 'event 1'
        },
        {
          id: '2',
          resourceId: 'a',
          start: '2018-04-07T09:00:00',
          end: '2018-04-07T14:00:00',
          title: 'event 2'
        },
        {
          id: '3',
          resourceId: 'b',
          start: '2018-04-07T12:00:00',
          end: '2018-04-08T06:00:00',
          title: 'event 3'
        },
        {
          id: '4',
          resourceId: 'c',
          start: '2018-04-07T07:30:00',
          end: '2018-04-07T09:30:00',
          title: 'event 4'
        },
        {
          id: '5',
          resourceId: 'd',
          start: '2018-04-07T10:00:00',
          end: '2018-04-07T15:00:00',
          title: 'event 5'
        },
        {
          id: '6',
          resourceId: 'a',
          start: '2018-07-24T10:00:00',
          end: '2018-07-24T10:30:00',
          color: 'rgb(49, 128, 208)',
          title: '홍성진',
          description: '- a 디자이너님 예약'
        }, {
          id: '7',
          resourceId: 'b',
          start: '2018-07-24T10:30:00',
          end: '2018-07-24T11:00:00',
          title: '홍성진',
          description: '- a 디자이너님 예약'
        },
        {
          id: '8',
          resourceId: 'c',
          start: '2018-07-24T11:30:00',
          end: '2018-07-24T12:00:00',
          title: '홍성진',
          description: '- a 디자이너님 예약'
        },
        {
          id: '9',
          resourceId: 'c',
          start: '2018-07-24T12:30:00',
          end: '2018-07-24T13:00:00',
          title: '홍성진',
          description: '- a 디자이너님 예약'

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
          title: '디자이너',
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
          title: '디자이너',
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



      $('#calendar').fullCalendar({
        themeSystem: 'bootstrap3',

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
        displayEventTime: false,


        editable: true, //드래그해서 움직이는것
        eventLimit: true, // allow "more" link when too many events
        displayEventTime: true,

        navLinks: true, // can click day/week names to navigate views
        businessHours: false,



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
      			      var now = new Date
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
              				$('#calendarModal').modal();
              				$('#designer').html(resource.title);
			  				$('#reserDate').html(date.format('YYYY년MM월DD일 HH시mm분'));
      		  				}
         				    else{
         				    	alert('로그인을 해주세요');
         				    	//로그인페이지로보내기.........할까말까
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
            });
            $(document).keyup(function(e) {
              if(e.keyCode==27){
                date=null;
              }
            });
        }

          $("#result-reservaiton").one('click', function() {

        	     var title = $('#reservation-userName').val();
                 var description = title + "-" +resource.title + "디자이너 님 예약-";
                 var id = $('#reservation-id').val();
                 var choice1 = $('#choice1 option:selected').val();
                 var choice2 = $('#choice2 option:selected').val();
              //   var choice_employee = $('#choice-employee').val();
        	  
        	  
            /*받아오기
            var title = $('#reservation-userName').val();
            var description = title + "-" + $('select[name=choice-employee]').val() + "디자이너 님 예약"
            var id = $('#reservation-id').val();
            var choice1 = $('#choice1').val();
            var choice2 = $('#choice2').val();
            var choice_employee = $('#choice-employee').val();

            //reservation 객체 추가로직
            var aJson = new Object();
            aJson.id = '8';
            aJson.resourceId = 'a';
            aJson.start = '2018-07-28T13:15:00';
            aJson.end = '2018-07-28T15:15:00';
            aJson.color = 'rgb(49, 128, 208)';
            aJson.title = '홍성진님 예약'
            reservaiton.push(aJson);

            /*30분 추가*/
            console.log("check"+choice2);
            var reser_end_time = Date.parse(date);
            //alert(javaScriptRelease + 1800000);
            reser_end_time += (1800000 * 2); //시간으로바꾸기
      //      reser_end_time=new Date(reser_end_time);

          
         	console.log(new Date(reser_end_time));
          //  date+=date._i[5]+30;
          //  console.log(new Date(date));
            	var store_reserve = { 
					    			member_pk: "${memberLoggedIn.memberPk}",
            			 			member_name:"${memberLoggedIn.memberName}",
					    			store_pk: store_pk,
					    			menu_pk: choice2,
					    			designer:resource.title, //pk로 던저줄지는 생각해봐야함..			
					    			reserve_start_time:date,	 			
					    			reserve_end_time:date 			
									}

		    	  var jsonData = JSON.stringify(store_reserve);
  		     		 jQuery.ajaxSettings.traditional = true;
			 $.ajax({
 	 	        type: "POST",
			 	url:"${path}/reserve/storeReserveInsert.do",
 	 	        data: {"store_reserve":jsonData},
 				dataType: "json",
 	 	        success: function (data) {
 	 	          /*화면에 등록시키기*/
 	 	            $('#calendar').fullCalendar('renderEvent', {
 	 	              title: title,
 	 	              start: date, //specify start date
 	 	              id: '10',//member_pk; 예약아이디로....
 	 	              description: description,
 	 	              resourceId: resource.id,
 	 	              end: reser_end_time
 	 	            });
 	 	        },
 	 	        error: function (e) {
 	 	            console.log("ERROR : ", e);
 	 	        }

 	      	 });
            
          });
        //  date=null;


        },



        eventClick: function(calEvent, jsEvent, view) {
          $('#reserDate').html(calEvent.start.format('YYYY년MM월DD일 HH시mm분'));
          //  var check = calEvent.choice1;
          console.log(jsEvent);
          //$("#choice1").val("Someoranges").attr("selected", "selected");


          //$('#choice1').val(calEvent.choice1).prop("selected", true);;
          //$('#choice2').option(calEvent.choice2).attr("selected", "selected");
          //$('#choice_employee').val(calEvent.choice_employee).attr("selected", "selected");

          $('#calendarModal').modal();

          /*alert('Event: ' + calEvent.start.format());
          alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
          alert('View: ' + view.name);*/
          $('#remove-reservaiton').one('click', function() {
            //var check = prompt("예약비밀번호입력");
            var check1 = confirm("삭제하시겠습니까?")
            if (check1 == true) {
              $('#calendar').fullCalendar('removeEvents', calEvent.id);
              $('#calendarModal').modal('toggle');
            }
          })
        },

        /*$('#calendar').fullCalendar('option', {
          businessHours: [{
              dow: [0, 1, 2, 3, 4, 5, 6],
              start: '09:00',
              end: '11:00'
            }, {
              dow: [0, 1, 2, 3, 4, 5, 6],
              start: '09:00',
              end: '11:00'
            },
            {
              dow: [0, 1, 2, 3, 4, 5, 6],
              start: '09:00',
              end: '11:00'
            }
          ]
        });*/





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
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">×</button>
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
														<input type="hidden" id="reservation-userName"
														name="reservation-userName" value="홍성진" /> <input
														type="hidden" id="reservation-id" name="reservation-id"
														value="10" />
													</td>
												</tr>

												<tr>
													<td colspan="1"><label for="sel1">시술선택 :</label></td>
													<td colspan="1" style="width: 72">
													<select class="form-control input-sm" id="choice1" name='choice1'>
															<!--점주레벨이 아니면 disabled-->
															<option value="손">손</option>
															<option value="발">발</option>
													</select></td>
												
													<td colspan="3" id="choice2" style="width: 172px;">
														<select  id='choice2' class="form-control input-sm"  name='choice2'>
															<!--점주레벨이 아니면 disabled-->
															<c:forEach var="menu" items="${menuList}">
																<c:if test="${menu.menu_check eq '손'}">
																<option value="${menu.menu_pk}">${menu.menu_name}(${menu.menu_info})&nbsp;&nbsp;${menu.menu_price} 원</option>
																</c:if>
															</c:forEach>
															
														</select>
													</td>
													
													<td  colspan="3" id="choice3"style="width: 172px; display: none;">
														<select id='choice2' class="form-control input-sm"  name='choice2'>
															<!--점주레벨이 아니면 disabled-->
															<c:forEach var="menu" items="${menuList}">
																<c:if test="${menu.menu_check eq '발'}">
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
																			$('#choice2').css("display", "none");  
																			$('#choice3').css("display", "inline-block");  
																		}
																		else{
																			$('#choice2').css("display", "inline-block");  
																			$('#choice3').css("display", "none");  
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
										
												<tr >
													<td colspan="7" style="text-align: center;">
													<button id="result-reservaiton" type="button" class="btn btn-success" name="button" >확인</button>
													<c:if test="${memberLoggedIn.memberLevel<=2}">
													<button id="remove-reservaiton" type="button" class="btn btn-danger" name="button">삭제</button>
													</c:if>
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
