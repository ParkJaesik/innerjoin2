package com.best.innerjoin.alarm.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.best.innerjoin.alarm.model.dao.AlarmDao;

@Service
public class AlarmServiceImpl implements AlarmService{
	
	@Autowired
	private AlarmDao aDao;
	
	@Override
	public int insertAlarm(String memberId, String host) {
		
		return aDao.insertAlarm(memberId,host);
	}

	
}
