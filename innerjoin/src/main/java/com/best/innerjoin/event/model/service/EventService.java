package com.best.innerjoin.event.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.best.innerjoin.event.model.dao.EventDao;
import com.best.innerjoin.event.model.vo.Event;

public interface EventService {

	
	/** event 삽입 Service
	 * @param event
	 * @return result
	 */
	int insertEvent(Event event);

	
}
