<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<link rel="stylesheet" href="${contextPath}/resources/css/common/menubar.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>


<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<style>
	#newsCount{
		
		color:red;
		top:2em;
	
	}
	
</style>
</head>
<body>
<section id="header">
	<!-- <div class="container" id="profile" > -->
		<nav id="nav">
			<ul>
				<li id="logo-part"><a class="menu-a" href="gohome.ij"><img id="ij-logo" src="${contextPath}/resources/images/innerJoin.png"></a></li>
				<%-- <a class="menu-a" href="#"><img id="ij-logo" src="${contextPath}/resources/images/innerJoin.png"></a> --%>
				<li class="menu"><a class="icon solid fa-search" href="mgSearchForm.ij"><span class="menu-detail">Search</span></a></li>
				
				<!-- 로그인 시 사용 가능 -->				
				<li class="menu"><a class="icon solid fa-envelope menu-a" onclick="location.href='myNewsForm.ij'"><span class="menu-detail">News</span></a></li>
				<c:if test="${ empty sessionScope.loginUser }">
				<li class="menu"><a class="icon solid fa-home menu-a" href="loginForm.ij"><span class="menu-detail">Login</span></a></li>
				</c:if>
				<c:if test="${ !empty sessionScope.loginUser }">
                <li class="menu"><a class="icon solid fa-home menu-a" href="myGroupForm.ij"><span class="menu-detail">MyPage</span></a></li>
                <li class="menu"><a class="icon solid fa-home menu-a" href="logout.ij"><span class="menu-detail">Logout</span></a></li>
                </c:if>
			</ul>
		</nav>
		
	<!-- </div> -->
</section>


<!-- <div id="alarmTable">
	<div id="alaram">
	
				
	</div>	
</div> -->

<div class="position-absolute w-30 d-flex flex-column p-4" id="alarmTable" style="z-index: 1000; right:0;width: 30%;">

</div>

<!-- websocket script -->
<script type="text/javascript">
	var socket = null;
	
	
	$(document).ready(function(){
		connectWS();
		$('.toast').toast('show');
	});

	function showAlarm(){
		
	
		
	};



	function connectWS() {
		
		var ws  = new WebSocket("ws://localhost:8080/innerjoin/replyEcho.ij");
		
	    socket = ws;
	    
	    
	    
	    ws.onopen = function(){
	    	console.log("Info: connection opened");
	    	
	 	};
    
	    ws.onmessage = function(event){
	    	console.log("ReceiveMessage : ",event.data+'\n');
	        var data = event.data;
	        
	        var dataArray = data.split(",");
	        
	        console.log(dataArray);
	        
	        
	        if(dataArray[0]=="chat"){
	        
	        	$("#messageWindow").append("<span class='chatMessage_others'>" +dataArray[1] + " : " + dataArray[2] + "</span><br><br>");
	        	$("#messageWindow").scrollTop(99999999);
	        }else if(dataArray[0]=="reply"){
	        	$("#alaram").append(dataArray[1] + "님이 " + dataArray[2]);
	        	$("#alaram").append("<br>");
	        	$("#alarmTable").css("display","block");
	        }else if(dataArray[0]=="albumInsert"){
	        	
	        	var tmpMsg = dataArray[1] + "님이 " + "<a href='albumListView.ij?gNo="+dataArray[3]+"'>" +dataArray[2] + " 모임에 앨범이 추가되었습니다." +"</a>";
	        	toastMessage(tmpMsg);
	        	
	        }else if(dataArray[0]=="apply"){
	        	
	        	var tmpMsg = dataArray[1] + "님이 " + "<a href='wgmlist.ij?gNo="+dataArray[4] + "'>" +  dataArray[2] + " 모임에  가입신청을 했습니다."  +"</a>";
	        	toastMessage(tmpMsg);
	        	
	        }else if(dataArray[0]=="albumReply"){
	        	
	        	var tmpMsg = dataArray[2] + "님이 " + "<a href='albumDetailView.ij?albumNo="+dataArray[3] + "&gNo=" + dataArray[5] +"'>" + dataArray[1]+"모임의" + dataArray[4] + " 앨범에  댓글을 달았습니다.."  +"</a>";
	        	toastMessage(tmpMsg);
	        	
	        }else if(dataArray[0]=="applyMessage"){
	        	
	        	var tmpMsg = dataArray[1] + "모임 에 " + dataArray[3] + "님이 가입 문의 <a href='myNoteForm.ij'>쪽지 </a>를 보냈습니다.";
	        	toastMessage(tmpMsg);
	        	
	        }else if(dataArray[0]=="replyMsg"){
			
				var tmpMsg = dataArray[1] + "님이 가입 문의 쪽지에 대한 <a href='myNoteForm.ij'>답장 </a>을 를 보냈습니다.";
	        	toastMessage(tmpMsg);
	        }else if(dataArray[0]=="boardReply"){
			
				var tmpMsg = "<a href='bdetail.ij?boardNo=" + dataArray[2] + "&gNo=" + dataArray[4] + "'>"+ dataArray[1] + "모임 게시판에 게시하신 게시글에 댓글이 달렸습니다.</a>";
	        	toastMessage(tmpMsg);
	        }
    };
    
    ws.onclose = function(event){
    	console.log("info : connection closed");

    	//setTimeout(function(){connect();},1000);
    	
    };
    
    ws.onerror = function(event){
    	console.log("Error :' connection closed");
    };
    
    function toastMessage(tmpMsg){
    	$("#alarmTable").append(
    			'<div class="toast ml-auto" role="alert" data-delay="700" data-autohide="false">' +
    	        '<div class="toast-header">' +
    	            '<strong class="mr-auto text-primary">알람</strong>' +
    	            '<small class="text-muted"></small>' +
    	            '<button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">' +
    	                '<span aria-hidden="true">×</span>' +
    	            '</button>' +
    	        '</div>' +
    	        '<div class="toast-body">' +
    	          	tmpMsg +
    	        '</div>' +
    	    '</div>'
    	
    	) 
    	$("#alaram").append("<br>");
    	$('.toast').toast('show');
    
	};
}
	
	
</script>


</body>
</html>
