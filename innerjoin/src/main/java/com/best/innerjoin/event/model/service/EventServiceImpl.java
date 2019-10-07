package com.best.innerjoin.event.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.best.innerjoin.event.model.dao.EventDao;
import com.best.innerjoin.event.model.vo.Event;
import com.best.innerjoin.member.model.vo.Member;

@Service("eService")
public class EventServiceImpl implements EventService{

	@Autowired
	private EventDao eDao;
	
	@Override
	public int insertEvent(Event event) {
		event.seteContent(event.geteContent().replace("\n", "<br>"));
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
	public List<Integer> attendEventList(String date, String memberId, int gno) {
		Map<String, String> dateMember = new HashMap();
		dateMember.put("date", date);
		dateMember.put("memberId", memberId);
		dateMember.put("gno", "" + gno);
		return eDao.attendEventList(dateMember);
	}

	@Override
	public ArrayList<Event> groupEventList(String date, String gno) {
		Map<String, String> dateGroup = new HashMap();
		dateGroup.put("date", date);
		dateGroup.put("gno",  gno);
		return eDao.groupEventList(dateGroup);
	}

	@Override
	public ArrayList<Member> selectMem(String eno) {

		return eDao.selectMem(eno);
	}

	@Override
	public ArrayList<Event> memberEventList(String date, String memberId) {
		
		Map<String, String> dateMember = new HashMap();
		dateMember.put("date", date);
		dateMember.put("memberId", memberId);
		return eDao.memberEventList(dateMember);
	}

	@Override
	public int cancelEvent(String memberId, int eno) {
		Map<String, String> memberEno = new HashMap();
		memberEno.put("memberId", memberId);
		memberEno.put("eno", ""+eno);
		return eDao.cancelEvent(memberEno);
	}

}