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
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script> 
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
<style>
	#_chatbox{
	
	}
	#messageWindow{
	    height: 250px;
    	overflow-y: auto;
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
        <fieldset>
            <div id="messageWindow"></div>
            <br /> <input id="inputMessage" type="text" onkeyup="enterkey()" />
            <input type="submit" value="send" onclick="send()" />
        </fieldset>
    </div>
    <img class="chat" style="width:50px; height:50px; float:right" src="${contextPath }/resources/images/chat.png" />


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
    var gName = "${groupName}";
    
    function send() {
        if (inputMessage.value == "") {
        } else {
            $("#messageWindow").html($("#messageWindow").html()
                + "나 : " + inputMessage.value + "</br>");
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
    //  채팅이 많아져 스크롤바가 넘어가더라도 자동적으로 스크롤바가 내려가게함
    /* window.setInterval(function() {
        var elem = document.getElementById('messageWindow');
        elem.scrollTop = elem.scrollHeight;
    }, 5000); */
</script>

</body>
</html>