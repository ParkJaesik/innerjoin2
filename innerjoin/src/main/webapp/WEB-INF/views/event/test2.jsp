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
			
		});
	
		assignEvent();
		calendar.render();
		
		function assignEvent() {
			var events;
			$.each(calendar.getEvents(), function(i, v) {
				v.remove();
			});
			
			$.ajax({
				url: "<%=request.getContextPath()%>/ajaxTest",
				type: "get",
				dataType: "JSON",
				success: function(data) {
					console.log(data);
					$.each(data, function(i, v) {
						calendar.addEvent(v);
						
					});
					//events = data;
				}
			});
			
			return events;
		}
		
		
	
	});	
		
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
	
	<button id="next">클릭</button>

</body>
</html>