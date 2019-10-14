<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<!-- <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>  -->
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
<style>
	#_chatbox{
		width:100%;
		border: 1px solid grey;
	    border-radius: 5px;
	    padding: 10px;
		background-color: rgb(230,230,230);	
	
	}
	#roomName{
	
		text-align: center;
	}
	#messageWindow{
	    height: 650px;
	    width:100%;
    	overflow-y: auto;
	}
	.chatMessage_mine{
		
		background-color:rgb(255,235,51);
		max-width: 60%;
	    border-radius: 20px;
	    padding: 10px;
	    text-align: left;
	    float: right;
	   
	    word-break: break-all;
	    margin-top: 5px;
	    display: block;
	    clear: both
		
	}
	.chatMessage_others{
		
		background-color:white;
		max-width: 60%;
	    border-radius: 20px;
	    padding: 10px;
	    text-align: left;
	    float:left;
	    /* right: 0; */
	    word-break: break-all;
	    margin-top: 5px;
	    display: block;
	    clear: both
		
	}
	
</style>
</head>
<body>
	<!-- 로그인한 상태일 경우와 비로그인 상태일 경우의 chat_id설정 -->
    <c:if test="${(loginUser.memberName ne '') and !(empty loginUser.memberName)}">
        <input type="hidden" value='${loginUser.memberName }' id='chat_nick' />
        <input type="hidden" value='${loginUser.memberId }' id='chat_id' />
    </c:if>
    <c:if test="${(loginUser.memberName eq '') or (empty loginUser.memberName)}">
        <input type="hidden" value='<%=session.getId().substring(0, 6)%>'
            id='chat_id' />
    </c:if>
    <!--     채팅창 -->
    <div id="_chatbox" style="display: none">
    <div id="roomName">${group.gName}</div>
        
            <div id="messageWindow"></div>
            <br /> <input id="inputMessage" type="text" size="20" onkeyup="enterkey();" />
            <button type="submit" id="submitBtn" onclick="send();">보내기</button>
            
        
    </div>
    <img class="chat" style="width:50px; height:50px; float:right; cursor:pointer;" src="${contextPath }/resources/images/chat.png" />


<script>
	
	
    $(".chat").on({
        "click" : function() {
            if ($(this).attr("src") == "${contextPath }/resources/images/chat.png") {
                $(".chat").attr("src", "${contextPath }/resources/images/chat2.png");
                $("#_chatbox").css("display", "block");
            } else if ($(this).attr("src") == "${contextPath }/resources/images/chat2.png") {
                $(".chat").attr("src", "${contextPath }/resources/images/chat.png");
                $("#_chatbox").css("display", "none");
            }
        }
    });
</script>
<script type="text/javascript">
    var inputMessage = document.getElementById('inputMessage');
    var loginUserName = "${loginUser.memberName }";
    var loginUserId = "${loginUser.memberId }";
    var gName = "${gName}";
    
    $(function(){
    	
    	if(gName !=null){
    		loadMessage();
    	}
    	
    });
    
    function loadMessage(){
    	
    	var chatMessage = getCookie(gName);
    	console.log(chatMessage);
    	$("#messageWindow").html(chatMessage);
    }
    
    
    $("#messageWindow").bind('DOMNodeInserted DOMNodeRemoved', function() {
    	
    	if(gName !=null){
	    	var chatMessage = $("#messageWindow").html();
	    	setCookie(gName,chatMessage,"1");
    	}
    });
    
    
    function send() {
        if (inputMessage.value == "") {
        } else {
            /* $("#messageWindow").html($("#messageWindow").html()
                + "나 : " + inputMessage.value + "</br>"); */
            $("#messageWindow").append("<span class='chatMessage_mine'>"+ inputMessage.value + "</span>"+"<br><br>");
            $("#messageWindow").scrollTop(99999999);
        }
        socket.send("chat,"+loginUserId+","+loginUserName+","+inputMessage.value+","+gName);
        
        //socket.send($("#chat_nick").val() + "|" + inputMessage.value);
        inputMessage.value = "";
        
    }
    
    //     엔터키를 통해 send함
    function enterkey() {
        if (window.event.keyCode == 13) {
            send();
            
            
        }
    }

    
    function setCookie(cookie_name, value, days) {
    	  var exdate = new Date();
    	  exdate.setDate(exdate.getDate() + days);
    	  // 설정 일수만큼 현재시간에 만료값으로 지정

    	  var cookie_value = escape(value) + ((days == null) ? '' : ';    expires=' + exdate.toUTCString());
    	  document.cookie = cookie_name + '=' + cookie_value;
    }
    
    function getCookie(cookie_name) {
    	  var x, y;
    	  var val = document.cookie.split(';');

    	  for (var i = 0; i < val.length; i++) {
    	    x = val[i].substr(0, val[i].indexOf('='));
    	    y = val[i].substr(val[i].indexOf('=') + 1);
    	    x = x.replace(/^\s+|\s+$/g, ''); // 앞과 뒤의 공백 제거하기
    	    if (x == cookie_name) {
    	      return unescape(y); // unescape로 디코딩 후 값 리턴
    	    }
    	  }
    	}
</script>

</body>
</html>