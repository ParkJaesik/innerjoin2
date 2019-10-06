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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/common/menubar.css">
<style>

	

</style>
</head>
<body>
<section id="header">
	<!-- <div class="container" id="profile" > -->
		<nav id="nav">
			<ul>
				<li id="logo-part"><a class="menu-a" href="#"><img id="ij-logo" src="${contextPath}/resources/images/innerJoin.png"></a></li>
				<%-- <a class="menu-a" href="#"><img id="ij-logo" src="${contextPath}/resources/images/innerJoin.png"></a> --%>
				<li class="menu"><a class="icon solid fa-search" href="#"><span class="menu-detail">Search</span></a></li>
				
				<!-- 로그인 시 사용 가능 -->				
				<li class="menu"><a class="icon solid fa-envelope menu-a" onclick="showAlarm();"><span class="menu-detail">News</span></a></li>
                <li class="menu"><a class="icon solid fa-home menu-a" href="myGroupForm.ij"><span class="menu-detail">MyPage</span></a></li>
			</ul>
		</nav>
		
	<!-- </div> -->
</section>

			<%-- <script src="${contextPath}/resources/js/jquery.min.js"></script>
			<script src="${contextPath}/resources/js/jquery.dropotron.min.js"></script>
			<script src="${contextPath}/resources/js/browser.min.js"></script>
			<script src="${contextPath}/resources/js/breakpoints.min.js"></script>
			<script src="${contextPath}/resources/js/util.js"></script>
			<script src="${contextPath}/resources/js/main.js"></script> --%>


<div id="alarmTable">
	<div id="alaram">
				
	</div>	
</div>

<!-- websocket script -->
<script type="text/javascript">
	var socket = null;
	
	
	$(document).ready(function(){
		connectWS();
		
	});

	function showAlarm(){
		
		if($("#alarmTable").css("display")=="none"){
			$("#alarmTable").css("display","block");
		}else{
			$("#alarmTable").css("display","none");
			
		}
		
		
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
	        }
    	
    }
    
    ws.onclose = function(event){
    	console.log("info : connection closed");

    	//setTimeout(function(){connect();},1000);
    	
    };
    
    ws.onerror = function(event){console.log("Error :' connection closed");};
}
</script>


</body>
</html>
