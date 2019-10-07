<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src='https://code.jquery.com/jquery-3.4.1.min.js'></script>

<script src='http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js'></script>
<link href='${contextPath }/resources/css/event/core.css' rel='stylesheet' />
<link href='${contextPath }/resources/css/event/daygrid.css' rel='stylesheet' />
<link href='${contextPath }/resources/css/event/list.css' rel='stylesheet' />
<link href='${contextPath }/resources/css/event/timegrid.css' rel='stylesheet' />

<link href='${contextPath }/resources/css/event/calendarEvent.css' rel='stylesheet' />

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<script src='${contextPath }/resources/js/event/core.js'></script>
<script src='${contextPath }/resources/js/event/daygrid.js'></script>
<script src='${contextPath }/resources/js/event/timegrid.js'></script>
<script src='${contextPath }/resources/js/event/list.js'></script>
<script src='${contextPath }/resources/js/event/interaction.js'></script>

<script src='${contextPath }/resources/js/event/moment.js'></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <!-- bootstrap -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<link href="https://stackpath.bootstrapcdn.com/bootswatch/4.3.1/journal/bootstrap.min.css" rel="stylesheet" integrity="sha384-ciphE0NCAlD2/N6NUApXAN2dAs/vcSAOTzyE202jJx3oS8n4tAQezRgnlHqcJ59C" crossorigin="anonymous">


<!-- sweet alert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>

<style>
	.cancelBtn{
		color: white !important;
	}
	
	#swal2-content {
		font-size: 1em;
		font-weight: bold;
	}
</style>
</head>
<body>
	
	<div class="container-fluid group-schedule">
		<div class="row" id='calendar-container'>

	         <div id='calendar'></div>

		</div>
	</div>
	
	<script>
	
		document.addEventListener('DOMContentLoaded', function() {
			
			var date = moment().format('YYYY-MM');
			var calendarEl = document.getElementById('calendar');
			var calendar = new FullCalendar.Calendar(calendarEl, {
				plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'list' ],
		        height: "auto",
		        contentHeight: 450,
		        header: {
					left: 'prev,next today',
					center: 'title',
					right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
				},
				defaultView: 'dayGridMonth',
				defaultDate: moment().format('YYYY-MM-DD'),
				navLinks: true, 
				editable: false,
				// 하루에 기본으로 보여지는 이벤트 개수는 최대 2 (3미만)
				eventLimit: 2, 
				// allow "more" link when too many events
				eventColor: '#ed4c4a66',
				eventBorderColor: '#ed4c4a00',
				eventClick: function(info) {
			    	console.log(info);
					//var eno = info.event.classNames[info.event.classNames.length-1].split('_')[1];
			          
			        console.log("focus호출");
			        // $('div>.detailView_'+eno).attr('tabindex', -1).focus();
			        // $('div>.detailView_'+eno).removeAttr('tabindex');
					console.log("childNodes: ");
					var el = info.el.childNodes[0];
					console.log(el);
					var eno = info.event.id;
					console.log('eno: ' + eno);
					
					var $el = $(el);
					// 클릭이벤트 발생한 fc_content에 eno로 클래스네임 추가
					$el.addClass('eno_' + eno);
					console.log($el);
					$el.popover('show');
				}
			});
			
			assignEvent(getCalDate());
			calendar.render();
			
			$(".fc-button").click(function() {
				assignEvent(getCalDate());
			}); 
			
			
			function getCalDate() {
				return moment(calendar.getDate()).format('YYYY-MM');
			}
			
			function assignEvent(date) {
				var events;
				console.log("assignEvent: " + date);
				// 달력에 표시된 이벤트들 지우기
				$.each(calendar.getEvents(), function(i, v) {
					v.remove();
				});
		      
				// DB에서 해당 이벤트 가져오기
				$.ajax({
					url: "memberEventList.ij",
					type: "get",
					dataType: "JSON",
					data: {date: date},
					success: function(data) {
					eventInfoList = data;
					console.log("eventInfoList: ");
					console.log(eventInfoList);
		            
					// 이벤트 리스트를 달력에 추가
					$.each(data, function(i, v) {
						var event =   {title: v.eTitle, start: v.eStart, end: v.eEnd, classNames: 'gno_'+v.gno, id: v.eno}; 
						calendar.addEvent(event);
						console.log("event: ");
						console.log(event);
						});
					},
					error: function(err) {
						console.log(err);
					}
				});
			}
			
			$(".fc-content").popover({
				html: true,
				title: function() {
					var title = this.getElementsByClassName("fc-title")[0].textContent;
					return title;
				},
				content: function() {
					console.log("팝오버 this: ");
					console.log(this);
					var eno = this.classList[1].split('_')[1];
					console.log(eno);
					var groupBtn = "<a role='button' class='btn btn-primary groupBtn' href='calendar.ij?eno=" + eno +"'>모임으로</a>";
					var cancelBtn = "<a role='button' class='btn btn-secondary cancelBtn eno_" + eno + "' >취소하기</a>";
					//var link = "<a href='http://www.naver.com'>네이버</a>";
					console.log(groupBtn + cancelBtn);
					return groupBtn + " " + cancelBtn;
				},
				placement: "top",
				container: 'body',
				trigger: 'manual'
			});
			
			//$(".fc-content").attr('data-toggle','popover');
			
			$(document).on('click', '.cancelBtn', function(event) {
				// this: popover (button: 모임으로, 취소하기)
				var eno = this.classList[3].split('_')[1];
				console.log(eno);
				
				// 팝오버 다시 닫고, 팝오버 보여줄 때 추가했던 fc-content eno클래스 제거
				$('div.eno_'+eno).popover('hide');
				// 없어도 무방
				//$('div.eno_'+eno).removeClass('eno_'+eno);
			
				// 참석 모임 취소 동작
				$.ajax({
					url: 'cancelEvent.ij',
					data: {eno: eno},
					type: 'get',
					success: function(res) {
						console.log(res);
						if(res > 0) {
							alertMessage('참석 취소되었습니다.');
						}
					}, 
					error: function(err) {
						console.log(err);
						alertMessage('다시 시도해주세요.');
					} 
				});	 
			});		
			
			 
		});
	
		
		$(function () {
			$('.fc-content').attr('tabindex', '-1').attr('data-trigger', 'manual').attr('data-toggle', 'popover');
			//$('[data-toggle="popover"]').popover();
			
			$('.fc-day').on('click', function(e) {
				$('.fc-content').popover('hide');
				e.stopPropagation();
			});
			
		});
		
		function alertMessage(msg) {
			Swal.fire({
				text: msg,
				timer: 1500,
				showConfirmButton: false,
				padding: '0.8rem',
				width: '15rem'
			});
		}
	
		
    </script>  
    
</body>
</html>