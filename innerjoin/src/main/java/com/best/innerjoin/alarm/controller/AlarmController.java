package com.best.innerjoin.alarm.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.best.innerjoin.alarm.model.service.AlarmService;
import com.best.innerjoin.alarm.model.vo.Alarm;
import com.best.innerjoin.group.model.service.GroupService;
import com.best.innerjoin.member.model.vo.Member;

@Controller
public class AlarmController {
	
	@Autowired
	private AlarmService alarmService;
	@Autowired
	private GroupService gService;
	
	@RequestMapping("deleteAlarm.ij")
	public String deleteAlarm(Alarm alarm) {
		
		String alarmId = alarm.getAlarmId();
		
		int result = alarmService.deleteAlarm(alarmId);
		String path  = null;
		
		if(result>0) {
			path = "redirect:myNewsForm.ij";
		}else {
			path = "common/errorPage";
		}
		return path;
		
		
	}
	
	@RequestMapping("deleteNote.ij")
	public String deleteNote(Alarm alarm) {
		
		String alarmId = alarm.getAlarmId();
		
		int result = alarmService.deleteAlarm(alarmId);
		String path  = null;
		
		if(result>0) {
			path = "redirect:myNoteForm.ij";
		}else {
			path = "common/errorPage";
		}
		return path;
		
		
	}
	
	@ResponseBody
	@RequestMapping(value="insertNote.ij",method=RequestMethod.POST )
	public String insertNote(String reciverName, String askMsg,String  senderId,String  gName) {
		
		
		System.out.println(askMsg);
		
		String receiverId = gService.selectReceiverId(reciverName);
		
		
		Map<String,String> alarmMap = new HashMap<>();
		String msg = gName + "|" + askMsg;
		
		alarmMap.put("receiverId", receiverId);
		alarmMap.put("msg", msg);
		alarmMap.put("senderId",senderId);
		alarmMap.put("gName",gName);
		
		
		int result = alarmService.insertNote(alarmMap);
		
		
		return receiverId;
	}
	
	@RequestMapping("myNoteForm.ij")
	public String goMyNote(HttpServletRequest request,Model model) {
		
		String path= null;
		
		String receiverId = ((Member)request.getSession().getAttribute("loginUser")).getMemberId();
		
		ArrayList<Alarm>  list = alarmService.selectMyNote(receiverId);
		
		
		model.addAttribute("list", list);
		path = "member/myNote";
		
		return path;
	}
	
	@ResponseBody
	@RequestMapping(value= "replyNote.ij",method=RequestMethod.POST )
	public int replyNote(String  senderId,String  receiverId,String resposeMsg) {
		
		Map<String,String> alarmMap = new HashMap<>();
		
		alarmMap.put("receiverId", receiverId);
		alarmMap.put("resposeMsg", resposeMsg);
		alarmMap.put("senderId",senderId);
		
		int result = alarmService.replyNote(alarmMap);
		
		
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value= "inviteGroup.ij",method=RequestMethod.POST )
	public int inviteGroup(String  senderId,String  receiverId,String msg,String gNo) {
		
		Map<String,String> alarmMap = new HashMap<>();
		
		alarmMap.put("receiverId", receiverId);
		alarmMap.put("msg", msg);
		alarmMap.put("senderId",senderId);
		alarmMap.put("gNo",gNo);
		
		int result = gService.inviteGroupMember(alarmMap);
		
		
		int result2 = alarmService.inviteGroup(alarmMap);
		
		
		
		
		
		return result;
	}
	
	
	
}	
