<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src='http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js'></script>
<link href='${contextPath }/resources/css/event/core.css' rel='stylesheet' />
<link href='${contextPath }/resources/css/event/daygrid.css' rel='stylesheet' />
<link href='${contextPath }/resources/css/event/list.css' rel='stylesheet' />
<link href='${contextPath }/resources/css/event/timegrid.css' rel='stylesheet' />

<link href='${contextPath }/resources/css/event/calendarEvent.css' rel='stylesheet' />

<script src='${contextPath }/resources/js/event/core.js'></script>
<script src='${contextPath }/resources/js/event/daygrid.js'></script>
<script src='${contextPath }/resources/js/event/timegrid.js'></script>
<script src='${contextPath }/resources/js/event/list.js'></script>
<script src='${contextPath }/resources/js/event/interaction.js'></script>

<script src='${contextPath }/resources/js/event/moment.js'></script>

<script src='https://code.jquery.com/jquery-3.4.1.min.js'></script>

    <!-- bootstrap -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- 테마 sketch -->
   <!--  <link href="https://stackpath.bootstrapcdn.com/bootswatch/4.3.1/sketchy/bootstrap.min.css" rel="stylesheet" integrity="sha384-N8DsABZCqc1XWbg/bAlIDk7AS/yNzT5fcKzg/TwfmTuUqZhGquVmpb5VvfmLcMzp" crossorigin="anonymous">
 -->
 <link href="https://stackpath.bootstrapcdn.com/bootswatch/4.3.1/journal/bootstrap.min.css" rel="stylesheet" integrity="sha384-ciphE0NCAlD2/N6NUApXAN2dAs/vcSAOTzyE202jJx3oS8n4tAQezRgnlHqcJ59C" crossorigin="anonymous">
    <!-- 한글글씨체 : sandoll -->
   <!--  <link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
    -->


<!-- sweet alert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>


</head>
<body>


	<div class="container-fluid group-schedule">

		<div calss="row" id='calendar-container'>
       
			<div id='calendar'></div>
      
		</div>
       
		<%-- <c:if test="${groupMem.levelCode == 0}" > --%>
		<!-- 그룹멤버의 레벨 받아오기. 그룹페이지 기본정보 jsp에서 받아올 것. 현재 가데이터 세팅 -->
		<c:set var="levelCode" value="0"/>
		<!-- 현재 그룹의 번호 받아오기. 가데이터 세팅 -->
		<c:set var="gno" value="1"/>
		
		<c:if test="${levelCode == 0}" >
			<div class="row">
	            <!-- modal -->
	            <div class="col-md-12" id="addEventWrapper">
	                <a id="openFormBtn" href="#addEventForm" role="button" class="btn btn-primary disabled" data-toggle="modal">
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
	                                    <span aria-hidden="true"><img class='closeBtn' src='resources/images/close.png'></span>
	                                </button>
	                            </div>
	                            <div class="modal-body">
	                                <form role="form" name="eventForm" method="post">
	                                	<!-- gno 함께 넘겨줌. -->
										<input type='hidden' name='gno' value='${gno }'>
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
	                                                            <input type='number' name='eLimit' id='eLimit' min='1' value='1' max='50'/>
	                                                        
	                                                        </div>
	
	                                                        <div class="form-control eventDay">
	                                                            <label for="eStart">
																	시작일
	                                                            </label>
	                                                            <input type="datetime-local" name="eStart" id="eStart">
	                                                        </div>
	
	                                                        <div class="form-control eventDay">
	                                                            <label for="eventEnd">
																	종료일
	                                                            </label>
	                                                            <input type="datetime-local" name="eEnd" id="eEnd">
	                                                        </div>
	                                                    
	                                                    </div>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                    <div class="modal-footer">
	                                        
	                                        <button type="button" id="addEventBtn" class="btn btn-warning">
												등록
	                                        </button> 
	                                        <button type="button" id="cancelEventBtn" class="btn btn-danger" data-dismiss="modal">
												취소
	                                        </button>
	                                    </div>
	                                </form>
	                            </div>
	                        </div>    
	                    </div>
	                </div>
	            </div>
			</div>
	    </c:if>
       
      <!-- 이벤트 상세보기 영역 -->
       <div class="row detailWrapper" style="align:center">
         <div class="col-md-12">
         
            
         </div>
      </div>
   </div>
   
	<script>
		console.log("levelCode: ${levelCode}");
	</script>
   <%-- 
	<!-- 달력렌더링과 이벤트등록폼에 적용할 js -->
	<script src='${contextPath }/resources/js/event/calendarEvent.js'></script> --%>
    
    <!-- bootstrap js -->
    <!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
   

</body>
</html>