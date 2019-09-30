<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src='http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js'></script>
<link href='${contextPath }/resources/css/core.css' rel='stylesheet' />
<link href='${contextPath }/resources/css/daygrid.css' rel='stylesheet' />
<link href='${contextPath }/resources/css/list.css' rel='stylesheet' />
<link href='${contextPath }/resources/css/timegrid.css' rel='stylesheet' />

<link href='${contextPath }/resources/css/calendarEvent.css' rel='stylesheet' />

<script src='${contextPath }/resources/js/core.js'></script>
<script src='${contextPath }/resources/js/daygrid.js'></script>
<script src='${contextPath }/resources/js/timegrid.js'></script>
<script src='${contextPath }/resources/js/list.js'></script>
<script src='${contextPath }/resources/js/interaction.js'></script>

<script src='${contextPath }/resources/js/moment.js'></script>
<!-- 
<script src='https://code.jquery.com/jquery-3.4.1.min.js'></script> -->

    <!-- bootstrap -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- 테마 sketch -->
   <!--  <link href="https://stackpath.bootstrapcdn.com/bootswatch/4.3.1/sketchy/bootstrap.min.css" rel="stylesheet" integrity="sha384-N8DsABZCqc1XWbg/bAlIDk7AS/yNzT5fcKzg/TwfmTuUqZhGquVmpb5VvfmLcMzp" crossorigin="anonymous">
 -->
    <!-- 한글글씨체 : sandoll -->
   <!--  <link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
    -->

</head>
<body>

    <div class="container-fluid group-schedule">

      <div calss="row" id='calendar-container'>
       
         <div id='calendar'></div>
      
       </div>
        <div class="row">
            <!-- modal -->
            <div class="col-md-12" id="addEventWrapper">
                <a id="openFormBtn" href="#addEventForm" role="button" class="btn btn-warning" data-toggle="modal">
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
                                <form role="form" name="eventForm" method="post">
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
                                                            <input type='number' id='eLimit' min="1" value="0" />
                                                        
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
       
      <!--    
      <div class="row detailWrapper">
         <div class="col-md-12">
            <div class="row eventDetail">
               <div class="col-md-6 eventThumbnail"></div>
               <div class="col-md-6 eventInfo"></div>
            </div>
         </div>
      </div>
       -->
      
      <!-- 이벤트 상세보기 영역 -->
       <div class="row detailWrapper" style="align:center">
         <div class="col-md-12">
         
            <!-- 이벤트 상세 -->
            <div class="row eventDetail">
               <div class="col-md-12">
                  <div class="row eventTitle">
                     <!-- <span class="badge badge-default eventLabel">제목</span> -->
                     <div class="col-md-11">
                        <span class="eventLabel">
                           놀자
                        </span> 
                     </div>
                     <div class="col-md-1 eventClose">
                        <span class="eventLabel">
                           <img class='closeBtn' alt='닫기' src='resources/images/cancel.png'>
                        </span>
                     </div>
                  </div>   
                  <div class="row  eventInfo">
                     <div class="col-md-4">
                        <div class="eventDay">
                           <span class="badge badge-default eventLabel">시간</span>
                           <div>
                              <span class="eventStart">2019-09-28</span> -
                              <span class="eventEnd">2019-09-30</span>
                           </div>
                        </div>
                        <div class="eventLocation">
                           <span class="badge badge-default eventLabel">위치</span>
                           <address>
                               <strong>Twitter, Inc.</strong><br /> 795 Folsom Ave, Suite 600<br /> San Francisco, CA 94107<br /> <abbr title="Phone">P:</abbr> (123) 456-7890
                           </address>
                        </div>
                     </div>
                     
                     <div class="col-md-4 eventContent">
                        <span class="badge badge-default eventLabel">내용</span>
                        <textarea readonly></textarea>
                     </div>
                     
                     <div class="col-md-4 eventMember">
                        <span class="badge badge-default eventLabel">참석 회원</span>
                        <span class="badge badge-secondary">16</span>
                        
                        <div class="col-md-12">
                           <div class="row">
                              <div class="col-md-3 member">
                                 <img alt="Bootstrap Image Preview" src="https://www.layoutit.com/img/sports-q-c-140-140-3.jpg" />
                                 <span class="memberId">user1</span>
                              </div>
                              <div class="col-md-3 member">
                                 <img alt="Bootstrap Image Preview" src="https://www.layoutit.com/img/sports-q-c-140-140-3.jpg" />
                                 <span class="memberId">user2</span>
                              </div>
                              <div class="col-md-3 member">
                                 <img alt="Bootstrap Image Preview" src="https://www.layoutit.com/img/sports-q-c-140-140-3.jpg" />
                                 <span class="memberId">user3</span>
                              </div>
                              <div class="col-md-3 member">
                                 <img alt="Bootstrap Image Preview" src="https://www.layoutit.com/img/sports-q-c-140-140-3.jpg" />
                                 <span class="memberId">user4</span>
                              </div>
                           </div>
                        </div>
                        <div class="col-md-12">
                           <div class="row">
                              <div class="col-md-3 member">
                                 <img alt="Bootstrap Image Preview" src="https://www.layoutit.com/img/sports-q-c-140-140-3.jpg" />
                                 <span class="memberId">user1</span>
                              </div>
                              <div class="col-md-3 member">
                                 <img alt="Bootstrap Image Preview" src="https://www.layoutit.com/img/sports-q-c-140-140-3.jpg" />
                                 <span class="memberId">user2</span>
                              </div>
                              <div class="col-md-3 member">
                                 <img alt="Bootstrap Image Preview" src="https://www.layoutit.com/img/sports-q-c-140-140-3.jpg" />
                                 <span class="memberId">user3</span>
                              </div>
                              <div class="col-md-3 member">
                                 <img alt="Bootstrap Image Preview" src="https://www.layoutit.com/img/sports-q-c-140-140-3.jpg" />
                                 <span class="memberId">user4</span>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   
   <!-- 달력렌더링과 이벤트등록폼에 적용할 js -->
   <script src='${contextPath }/resources/js/calendarEvent.js'></script>
    
    <!-- bootstrap js -->
    <!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
   

</body>
</html>