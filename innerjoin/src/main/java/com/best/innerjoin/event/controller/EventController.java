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

   /** 일정페이지로 이동 
 * @return
 */
@RequestMapping("calendar.ij")
   public String calendarView() {
      return "event/calendar";
   }
   
   /** 일정 추가 Controller
 * @param event
 * @return result
 */
@ResponseBody
   @RequestMapping("addEvent.ij")
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
//      JSONArray array = new JSONArray();
//      JSONObject obj = new JSONObject();
      
      SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
      
      
      Map<Integer, List> map = new HashMap();
      
      ArrayList<Event> events = new ArrayList<>();

      events.add(new Event(1, "All Day Event1", "2019-08-01", "2019-08-01"));
      

      events.add(new Event(2, "All Day Event2", "2019-08-02", "2019-08-02"));
      
      events.add(new Event(3, "All Day Event3", "2019-08-02", "2019-08-03"));

      events.add(new Event(4, "All Day Event3-1", "2019-08-02", "2019-08-03"));

      events.add(new Event(5, "All Day Event3-2", "2019-08-02", "2019-08-03"));

      events.add(new Event(6, "All Day Event4", "2019-08-06", "2019-08-07"));

      ArrayList<Event> events1 = new ArrayList<>();
      

      events1.add(new Event(7, "All Day Event3", "2019-09-02", "2019-09-02"));
      
      events1.add(new Event(8, "All Day Event5", "2019-09-05", "2019-09-06"));

      events1.add(new Event(9, "All Day Event6", "2019-09-06", "2019-09-06"));
      
      events1.add(new Event(10, "All Day Event7", "2019-09-12", "2019-09-12"));
      
      
      map.put(7, events);
      map.put(8, events1);
      
      
      return new Gson().toJson(map.get(month));
   }
   
   /** 이벤트 상세정보 조회 Controller
 * @param eno
 * @return event Detail
 */
   @ResponseBody
   @RequestMapping("showDetail.ij")
   public String showDetail(String eno) {
	   
	   return new Gson().toJson(new Event(10, "All Day Event7","testtesttesttest", "2019-09-12", "2019-09-12" ,10));
   }
   
   
   /** 모임이벤트 참석데이터 추가 Controller
 * @param eno
 * @param memberId
 * @return result
 */
	@ResponseBody
	@RequestMapping("attendEvent.ij")
	public int attendEvent(String eno, String memberId) {
//		return eService.attendEvent(eno, memberId);
		return 1;
	}
	
	@ResponseBody
	@RequestMapping("attendEventsList.ij") 
	public List<Integer> attendEventsList(String date, String memberId, int gno) {
		System.out.println(date);
//		List<Integer> list = eService.attendEventsList(date, memberId, gno);
		List<Integer> list = new ArrayList();
		list.add(10);
		list.add(20);
		return list;
		
	}


}