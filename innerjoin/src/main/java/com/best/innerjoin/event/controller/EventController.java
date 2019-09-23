package com.best.innerjoin.event.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.best.innerjoin.event.model.vo.Event;



@Controller
public class EventController {

	@RequestMapping("calendar.kh")
	public String calendarView() {
		return "event/calendar";
	}
	
	@RequestMapping("addEvent.kh")
	public String addEvent(Event event) {
		
		
		return null;
	}
}
