package com.best.innerjoin.event.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.best.innerjoin.event.model.dao.EventDao;
import com.best.innerjoin.event.model.vo.Event;


@Service("eService")
public class EventServiceImpl implements EventService {
	
	@Autowired
	private EventDao eDao;

	@Override
	public int insertEvent(Event event) {
		return eDao.insertEvent(event);
	}
}
