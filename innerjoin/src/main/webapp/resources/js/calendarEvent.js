/**   
 * 달력렌더링 
 * 일정등록폼
 */

// 달력 렌더링 이벤트 등록
document.addEventListener('DOMContentLoaded', function() {
   
   var calendarEl = document.getElementById('calendar');
   var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'list' ],
        height: "auto",
        contentHeight: 550,
        /*locale: 'ko',*/
      header: {
         left: 'prev,next today',
         center: 'title',
         right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
      },
      defaultView: 'dayGridMonth',
      // 달력에 기본으로 보이는 날짜는 현재날짜
      defaultDate: moment().format('YYYY-MM-DD'),
      navLinks: true, 
          // can click day/week names to navigate views
      // 달력화면에서 이벤트 수정 불가
      editable: false,
      // 하루에 기본으로 보여지는 이벤트 개수는 최대 2 (3미만)
      eventLimit: 3, 
          // allow "more" link when too many events
      eventColor: '#ed4c4a88',
      // 이벤트 클릭했을 때 실행할 액션
      eventClick: function(info) {
         /*info.jsEvent.preventDefault();
         
         if(info.event.url) {
            window.open(info.event.url);
         }*/
         console.log(info);
         
         var member = [{'path':'https://www.layoutit.com/img/sports-q-c-140-140-3.jpg', 'id':'user01'},
                  {'path':'https://www.layoutit.com/img/sports-q-c-140-140-3.jpg', 'id':'user02'}];
         
         console.log(member);
         var showView = showDetail(info.event, member);
         showView.attr('tabindex', -1).focus();
      }    
          
   });

   assignEvent(calendar.getDate().getMonth());
   
   // 달력 렌더링(화면에 출력)
   calendar.render();
   
   // 다음달, 이전달 버튼을 클릭했을 때 해당하는 이벤트 표시하기
   $(".fc-button").click(function() {
      
      var month = calendar.getDate().getMonth();
      
      assignEvent(month);
      
   }); 
   
   // 현재 달력에 표시되는 월에 해당하는 이벤트 등록하기
   function assignEvent(month) {
      var events;
      
      // 달력에 표시된 이벤트들 지우기
      $.each(calendar.getEvents(), function(i, v) {
         v.remove();
      });
      
      // DB에서 해당 이벤트 가져오기
      $.ajax({
         url: "ajaxTest.ij",
         type: "get",
         dataType: "JSON",
         data: {month: month},
         success: function(data) {
            console.log(data);
            
            // 이벤트 리스트를 달력에 추가
            $.each(data, function(i, v) {
               var event =   {title: v.eTitle, start: v.eStart, end: v.eEnd, address: '서울시 중구'}; 
               calendar.addEvent(event);
               console.log("event: " + event);
            });
         },
         error: function(err) {
            console.log(err);
         }
      });
      //return events;
   }
   
   
   var detailViewNum = 0;
   
   function showDetail(event, member) {
      console.log("show detail 시작");
      detailViewNum++;
      // 최종 생성 요소 추가할 부분
      var detailWrapperCol = $(".detailWrapper>div:nth-child(1)");
      
      var $eventDetail = $('<div>');
      $eventDetail.addClass('row eventDetail detailView' + detailViewNum);
      
      var $eventDetailCol = $('<div>');
      $eventDetailCol.addClass('col-md-12');
      
      // 이벤트상세보기 제목, 닫기버튼
      var $eventTitle = $('<div>');
      $eventTitle.addClass('row eventTitle');
      
      var $eventTitleCol1 = $('<div>');
      $eventTitleCol1.addClass('col-md-11');
      
      var $eventLabelTitle = $('<span>');
      $eventLabelTitle.addClass('eventLabel').append(event.title);
      $eventTitleCol1.append($eventLabelTitle);
      
      var $eventClose = $('<div>');
      $eventClose.addClass('col-md-1 eventClose');
      var $eventLabelClose = $('<span>');
      $eventLabelClose.addClass('eventLabel');
      var $closeImg = $('<img>');
      $closeImg.addClass('closeBtn detailView' + detailViewNum).attr('alt', '닫기').attr('src', 'resources/images/clear.png');
      $eventLabelClose.append($closeImg);
      $eventClose.append($eventLabelClose);
      $eventTitle.append($eventTitleCol1).append($eventClose);
      
      // 이벤트상세보기 구체적 정보
      var $eventInfo = $('<div>');
      $eventInfo.addClass('row eventInfo');
      
      var $eventInfoCol = $('<div>');
      $eventInfoCol.addClass('col-md-4');
      var $eventDay = $('<div>');
      $eventDay.addClass('eventDay');
      var $eventLabelDay = $('<span>');
      $eventLabelDay.addClass('badge badge-default eventLabel');
      $eventLabelDay.append('시간');
      
      var $eventStartEnd = $('<div>');
      var $eventStart = $('<span>');
      $eventStart.addClass('eventStart').append(event.start);

      var $eventEnd = $('<span>');
      $eventEnd.addClass('eventEnd').append(event.end);
      $eventStartEnd.append($eventStart).append(' - ').append($eventEnd);
      
      $eventDay.append($eventLabelDay).append($eventStartEnd);
   
      var $eventLocation = $('<div>');
      $eventLocation.addClass('eventLocation');
      
      var $eventLabelLoc = $('<span>');
      $eventLabelLoc.addClass('badge badge-default eventLabel').append('위치');
      var $address = $('<address>');
      $address.append(event.address);
      $eventLocation.append($eventLabelLoc).append($address);

      $eventInfoCol.append($eventDay).append($eventLocation);
   
      // 이벤트 상세보기 내용
      var $eventContent = $('<div>');
      $eventContent.addClass('col-md-4 eventContent');
      
      var $eventLabelContent = $('<span>');
      $eventLabelContent.addClass('badge badge-default eventLabel').append('내용');
      var $textarea = $('<textarea>');
      $textarea.attr('readonly');
      $textarea.attr('value', event.content);
      
      $eventContent.append($eventLabelContent).append($textarea);
      
      // 이벤트 참석 회원
      var $eventMember = $('<div>');
      $eventMember.addClass('col-md-4 eventMember');
      
      var $eventLabelMember = $('<span>');
      $eventLabelMember.addClass('badge badge-default eventLabel').append('참석회원');
      var $eventMemberCount = $('<span>');
      $eventMemberCount.addClass('badge badge-secondary').append(member.length);
      
      $eventMember.append($eventLabelMember).append($eventMemberCount);
      
      var flag = 0;
      for(var i = 0; i < member.length - 1 / 4; i++) {
         var $eventMemberCol = $('<div>');
         $eventMemberCol.addClass('col-md-12');
         var $memberRow = $('<div>');
         $memberRow.addClass('row');

         
         for(var j = 0; j < 4; j++) {
            var pos = i * 4 + j;
            if(pos >= member.length) {
               flag = 1;
               break;
            }
            
            var $member = $('<div>');
            $member.addClass('col-md-3 member');
            var $memberImg = $('<img>');
            $memberImg.attr('alt', '멤버프로필이미지').attr('src', member[pos].path);
            var $memberId = $('<span>');
            $memberId.addClass('memberId').append(member[pos].id);
            
            $member.append($memberImg).append($memberId);
            $memberRow.append($member);
         }
         
         $eventMemberCol.append($memberRow);
         if(flag == 1) $eventMember.append($eventMemberCol);
      }
      
      $eventInfo.append($eventInfoCol).append($eventContent).append($eventMember);
      $eventDetailCol.append($eventTitle).append($eventInfo);
      $eventDetail.append($eventDetailCol);
      detailWrapperCol.append($eventDetail);
      
      return $eventDetail;
   }
   
   
   $(document).on('click', '.closeBtn', function(event) {
      var className = event.target.className.split(' ')[1];
      console.log(className);
      
      $('.'+className).animate({opacity: 0});
      
      setTimeout(function() {
         $('.eventDetail:has('+className+')').remove();
      }, 400);
   });
});   


