package com.best.innerjoin.event.model.service;

import java.util.ArrayList;
import java.util.List;

import com.best.innerjoin.event.model.vo.Event;
import com.best.innerjoin.member.model.vo.Member;

public interface EventService {
	
	/** event 삽입 Service
	 * @param event
	 * @return result
	 */
	int insertEvent(Event event);

	/** event 참석 Service
	 * @param eno
	 * @param memberId
	 * @return result
	 */
	int attendEvent(String eno, String memberId);

	/** 회원 event 목록 조회 Service 
	 * @param memberId
	 * @return event list
	 */
	List<Integer> attendEventList(String date, String memberId, int gno);

	/** 그룹페이지 이벤트 목록 조회 Service
	 * @param date
	 * @return event list
	 */
	ArrayList<Event> groupEventList(String date, String gno);

	/** 이벤트 참석 멤버리스트 조회 Service
	 * @param eno
	 * @return memberList
	 */
	ArrayList<Member> selectMem(String eno);

	
	
	
//	=================================================================================
	
	
	
	
	/** 멤버 참석 이벤트 목록 조회 Service
	 * @param memberId
	 * @return eventList
	 */
	ArrayList<Event> memberEventList(String date, String memberId);

	/** 이벤트 참석 취소 Service
	 * @param eno
	 * @return result
	 */
	int cancelEvent(String memberId, int eno); 
	
}