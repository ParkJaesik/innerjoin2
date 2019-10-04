<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src='https://code.jquery.com/jquery-3.4.1.min.js'></script>

<script src='http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js'></script>
<link href='${contextPath }/resources/css/core.css' rel='stylesheet' />
<link href='${contextPath }/resources/css/daygrid.css' rel='stylesheet' />
<link href='${contextPath }/resources/css/list.css' rel='stylesheet' />
<link href='${contextPath }/resources/css/timegrid.css' rel='stylesheet' />

<link href='${contextPath }/resources/css/calendarEvent.css' rel='stylesheet' />

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<script src='${contextPath }/resources/js/core.js'></script>
<script src='${contextPath }/resources/js/daygrid.js'></script>
<script src='${contextPath }/resources/js/timegrid.js'></script>
<script src='${contextPath }/resources/js/list.js'></script>
<script src='${contextPath }/resources/js/interaction.js'></script>

<script src='${contextPath }/resources/js/moment.js'></script>

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
				events: [
				   {
					 id : '10',
				     title  : 'event1',
				     start  : '2019-10-01'
				   },
				   {
					   id : '20',
				     title  : 'event2',
				     start  : '2019-10-02',
				     end    : '2019-10-05'
				   },
				   {
					   id : '30',
				     title  : 'event3',
				     start  : '2019-10-09T12:30:00',
				     allDay : false // will make the time show
				   }
				],
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
					
					$el.popover('show');
				}

			});

			calendar.render();
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
							Swal.fire({
								text: '참석 취소되었습니다.',
								timer: 1500,
								showConfirmButton: false,
								padding: '0.8rem',
								width: '15rem'
							});
						}
					}, 
					error: function(err) {
						console.log(err);
						Swal.fire({
							text: '다시 시도해주세요',
							timer: 1500,
							showConfirmButton: false,
							padding: '0.8rem',
							width: '15rem'
						});
					} 
				});	 
			});		
			
		});
	
		
		$(function () {
			$('.fc-content').attr('tabindex', '-1').attr('data-trigger', 'manual');
			//$('[data-toggle="popover"]').popover();
			
			$('.fc-day').on('click', function(e) {
				$('.fc-content').popover('hide');
				e.stopPropagation();
			});
			 
			
		});
	

		

    </script>  
    

</body>
</html>