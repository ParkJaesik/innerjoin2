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
<link rel="stylesheet" href="${contextPath}/resources/css/menubar.css"/>

<style>

	

	#alarmTable{
		border:1px solid black;
		display:none;
		z-index: 1000;
		text-align: left;
	    width: 30%;
	    height: 60px;
	    position:absolute;
	    right:0;
	    
		
		
	}
</style>
</head>
<body>
<section id="header">
	<!-- <div class="container" id="profile" > -->
		<nav id="nav">
			<ul>
				<a href="#"><img id="ij-logo" src="${contextPath}/resources/images/innerJoin.png"></a>
				<li class="menu"><a class="icon solid fa-search" href="#"><span>Search</span></a></li>
				<li class="menu"><a class="icon solid fa-envelope" onclick="showAlarm();"><span>News</span></a></li>
                <li class="menu"><a class="icon solid fa-home" href="myGroupForm.ij"><span>MyPage</span></a></li>
			</ul>
		</nav>
		
	<!-- </div> -->
</section>

<script src="${contextPath}/resources/assets/js/jquery.min.js"></script>
			<script src="${contextPath}/resources/assets/js/jquery.dropotron.min.js"></script>
			<script src="${contextPath}/resources/assets/js/browser.min.js"></script>
			<script src="${contextPath}/resources/assets/js/breakpoints.min.js"></script>
			<script src="${contextPath}/resources/assets/js/util.js"></script>
			<script src="${contextPath}/resources/assets/js/main.js"></script>


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
	    	$("#alaram").html(event.data);
	    	$("#alarmTable").css("display","block");
    	
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