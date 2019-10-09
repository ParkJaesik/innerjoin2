package com.best.innerjoin.alarm.model.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AlarmDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insertAlarm(String memberId, String host) {
		Map<String,String> alarmMap = new HashMap<>();
		alarmMap.put("memberId", memberId);
		alarmMap.put("host", host);
		System.out.println(alarmMap.get("memberId"));
		System.out.println(alarmMap.get("host"));
		return sqlSession.insert("alarmMapper.insertAlarm", alarmMap);
		
	}

}
