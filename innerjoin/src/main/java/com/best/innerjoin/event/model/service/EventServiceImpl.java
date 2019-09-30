package com.best.innerjoin.event.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.best.innerjoin.event.model.dao.EventDao;
import com.best.innerjoin.event.model.vo.Event;

@Service("eService")
public class EventServiceImpl implements EventService{

	@Autowired
	private EventDao eDao;
	
	@Override
	public int insertEvent(Event event) {
		return eDao.insertEvent(event);
	}

	@Override
	public int attendEvent(String eno, String memberId) {
		Map<String, String> memberEvent = new HashMap();
		memberEvent.put("eno", eno);
		memberEvent.put("memberId", memberId);
		return eDao.attendEvent(memberEvent);
	}

	@Override
	public List<Integer> attendEventsList(String date, String memberId, int gno) {
		Map<String, String> monthMember = new HashMap();
		monthMember.put("date", ""+date);
		monthMember.put("memberId", memberId);
		monthMember.put("gno", "" + gno);
		return eDao.attendEventsList(monthMember);
	}

}
