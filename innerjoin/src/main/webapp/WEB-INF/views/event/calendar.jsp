<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href='${contextPath }/resources/css/core.css' rel='stylesheet' />
<link href='${contextPath }/resources/css/daygrid.css' rel='stylesheet' />
<link href='${contextPath }/resources/css/list.css' rel='stylesheet' />
<link href='${contextPath }/resources/css/timegrid.css' rel='stylesheet' />

<script src='${contextPath }/resources/js/core.js'></script>
<script src='${contextPath }/resources/js/daygrid.js'></script>
<script src='${contextPath }/resources/js/timegrid.js'></script>
<script src='${contextPath }/resources/js/list.js'></script>
<script src='${contextPath }/resources/js/interaction.js'></script>
<!-- 
<script src='https://code.jquery.com/jquery-3.4.1.min.js'></script> -->

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
	
		console.log(calendar.getDate().getMonth());
		assignEvent(calendar.getDate().getMonth());
		
		calendar.render();
		
		$(".fc-button").click(function() {
			
			var month = calendar.getDate().getMonth();
			console.log(month);
			
			assignEvent(month);
			
		}); 
		
		function assignEvent(month) {
			var events;
			$.each(calendar.getEvents(), function(i, v) {
				v.remove();
			});
			
			$.ajax({
				url: "ajaxTest",
				type: "get",
				dataType: "JSON",
				data: {month: month},
				success: function(data) {
					console.log(data);
					$.each(data, function(i, v) {
						console.log("data[i]: " + v);
						console.log("날짜 : " + v.eStart);
						
						var event =	{title: v.eTitle, start: v.eStart, end: v.eEnd}; 
						
						calendar.addEvent(event);
						
						console.log("event: " + event);
						
					});
					//events = data;
				}
			});
			
			return events;
		}
		
	});	


/* 	$(function() {
		$("#calendar").fullCalendar({
				           
			selectable: true,
			eventLimit: false,
			lang: "ko",
		});
	}); */


</script>



    <!-- bootstrap -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- 테마 sketch -->
    <link href="https://stackpath.bootstrapcdn.com/bootswatch/4.3.1/sketchy/bootstrap.min.css" rel="stylesheet" integrity="sha384-N8DsABZCqc1XWbg/bAlIDk7AS/yNzT5fcKzg/TwfmTuUqZhGquVmpb5VvfmLcMzp" crossorigin="anonymous">

    <!-- 한글글씨체 : sandoll -->
    <link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
    <style>
        div {
            /* border : 1px solid red; */
        }

        #addEventWrapper *{
            font-family: 'Nanum Pen Script', cursive;

        }
        #openForm {
            bottom : 1rem;
            position: absolute;
            z-index: 1000;
            right: 1rem;
        }
        
        #openForm img {
        
            max-width: 1rem;
        } 

        .thumbnail-msg {
            margin-bottom: 0 !important;
        }

        .thumbnail-msg span {
            color: gray;
            font-size: 0.8em;
        }

        .eventDay {
            width: 50% !important;
            float : left;
            height: calc(1.5em + 2rem + 4px);
            padding-top : 0 !important;
        }

        .eventDay label {
            top:0 !important;
            font-size: 0.8em;
            margin-bottom: 0 !important;
            display: block !important;
        }
    
    	#calendar-container {
    		width: 800px;
    		height: 510px;
    		margin: 0 auto;
    	}
    </style>


</head>
<body>

	<jsp:include page="../common/menubar.jsp"/>

    <div class="container-fluid">

	<div id='calendar-container'>
    
		<div id='calendar'></div>
  
	</div>
	
	<span id="addEventButton">
		
	</span>
	
        <div class="row">
            <!-- modal -->
            <div class="col-md-12" id="addEventWrapper">
                <a id="openForm" href="#addEventForm" role="button" class="btn btn-warning" data-toggle="modal">
                	<img src="${contextPath }/resources/images/add_basic.png">
                </a>
                
                <div class="modal fade" id="addEventForm" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="myModalLabel">
									 일정 추가하기
                                </h5> 
                                <button type="button" class="close" data-dismiss="modal">
                                    <span aria-hidden="true">×</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <!-- <form role="form" action="eventAdd.kh"> -->
                                    <div class="row">
                                        <div class="col-md-12">
                                            <h5>
                                                coding group
                                            </h5>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <!-- <div class="row">
                                                        <div class="col-md-12">
                                                        </div>
                                                    </div> -->
                                                        <div class="form-group">
                                                            <label for="enventTitle">
																 제목
                                                            </label>
                                                            <input type="text" name="eTitle" class="form-control" id="eTitle" />
                                                        </div>

                                                        <!-- <div class="checkbox">
                                                            <label>
                                                                <input type="checkbox" /> Check me out
                                                            </label>
                                                        </div> -->
                                                        
                                                        <div class="form-group">
                                                            <label for="eventContent">
																 내용
                                                            </label><br>
                                                            <textarea name="eContent" class="form-control" id="eContent" cols="72" rows="10" style="resize: none;"></textarea>
                                                        </div>

                                                        <div class="form-group">
                                                            <!-- <p class="help-block thumbnail-msg">
                                                                <label for="eventThumbnail">
                                                                    images
                                                                </label>
                                                                <span> &nbsp;&nbsp;&nbsp;* 이벤트 썸네일을 등록해 주세요</span>
                                                            </p>
                                                            <input type="file" class="form-control-file" id="eventThumbnail" /> -->
                                                            <label for='eLimit'>
																최대 참석 가능 인원
                                                            </label> <br>
                                                            <input type='number' id='eLimit' min="1" />
                                                        
                                                        </div>

                                                        <div class="form-control eventDay">
                                                            <label for="eStart">
																시작일
                                                            </label>
                                                            <input type="datetime-local" name="eventStart" id="eStart">
                                                        </div>

                                                        <div class="form-control eventDay">
                                                            <label for="eventEnd">
																종료일
                                                            </label>
                                                            <input type="datetime-local" name="eventEnd" id="eEnd">
                                                        </div>
                                                    
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        
                                        <button type="button" id="addEventBtn"class="btn btn-warning">
											 등록
                                        </button> 
                                        <button type="button" class="btn btn-danger" data-dismiss="modal">
											취소
                                        </button>
                                    </div>
                                <!-- </form> -->
                            </div>
                        </div>    
                    </div>
                    
                </div>
                
            </div>
		</div>
    </div>
    
    <script>
    
    	$(function() {
	    	$("#addEventBtn").click(function() {
	    		var eTitle = $("#eTitle").val();
	    		var eContent = $("#eContent").val();
	    		var eStart = $("#eStart").val();
	    		var eEnd = $("#eEnd").val();
	    		var eLimit = $("#eLimit").val();
	    		
	    		$.ajax({
	    			url: 'addEvnet.ij',
	    			data: {eTitle: eTitle, eContent: eContent, eStart: eStart, eEnd: eEnd, eLimit: eLimit},
	    			type: 'get',
	    			success: function(result) {
	    				console.log(result);	
	    			},
	    			error: function(err) {
	    				console.log(err);
	    			}
	    		});
	    	});
    		
    	});
    
    </script>
    
    
    
    <!-- bootstrap js -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	

</body>
</html>