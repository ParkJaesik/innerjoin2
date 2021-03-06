package com.best.innerjoin.chat;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.best.innerjoin.group.model.service.GroupService;
import com.best.innerjoin.group.model.vo.Group;
import com.best.innerjoin.member.model.vo.Member;


public class ReplyEchoHandler extends TextWebSocketHandler{
	List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	Map<String, WebSocketSession> userSessions = new HashMap<String, WebSocketSession>();
	Map<WebSocketSession,String> groupList = new HashMap<WebSocketSession,String>();
	
	
	@Autowired
	private GroupService gService;
	
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		
		System.out.println("afterConnectionEstablished : " + session);
		sessions.add(session);
		
		String senderId = getId(session);
		
		userSessions.put(senderId,session);
		
		
		String gName = getGroupName(session);
		System.out.println(gName);
		
		
		if(gName != null) {
			groupList.put(session,gName);
		}

	}
	

	 @Override
	 public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("handleTextMessage : " + session + " : " + message); 
		
		
		
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
			if(strs != null && strs.length>=4) {
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
					String inputMsg =  strs[3];
					String gName = strs[4];
					
					TextMessage tmpMsg = new TextMessage("chat,"+senderName + ","+ inputMsg);
					
					 
					for(WebSocketSession sess:sessions) {
						
						
						if(!sess.equals(session) && groupList.get(sess).equals(gName)) {
							
		                    sess.sendMessage(tmpMsg);
		                   
		                }
					}
				}else if(cmd.equals("albumInsert")) {
					String loginUserId = strs[1];
					String loginUserName = strs[2];
					String gName =  strs[3];
					String gNo = strs[4];
					
					TextMessage tmpMsg = new TextMessage("albumInsert,"+loginUserName + ","+ gName + "," + gNo);
					for(WebSocketSession sess:sessions) {
						
						
						if(!sess.equals(session) && groupList.get(sess).equals(gName)) {
							
		                    sess.sendMessage(tmpMsg);
		                   
		                }
					}
				}else if(cmd.equals("apply")) {
					String loginUserId = strs[1];
					String gName = strs[2];
					String host = strs[3];
					
					String hostId = gService.selectReceiverId(host);
					String gNo = strs[4];
						WebSocketSession boardWriterSession =  userSessions.get(hostId);
						System.out.println(boardWriterSession);
						if(boardWriterSession !=null) {
							TextMessage tmpMsg = new TextMessage("apply,"+loginUserId + ","+ gName + "," + host + "," + gNo);
							boardWriterSession.sendMessage(tmpMsg);
						}
					
				}
				else if(cmd.equals("albumReply")) {
					
					String gName = strs[1];
					String rWriter = strs[2];
					String albumNo =  strs[3];
					String albumTilte = strs[4];
					String groupNo = strs[5];
					
					TextMessage tmpMsg = new TextMessage("albumReply,"+gName + ","+ rWriter + "," + albumNo + "," +albumTilte + "," + groupNo);
					for(WebSocketSession sess:sessions) {
						
						
						if(!sess.equals(session) && groupList.get(sess).equals(gName)) {
							
		                    sess.sendMessage(tmpMsg);
		                   
		                }
					}
				}else if(cmd.equals("applyMessage")) {
					String gName = strs[1];
					String receiverId = strs[2];
					String senderId = strs[3];
					String gNo = strs[4];
					
						WebSocketSession boardWriterSession =  userSessions.get(receiverId);
						
						if(boardWriterSession !=null) {
							TextMessage tmpMsg = new TextMessage("applyMessage,"+gName + ","+ receiverId + "," + senderId + "," + gNo);
							boardWriterSession.sendMessage(tmpMsg);
						}
						
				}else if(cmd.equals("replyMsg")) {
					String senderId = strs[1];
					String receiverId = strs[2];
					System.out.println("receiverId : " + receiverId);
					String resposeMsg = strs[3];
				
					
						WebSocketSession boardWriterSession =  userSessions.get(receiverId);
						
						if(boardWriterSession !=null) {
							TextMessage tmpMsg = new TextMessage("replyMsg,"+senderId + ","+ receiverId + "," + resposeMsg);
							boardWriterSession.sendMessage(tmpMsg);
							
						}
				}else if(cmd.equals("boardReply")) {
					String gName = strs[1];
					String boardNo = strs[2];
					String receiverId = strs[3];
					String groupNo = strs[4];
				
					
						WebSocketSession boardWriterSession =  userSessions.get(receiverId);
						
						if(boardWriterSession !=null) {
							TextMessage tmpMsg = new TextMessage("boardReply,"+gName + ","+ boardNo + "," + receiverId + "," + groupNo);
							boardWriterSession.sendMessage(tmpMsg);
							
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
	
	public String getGroupName(WebSocketSession session) {
		Map<String,Object> httpSession = session.getAttributes();
		
		
		String gName = (String) httpSession.get("gName");
		
		if(gName != null) {
			return gName;
		}else {
			return null;
		}
		
	}


	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		/* System.out.println("afterConnectionClosed : " + session); */
		String gName = getGroupName(session);
		if(gName != null) {
			groupList.remove(gName, session);
			
		}
		String senderId = getId(session);
		userSessions.remove(senderId);
		sessions.remove(session);
	}
}
