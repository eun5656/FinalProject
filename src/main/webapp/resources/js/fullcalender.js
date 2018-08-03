$(function() {
				//영업시작시간~~
				var min = '10:00:00';
				var max = '23:00:00';
				var reserDate;
				var startTime;
				var endTime;
				var checkDate;
				//직원휴일
				var businessHours = [{
					start: '2018년07월30일',
					end: '2018년07월30일',
				}];
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
						eventColor: 'blue'
					},
					{
						id: 'b',
						title: '디자이너',
						eventColor: 'green',

					},
					{
						id: 'c',
						title: '디자이너',
						eventColor: 'orange',
						businessHours: businessHours
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

					select: function() {
						dayClick();
					},

					lang: "ko",

					//shows time in 15 min slot
					slotDuration: '00:30:00',
					slotLabelInterval: 30,
					slotLabelFormat: 'a HH :mm ',


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

						var now = new Date
						var nowDate = new Date(now.getFullYear(), now.getMonth(), now.getDate(), now.getHours() + 1, now.getMinutes());
						//console.log("nowDate" + nowDate);
						console.log("nowDate" + nowDate);


						console.log(
							'dayClick',
							reserDate = date.format(),
							resource ? resource.id : '(no resource)'
						);
						console.log('reserDate ' + reserDate);
						console.log('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
						console.log('Current view: ' + view.name);
						console.log('Clicked on: ' + date.format('YYYY년MM월DD일'));
						//console.log(resource.businessHours[0].start);
						//console.log(resource.businessHours[0].end);
						console.log(date.format());
						$('#reserDate').html(date.format('YYYY년MM월DD일 HH시mm분'));
						var clickDate = date.format('YYYY년MM월DD일');

						var checkDate = new Date(date.format());


						// 현재날짜이전이면 못가게 로직처리하기

						console.log("nowDate" + nowDate);
						console.log("checkDate" + checkDate);
						if (resource != null) {
							/*쉬는날 로직*/
							if (resource.businessHours != null) {
								if (resource.businessHours[0].start == clickDate || resource.businessHours[0].end == clickDate) {
									alert("휴무입니다.");
									//window.location.reload();
									date = null;
								} else {
									//현재날짜면 예약불가로.
									if (nowDate <= checkDate) {
										$('#calendarModal').modal();
									} else {
										date = null;
										alert("예약시간이 아닙니다...");
									}
								}
							} else {
								//현재날짜면 예약불가로.
								if (nowDate <= checkDate) {
									$('#calendarModal').modal();
								} else {
									date = null;
									alert("예약할수 없는 날짭입니다..");
								}
							}
						}
						//var title =$('select[name=choice1]').val()
						var title = $('#reservation-userName').val();
						var description = title + "-" + $('select[name=choice-employee]').val() + "디자이너 님 예약"
						var id = $('#reservation-id').val();
						var choice1 = $('#choice1').val();
						var choice2 = $('#choice2').val();
						var choice_employee = $('#choice-employee').val();

						/*    var eventData;
						    if (title) {
						      eventData = {
						        title: title,
						        start: date
						      };
						      $('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
						    }
						    $('#calendar').fullCalendar('unselect');*/

						$("#result-reservaiton").one('click', function() {
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
							console.log(reservaiton);
							var javaScriptRelease = Date.parse(date);
							//alert(javaScriptRelease + 1800000);
							javaScriptRelease += 1800000;

							/*화면에 등록시키기*/
							$('#calendar').fullCalendar('renderEvent', {
								title: title,
								start: date, //specify start date
								id: '10',
								description: description,
								resourceId: resource.id,
								end: javaScriptRelease

							});

						});

					},


					eventClick: function(calEvent, jsEvent, view) {
						$('#reserDate').html(calEvent.start.format('YYYY년MM월DD일 HH시mm분'));
						var check = calEvent.choice1;
						console.log(typeof calEvent.choice_employee);
						$('#calendarModal').modal();
						$('#remove-reservaiton').one('click', function() {
							//var check = prompt("예약비밀번호입력");
							var check1 = confirm("삭제하시겠습니까?")
							if (check1 == true) {
								$('#calendar').fullCalendar('removeEvents', calEvent.id);
								$('#calendarModal').modal('toggle');
							}
						})
					},

				});

			});