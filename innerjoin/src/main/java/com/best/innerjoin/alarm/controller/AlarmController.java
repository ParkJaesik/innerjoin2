package com.best.innerjoin.alarm.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	@ResponseBody
	@RequestMapping("insertNote.ij")
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
	
	
	
}	
