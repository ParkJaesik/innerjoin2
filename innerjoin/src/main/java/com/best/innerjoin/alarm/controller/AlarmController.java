package com.best.innerjoin.alarm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.best.innerjoin.alarm.model.service.AlarmService;
import com.best.innerjoin.alarm.model.vo.Alarm;

@Controller
public class AlarmController {
	
	@Autowired
	private AlarmService alarmService;
	
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
	
}	
