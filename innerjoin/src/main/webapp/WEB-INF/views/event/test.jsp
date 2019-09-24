<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script src='js/moment_main.js'></script> -->
<script src='https://code.jquery.com/jquery-3.4.1.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js'></script> 

<link href='css/core_main.css' rel='stylesheet' />
<link href='css/daygrid_main.css' rel='stylesheet' />
<link href='css/list_main.css' rel='stylesheet' />
<link href='css/timegrid_main.css' rel='stylesheet' />

<script src='js/core_main.js'></script>
<script src='js/daygrid_main.js'></script>
<script src='js/timegrid_main.js'></script>
<script src='js/list_main.js'></script>
<script src='js/interaction_main.js'></script>


<script>


	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'list' ],
	  						height: 'parent',
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
			},
			defaultView: 'dayGridMonth',
			defaultDate: moment().format('YYYY-MM-DD'),
	  
			navLinks: true, 
			    // can click day/week names to navigate views
			editable: false,
			eventLimit: 3, 
			    // allow "more" link when too many events
			eventSources: [{
				events: [
					{title: 'All Day Event1',	start: '2019-08-01'},
					{title: 'All Day Event2',	start: '2019-08-01'},
					{title: 'All Day Event3',	start: '2019-08-01'},
					{title: 'All Day Event4',	start: '2019-08-01'},
					{title: 'Long Event', start: '2019-08-07', end: '2019-08-10'},
					{groupId: 999, title: 'Repeating Event', start: '2019-08-09T16:00:00'},
					{groupId: 999, title: 'Repeating Event', start: '2019-08-16T16:00:00'},
					{title: 'Conference', start: '2019-08-11', end: '2019-08-13'},
					{title: 'Meeting', start: '2019-08-12T10:30:00', end: '2019-08-12T12:30:00'},
					{title: 'Lunch', start: '2019-08-12T12:00:00'},
					{title: 'Meeting', start: '2019-08-12T14:30:00'},
					{title: 'Happy Hour', start: '2019-08-12T17:30:00'},
					{title: 'Dinner', start: '2019-08-12T20:00:00'},
					{title: 'Birthday Party', start: '2019-08-13T07:00:00'},
					{title: 'Click for Google', url: 'http://google.com/', start: '2019-08-28'}
				]
			
			
			}]
			
		});
	
		calendar.render();
	
		// delete test
		$("#deleteBtn").click(function() {
			
			$.each(calendar.getEvents(), function(i, v) {
				v.remove();
			});
		});
		
		
	});	
	
		
		
		/* 	$(".fc-prev-button").on("click", function() {
			  //alert("!!!");
			  getViewDate();
			});
			$(".fc-next-button").on("click", function() {
			  //alert("next!!!");
			  getViewDate();
			});
			$(".fc-today-button").on("click", function() {
			  //alert("next!!!");
			  getViewDate();
			});
			 
			function renderCalcEvent(data) {
			  for (var i = 0; i < data.length; i++) {
			    var locIdx = data[i].locationIdx;
			    var eventIdx = data[i].eventIdx;
			    var sdate = new Date(data[i].regDt).toString();
			    var edate = new Date(data[i].regDt).toString();
			    var col = "blue";
			    var date = data[i].regDt;
			 
			    var event = {
			      id: data[i].eventIdx,
			      title: data[i].locationName,
			      url: '/',
			      start: moment(data[i].regDt),
			      allDay: false,
			      color: col
			    };
			 
			    $('#calendar').fullCalendar('renderEvent', event);
			  }
			}

			*/
/* 	
	function assignEvent() {
		var eventData = 
		
		$('#calendar').fullCalendar('renderEvent', eventData, true);

	} */

	/* function calEvent(dayObj, locationIdx) {
		  url = "/";
		  $.ajax({
		    dataType: "json",
		    data: dayObj,
		    method: "POST",
		    url: url,
		    async: false,
		    success: function(data) {
		      if (data.state == "success") {
		        renderCalcEvent(data.calEvent);
		      }
		    },
		    error: function(request, status, error) {
		      alert("code:" + request.status + "\n" + "message:" +
		        request.responseText + "\n" + "error:" +
		        error);
		    }
		  });
		}
		 
		function getViewDate() {
		  var date = $('#calendar').fullCalendar('getView');
		  console.log(date.intervalStart.format('YYYY-MM-DD'));
		  console.log(date.intervalEnd.subtract(1, "days").format('YYYY-MM-DD'));
		  var monthObj = {
		    startDate: date.intervalStart.format('YYYY-MM-DD'),
		    endDate: date.intervalEnd.subtract(1, "days").format('YYYY-MM-DD')
		  };
		  $('#calendar').fullCalendar('removeEvents');
		  calEvent(monthObj, '');
		}

   */
	


</script>


</head>
<body>

	<div id='calendar-container'>
    
		<div id='calendar'></div>
  
	</div>
	
	<hr>
	
	<button id="deleteBtn">클릭</button>

</body>
</html>