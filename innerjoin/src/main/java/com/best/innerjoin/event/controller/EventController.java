package com.best.innerjoin.event.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.best.innerjoin.event.model.service.EventService;
import com.best.innerjoin.event.model.vo.Event;
import com.google.gson.Gson;

@Controller
public class EventController {
	
	@Autowired
	private EventService eService;

	@RequestMapping("calendar.ij")
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
	
	
	@ResponseBody
	@RequestMapping("ajaxTest.ij")
	public String renderEvent(Integer month) {
//		JSONArray array = new JSONArray();
//		JSONObject obj = new JSONObject();
		
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		
		Map<Integer, List> map = new HashMap();
		
		ArrayList<Event> events = new ArrayList<>();

		events.add(new Event("All Day Event1", "2019-08-01"));
		

		events.add(new Event("All Day Event2", "2019-08-02"));
		
		events.add(new Event("All Day Event3", "2019-08-02", "2019-08-03"));

		events.add(new Event("All Day Event4", "2019-08-06", "2019-08-07"));

		ArrayList<Event> events1 = new ArrayList<>();
		

		events1.add(new Event("All Day Event3", "2019-09-02", "2019-09-02"));
		
		events1.add(new Event("All Day Event5", "2019-09-05", "2019-09-06"));

		events1.add(new Event("All Day Event6", "2019-09-06"));
		
		events1.add(new Event("All Day Event7", "2019-09-12"));
		
		
		map.put(7, events);
		map.put(8, events1);
		
		
		return new Gson().toJson(map.get(month));
	}
}
