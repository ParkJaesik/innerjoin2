package com.best.innerjoin.alarm.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.best.innerjoin.alarm.model.dao.AlarmDao;
import com.best.innerjoin.alarm.model.vo.Alarm;
import com.best.innerjoin.group.model.vo.GroupMember;

@Service
public class AlarmServiceImpl implements AlarmService{
	
	@Autowired
	private AlarmDao aDao;
	
	@Override
	public int insertAlarm(String memberId, String host) {
		
		return aDao.insertAlarm(memberId,host);
	}

	@Override
	public ArrayList<Alarm> selectMyAlarm(String receiveId) {
		return aDao.selectMyAlarm(receiveId);
	}

	@Override
	public int insertAlbumAlarm(String senderId, ArrayList<GroupMember> receiverList) {
		int result=0;
		
		for(GroupMember gm : receiverList) {
			if(senderId != gm.getMemberId()) {
				result =aDao.insertAlbumAlarm(senderId,gm.getMemberId());

			}
		}
		
		return  result;
	}

	
}
