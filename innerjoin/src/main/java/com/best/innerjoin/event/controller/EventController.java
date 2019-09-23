package com.best.innerjoin.event.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.best.innerjoin.event.model.service.EventService;
import com.best.innerjoin.event.model.vo.Event;

@Controller
public class EventController {
	
	@Autowired
	private EventService eService;

	@RequestMapping("calendar.kh")
	public String calendarView() {
		return "event/calendar";
	}
	
	@ResponseBody
	@RequestMapping("addEvent.kh")
	public int insertEvent(Event event) {
		event.setGno("0");
		//int result = eService.insertEvent(event);
		int result = 1;
		System.out.println(event);
		return result;
	}
}
