package com.best.innerjoin.event.model.service;

import java.util.List;

import com.best.innerjoin.event.model.vo.Event;

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

	/** 회원 event 목록 Service 
	 * @param memberId
	 * @return
	 */
	List<Integer> attendEventsList(String date, String memberId, int gno); 
	
}