$(function() {
   // 현재시간 저장. 이벤트 등록폼의 시작일, 종료일에 디폴트로 설정.
   var defaultTime = moment().format('YYYY-MM-DDTHH:mm:ss');
   $('.eventDay input').val(defaultTime);
   
   // 이벤트 등록 버튼을 클릭하면 ajax로 데이터 전송.
   $("#addEventBtn").click(function() {
      // 폼의 데이터를 쿼리스트링으로 받음.
      var formData = $("form[name=eventForm]").serialize();
      
      $.ajax({
         url: 'addEvent.ij',
         data: formData,
         type: 'post',
         success: function(result) {
            console.log(result);   
            
            // 등록이 성공적으로 이루어질 경우 등록모달폼 초기화하고 숨기기.
            if(result > 0) {
               closeEventForm();
            }
         },
         error: function(err) {
            console.log(err);
         }
      });
   });
   
   
   // 이벤트 등록폼에서 취소버튼을 클릭하면 모달창 닫음.
   $("#cancelEventBtn").click(function() {
      closeEventForm();
   });
   
   /* $(".eventDay input").on("change", function() {
      console.log("날짜 입력 ");
      console.log("시작일 : " + $("#eStart").val());
      if($("#eStart").val() == "" && $("#eEnd").val() != "") {
         $("#eEnd").val($("#eStart").val());
         
      }

      if($("#eStart").val() != "" && $("#eEnd").val() == "") {
         $("#eStart").val($("#eEnd").val());
      
      }
   });  */
   
   // 이벤트 등록 폼의 제출버튼이나 취소버튼이 눌릴 때 폼의 데이터를 초기화하고 폼을 닫는다.
   function closeEventForm() {
      $("form[name=eventForm]")[0].reset();
      $('.eventDay input').val(defaultTime);
      $("#addEventForm").modal('hide');
   }

});
