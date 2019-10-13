package com.best.innerjoin.alarm.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.best.innerjoin.alarm.model.vo.Alarm;
import com.best.innerjoin.group.model.vo.GroupMember;

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

	public ArrayList<Alarm> selectMyAlarm(String receiveId) {
		ArrayList<Alarm> list=(ArrayList)sqlSession.selectList("alarmMapper.selectMyAlarm", receiveId);
		return list;
	}

	public int insertAlbumAlarm(String senderId, String receiverId, String tmpMsg) {
		Map<String,String> alarmMap = new HashMap<>();
		alarmMap.put("senderId", senderId);
		alarmMap.put("receiverId", receiverId);
		alarmMap.put("msg",tmpMsg);
		return sqlSession.insert("alarmMapper.insertAlbumAlarm",alarmMap);
	}

	public int deleteAlarm(String alarmId) {
		return sqlSession.delete("alarmMapper.deleteAlarm",alarmId);
	}

}
