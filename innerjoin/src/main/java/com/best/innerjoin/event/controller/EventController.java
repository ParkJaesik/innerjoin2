package com.best.innerjoin.event.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.best.innerjoin.event.model.service.EventService;
import com.best.innerjoin.event.model.vo.Event;
import com.best.innerjoin.member.model.vo.Member;
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
		System.out.println("event : " + event);
		int result = eService.insertEvent(event);
		return result;
	}
   
   
	@ResponseBody
	@RequestMapping(value="renderEvent.ij", produces="text/plain;charset=UTF-8")
	public String renderEvent(String date, String gno) {
      
		ArrayList<Event> eventList = eService.groupEventList(date, gno);
		String list = new Gson().toJson(eventList);
		System.out.println(list);
		return list;
	}
   
	/** 이벤트 상세정보. 참석 멤버 조회 Controller
    * @param eno
	* @return member list
	*/
	@ResponseBody
	@RequestMapping("attendMember.ij")
	public String attendMember(String eno) {
		ArrayList<Member> mList = eService.selectMem(eno);
		return new Gson().toJson(mList);
	}
   
   
	/** 모임이벤트 참석데이터 추가 Controller
	* @param eno
	* @param memberId
	* @return result
	*/
	@ResponseBody
	@RequestMapping("attendEvent.ij")
	public int attendEvent(String eno, HttpSession session) {
		//String memberId = ((Member)session.getAttribute("loginUser")).getMemberId();
		String memberId = "admin";
		return eService.attendEvent(eno, memberId);
	}
	
	/** 그룹에서 로그인유저가 참석하는  이벤트 리스트 조회 Controller
	 * @param date
	 * @param memberId
	 * @param gno
	 * @return event list
	 */
	@ResponseBody
	@RequestMapping("getAttendEventList.ij") 
	public List<Integer> getAttendEventList(String date, int gno, HttpSession session) {
		System.out.println(date);
		String memberId = "admin";
		gno = 1;
//		String memberId = ((Member)session.getAttribute("loginUser")).getMemberId();
		List<Integer> list = eService.attendEventList(date, memberId, gno);
		System.out.println("참석 목록 : " + list);
		return list;
		
	}
	
	
	
	
//	===========================================================================
	
	
	
	
	/** 멤버페이지 일정관리 뷰로 이동
	 * @return
	 */
	@RequestMapping("memberCalendar.ij")
	public String memberCalender() {
		return "event/memberCalendar";
	}
	
	/** 멤버가 참석하는 이벤트 리스트 조회
	 * @return
	 */
	@ResponseBody
	@RequestMapping("memberEventList.ij")
	public String memberEventList(String date) {
//		String memberId = ((Member)session.getAttribute("loginUser")).getMemberId();
		String memberId = "admin";
		ArrayList<Event> eventList = eService.memberEventList(date, memberId);
		return new Gson().toJson(eventList);
	}

	
	/** 이벤트 참석 취소
	 * @param eno
	 * @return result
	 */
	@ResponseBody
	@RequestMapping("cancelEvent.ij")
	public int cancelEvent(int eno) {
		return 1;
//		return eService.cancelEvent(eno);
	}

}