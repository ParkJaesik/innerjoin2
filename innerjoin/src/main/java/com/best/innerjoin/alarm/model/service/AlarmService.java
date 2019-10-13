package com.best.innerjoin.alarm.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.best.innerjoin.alarm.model.vo.Alarm;
import com.best.innerjoin.group.model.vo.GroupMember;

public interface AlarmService {

	int insertAlarm(String memberId, String host);

	ArrayList<Alarm> selectMyAlarm(String receiveId);

	int insertAlbumAlarm(String senderId, ArrayList<GroupMember> receiverList, String tmpMsg);

	int deleteAlarm(String alarmId);

	int insertAlbumReplyAlarm(String senderId, ArrayList<GroupMember> receiverList, String tmpMsg);

	int insertNote(Map<String, String> alarmMap);

	ArrayList<Alarm> selectMyNote(String receiverId);


}
