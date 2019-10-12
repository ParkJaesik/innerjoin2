/**   
 * 달력렌더링 
 * 일정등록폼
 */


// 달력 렌더링 이벤트 등록
document.addEventListener('DOMContentLoaded', function() {
	// 일정관리에 필요한 변수 초기화
	// 1. detail이 나오는 eno 리스트. detail이 중복으로 보여지지 않기 위해.
	// 2. 현재 달력에 표시되는 이벤트들의 정보 리스트
	// 3. 회원이 참석하는 모임 리스트 담을 변수;
	var detailViewSet = new Set();
	var eventInfoList; 
	var attendEventList = [];
   
	var calendarEl = document.getElementById('calendar');
	var calendar = new FullCalendar.Calendar(calendarEl, {
		plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'list' ],
		height: "auto",
		contentHeight: 450,
        /*locale: 'ko',*/
		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'dayGridMonth,listWeek'
/*				right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
*/		},
//      titleFormat: {
//    	  month: "yyyy년 MMMM",
//    	  week: "[yyyy] MMM dd일{ [yyyy] MMM dd일}",
//    	  day: "yyyy년 MMM d일 dddd"
//      },
//      monthNames: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
//      monthNamesShort: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
//      dayNames: ["일요일","월요일","화요일","수요일","목요일","금요일","토요일"],
//      dayNamesShort: ["일","월","화","수","목","금","토"],
//      buttonText: {
//    	  today : "오늘",
//    	  month : "월별",
//    	  week : "주별",
//    	  day : "일별",
//      },
//      timeFormat : "HH:mm",

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
//		eventColor: '#ed4c4a66',
		eventColor: '#ed776a55',
		eventBorderColor: '#ed776a22',
		// 이벤트 클릭했을 때 실행할 액션. 이벤트 상세정보 DB에서 가져와 하단에 div 생성.
		eventClick: function(info) {
			console.log(info);
			var eno = info.event.classNames[info.event.classNames.length-1].split('_')[1];

			showEventDetail(eno);
			
		},
		eventTimeFormat: { // like '14:30:00'
			hour: '2-digit',
			minute: '2-digit',
			meridiem: false
		}
	});

	eventSetting();
   
	// 달력 렌더링(화면에 출력)
	calendar.render();
   
	// 다음달, 이전달 버튼을 클릭했을 때 해당하는 이벤트 표시하기
	$(".fc-button").click(function() {
		eventSetting();
	}); 
   
	// 달력 액션시 새로 세팅되어야 하는 함수들
	function eventSetting() {
		var calDate = getCalDate();
		// 해당 모임의 gno값 가져오기
		var gno = $("#gNo").val();
		assignEvent(calDate);
		getAttendEventList(calDate);
	}
	
	// 현재 달력 날짜 'YYYY-MM' 포맷으로 리턴
	function getCalDate() {
		return moment(calendar.getDate()).format('YYYY-MM');
	}
   
	// 현재 달력에 표시되는 월에 해당하는 이벤트 등록하기
	function assignEvent(date) {
		var events;
		var gno = $("#gNo").val();
		console.log("assignEvent: " + date);
		// 달력에 표시된 이벤트들 지우기
		$.each(calendar.getEvents(), function(i, v) {
			v.remove();
		});
		// DB에서 해당 이벤트 가져오기
		$.ajax({
			url: "renderEvent.ij",
			type: "get",
			dataType: "JSON",
			data: {date: date, gno: gno},
			success: function(data) {
				eventInfoList = data;
				console.log("eventInfoList: ");
				console.log(eventInfoList);
	            
				// 이벤트 리스트를 달력에 추가
				$.each(data, function(i, v) {
					var event =   {title: v.eTitle, start: v.eStart, end: v.eEnd, classNames: 'showDetail_'+v.eno}; 
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


	// loginUser의 참석 모임 리스트 
	function getAttendEventList(date) {
		console.log("date: " +date);
		//var gno = ${gno};
		var gno = $("#gNo").val();
		// loginUser의 memberId값은 controller에서 세팅.
		$.ajax({
			url: 'getAttendEventList.ij',
			data: {date: date, gno : gno},
			type: 'get',
			dataType: 'json',
			success: function(res) {
				attendEventList = res;
				console.log("result : " + attendEventList);
			},
			error: function(err) {
				console.log(err);
			}
			   
		});
	}
	
	// 이벤트 클릭하면 이벤트 디테일과 참석회원 정보 가져와서 디테일 뷰를 보여줌.
	function showEventDetail(eno) {
		console.log("새로 멤버 정보 가져오기");
		if(!detailViewSet.has(eno)) {
			var event = eventDetail(eno);
			var member = eventMemberList(eno);
			console.log('showEventDetail');
			console.log(event);
			console.log(member);
			var showView = detailView(event, member);
			$('div>.detailView_'+eno).attr('tabindex', -1).focus();
			$('div>.detailView_'+eno).removeAttr('tabindex');
		}
		console.log("focus호출");
		$('div>.detailView_'+eno).attr('tabindex', -1).focus();
		$('div>.detailView_'+eno).removeAttr('tabindex');
	}
	// 해당 이벤트의 상세정보
	function eventDetail(eno) {
		var event;
		$.ajax({
			url: 'eventDetail.ij',
			type: 'get',
			data: {eno: eno},
			dataType: 'json',
			async : false,
			success: function(result) {
				console.log(eno + ' event detail: ');
				console.log(result);
				event = result;
			},
			error: function(err) {
				console.log(err);
				event = null;
			}
		});
		return event;
	}
	// 해당 이벤트의 참석자 정보
	function eventMemberList(eno) {
		var member;
		$.ajax({
			url: 'attendMember.ij',
			type: 'get',
			data: {eno: eno},
			dataType: 'json',
			async : false,
			success: function(mList) {
				console.log('mList: ');
				console.log(mList);
				member = mList;
			},
			error: function(err) {
				console.log(err);
				member = null;
			}
		});
		return member;
	}
   
	// 달력 이벤트 클릭했을 때 detail 보여주기. 동적으로 태그 추가
	function detailView(event, member) {
		console.log("show detail 시작");
		console.log(event);
		console.log(member);
		// 최종 생성 요소 추가할 부분
		console.log("detailView: ");
		detailViewSet.add(String(event.eno));
		var detailWrapperCol = $(".detailWrapper>div:nth-child(1)");
		  
		var $eventDetail = $('<div>');
		$eventDetail.addClass('row eventDetail detailView_' + event.eno);
		  
		var $eventDetailCol = $('<div>');
		$eventDetailCol.addClass('col-md-12');
		  
		// 이벤트상세보기 제목, 닫기버튼
		var $eventTitle = $('<div>');
		$eventTitle.addClass('row eventTitle');
		  
		var $eventTitleCol1 = $('<div>');
		$eventTitleCol1.addClass('col-md-10');
		  
		var $eventLabelTitle = $('<span>');
		$eventLabelTitle.addClass('eventLabel').append(event.eTitle);
		$eventTitleCol1.append($eventLabelTitle);
		  
		var $eventClose = $('<div>');
		$eventClose.addClass('col-md-2 eventClose');
		var $eventLabelClose = $('<span>');
		$eventLabelClose.addClass('eventLabel');
		var $closeImg = $('<img>');
		$closeImg.addClass('closeBtn detailView_' + event.eno).attr('alt', '닫기').attr('src', 'resources/images/close.png');
		var $checkImg = $('<img>');
		$checkImg.addClass('checkBtn detailView_' + event.eno).attr('alt', '참석')
				.attr('src', 'resources/images/check.jpg');
		$eventLabelClose.append($closeImg).append($checkImg);
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
		$eventStart.addClass('eventStart').append(event.eStart);
		
		var $eventEnd = $('<span>');
		$eventEnd.addClass('eventEnd').append(event.eEnd);
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
		$textarea.append(event.eContent);
		  
		$eventContent.append($eventLabelContent).append($textarea);
		
		var $eventMember = eventMemberDetail(event, member);
      
		$eventInfo.append($eventInfoCol).append($eventContent).append($eventMember);
		$eventDetailCol.append($eventTitle).append($eventInfo);
		$eventDetail.append($eventDetailCol);
		detailWrapperCol.append($eventDetail);
      
		
	}
	
	function eventMemberDetail(event, member) {
		// 이벤트 참석 회원
		var $eventMember = $('<div>');
		$eventMember.addClass('col-md-4 eventMember');
	  
		var $eventLabelMember = $('<span>');
		$eventLabelMember.addClass('badge badge-default eventLabel').append('참석회원');
		
		var $eventMemberLabel = $('<span>');
		$eventMemberLabel.addClass('eventMemberLabel');
		var $eventMemberCount = $('<span>');
		$eventMemberCount.addClass('badge badge-dark eventLabel').append(event.eMemCount);
		var $eventLimit = $('<span>');
		$eventLimit.addClass('badge badge-dark eventLabel').append(event.eLimit);
		 
		$eventMemberLabel.append($eventMemberCount).append('&nbsp; / &nbsp;').append($eventLimit);
		$eventMember.append($eventLabelMember).append($eventMemberLabel);
		 
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
				$memberImg.attr('alt', '프로필').attr('src', member[pos].path);
				var $memberId = $('<span>');
				$memberId.addClass('memberId').append(member[pos].memberName);
				    
				$member.append($memberImg).append($memberId);
				$memberRow.append($member);
			}
	     
			$eventMemberCol.append($memberRow);
			if(flag == 1) $eventMember.append($eventMemberCol);
		}
		return $eventMember;
	}
	

   
	// eventDetailView에서 체크버튼 누르면 member_event table에 데이터 삽입.
	$(document).on('click', '.checkBtn', function(event) {
		console.log(this.parentNode);
		var eno = Number(event.target.className.split(' ')[1].split('_')[1]);
		console.log("eno: " + eno);
		
		// var memberId = ${member.memberId};
		console.log("참여이벤트리스트 : " + attendEventList);
		console.log("현재 이벤트 포함여부: " + attendEventList.includes(eno));
		if(attendEventList.includes(eno)) {
			alertMessage('이미 참석되었습니다.');
			return;
		}
		
		var event;
		var flag = false;
		$.each(eventInfoList, function(i, v) {
			if(v.eno == eno && v.eLimit <= v.eMemCount) {
				console.log("v.eno : " + v.eno + " / eno: " +eno);
				console.log(v);
				alertMessage('참석인원이 초과되었습니다.');
				console.log('참석인원 초과');
				flag = true;
				return ;
			}
		});
		if(flag) return;
		
		var memberId = 'admin';
		$.ajax({
			url: 'attendEvent.ij',
			data: {eno: eno, memberId: memberId},  
			type: 'post',
			success: function(res) {
				if(res > 0) {
					alertMessage('참석되었습니다.');
					console.log('참석되었음. res: 1');
				} else {
					alertMessage('다시 시도해주세요.');
				}
				console.log(res);
			},
			error: function(err) {
				console.log(err);
				alertMessage('다시 시도해주세요.');
			}
		});
		getAttendEventList(getCalDate());
		var event = eventDetail(eno);
		var member = eventMemberList(eno)
		var $eventMember = eventMemberDetail(event, member);
		
		$('.detailView_'+eno+' .eventMember').remove();
		$('.eventInfo').append($eventMember);
	});
	
   
   // eventDetailView에서 닫기버튼 누르면 해당요소 삭제
	$(document).on('click', '.eventDetail .closeBtn', function(event) {
		var className = event.target.className.split(' ')[1];
		console.log("className: " + className);
		$('.'+className).animate({opacity: 0});
      
		setTimeout(function() {
			$('.eventDetail:has(.'+className+')').remove();
		}, 400);
      
		detailViewSet.delete(className.split('_')[1]);
	});
	
	
	



	// ================================================================================







	// 이벤트 등록에 관한 function
	
	// 현재시간 저장. 이벤트 등록폼의 시작일, 종료일에 디폴트로 설정.
	var defaultTime = moment().add('1', 'hours').set({minute:0,second:0,millisecond:0}).format('YYYY-MM-DDTHH:mm:ss');
	$('.eventDay input').val(defaultTime);
	
	// 이벤트 등록 버튼을 클릭하면 ajax로 데이터 전송. 데이터가 유효한 지 검증
	$("#addEventBtn").click(function() {
		// 제목, 내용에 값이 있는지 확인
		if($("#eTitle").val().trim().length==0) {
			$("#eTitle").focus();
			alertMessage("제목을 입력해주세요.");
			return;
		}
		if($("#eContent").val().trim().length==0) {
			$("#eContent").focus();
			alertMessage("내용을 입력해주세요.");
			return;
		}
		// 이벤트 시작일과 종료일이 유효한지 확인
		if($("#eStart").val() < moment().format('YYYY-MM-DDTHH:mm:ss')) {
			alertMessage("올바른 시간을 입력해주세요.");
			$("#eStart").focus();
			return;
		}
		if($("#eStart").val() > $("#eEnd").val()) {
			$("#eEnd").focus();
			return false;
		}

		// 폼의 데이터를 쿼리스트링으로 받음.
		var formData = $("form[name=eventForm]").serialize();
		console.log("formData : " + formData);
		$.ajax({
			url: 'addEvent.ij',
			data: formData,
			type: 'post',
			success: function(result) {
				console.log(result);   
				
				// 등록이 성공적으로 이루어질 경우 등록모달폼 초기화하고 숨기기.
				if(result > 0) {
					closeEventForm();
					alertMessage('새 일정이 등록되었습니다.');
					// 일정등록 성공 시 소켓 처리
					eventSetting();
					
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
	
	
	// 이벤트 등록 폼의 제출버튼이나 취소버튼이 눌릴 때 폼의 데이터를 초기화하고 폼을 닫는다.
	function closeEventForm() {
		$("form[name=eventForm]")[0].reset();
		$('.eventDay input').val(defaultTime);
		$("#addEventForm").modal('hide');
	}
	
	// 동작 성공 / 실패 알림창
	function alertMessage(msg) {
		Swal.fire({
			text: msg,
			timer: 1500,
			showConfirmButton: false,
			padding: '0.5rem',
			width: '16rem'
		});
	}
	
	
});   