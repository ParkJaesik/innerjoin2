package com.best.innerjoin.chat;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.util.StringUtils;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.best.innerjoin.member.model.vo.Member;


public class ReplyEchoHandler extends TextWebSocketHandler{
	List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	Map<String, WebSocketSession> userSessions = new HashMap<String, WebSocketSession>();
	Map<String,WebSocketSession> groupList = new HashMap<String,WebSocketSession>();
	
	
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		
		System.out.println("afterConnectionEstablished : " + session);
		sessions.add(session);
		String senderId = getId(session);
		userSessions.put(senderId,session);
		
		
		
	}
	

	 @Override
	 public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("handleTextMessage : " + session + " : " + message);
		String senderId = getId(session);
		
		
		/*
		 * for(WebSocketSession sess:sessions) {
		 * 
		 * sess.sendMessage(new TextMessage(senderId + ":" +message.getPayload()));
		 * 
		 * }
		 */
		
		
		//protocol : cmd,댓글작성자,게시글작성자,bno(ex : reply,user2,user1,234)
		
		String msg = message.getPayload();
		
		if(!StringUtils.isEmpty(msg)) {
			String[] strs = msg.split(",");
			if(strs != null && strs.length>4) {
				String cmd = strs[0];
				
				
				if(cmd.equals("reply")) {
					
					String replyWriter = strs[1];
					String boardWriter = strs[2];
					String bId =  strs[3];
					
					WebSocketSession boardWriterSession =  userSessions.get(boardWriter);
					//TextMessage tmpMsg = new TextMessage("reply,"+ replyWriter + " 님이 " +
					//"<a href='bdetail.kh?bId=" + bId+ "'>" +bId +"</a>번 게시글에 댓글을 달았습니다.!");
					if(boardWriterSession !=null) {
						TextMessage tmpMsg = new TextMessage("reply,"+ replyWriter + "," +
								"<a href='bdetail.kh?bId=" + bId+ "'>" +bId +"</a>번 게시글에 댓글을 달았습니다.!");
						boardWriterSession.sendMessage(tmpMsg);
					}
					
				}else if(cmd.equals("chat")) {
					
					String sender = strs[1];
					String senderName = strs[2];
					String gName = strs[3];
					String inputmsg =  strs[4];
				
					TextMessage tmpMsg = new TextMessage("chat,"+senderName + "," + inputmsg);
					System.out.println("tmpMsg : " + tmpMsg);
					 
					for(WebSocketSession sess:sessions) {
						if(!sess.equals(session)) {
		                    sess.sendMessage(tmpMsg);
		                }
					}
				}
			}
		}
		
	 }
	
	private String getId(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		Member loginUser = (Member) httpSession.get("loginUser");
		if(null==loginUser) {
			
			return session.getId();
			
		}
		else {
			
			return loginUser.getMemberId();
		}
		
	}
	
	private String getGroupName(WebSocketSession session) {
		Map<String,Object> httpSession = session.getAttributes();
		String gName = (String) httpSession.get("groupName");
		
		return gName;
	}


	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		System.out.println("afterConnectionClosed : " + session);
		
		String senderId = getId(session);
		userSessions.remove(senderId);
		sessions.remove(session);
	}
}
