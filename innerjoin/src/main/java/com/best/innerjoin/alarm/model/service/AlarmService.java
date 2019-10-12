package com.best.innerjoin.alarm.model.service;

import java.util.ArrayList;

import com.best.innerjoin.alarm.model.vo.Alarm;
import com.best.innerjoin.group.model.vo.GroupMember;

public interface AlarmService {

	int insertAlarm(String memberId, String host);

	ArrayList<Alarm> selectMyAlarm(String receiveId);

	int insertAlbumAlarm(String senderId, ArrayList<GroupMember> receiverList);

	int deleteAlarm(String alarmId);


}
