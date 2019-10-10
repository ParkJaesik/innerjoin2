package com.best.innerjoin.group.model.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.omg.CORBA.portable.RemarshalException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.best.innerjoin.group.model.dao.GroupDao;
import com.best.innerjoin.group.model.exception.GroupException;
import com.best.innerjoin.group.model.vo.Group;
import com.best.innerjoin.group.model.vo.GroupMember;

@Service("gService")
public class GroupServiceImpl implements GroupService{
	
	@Autowired
	private GroupDao gDao;
	

	// 새로운 모임 생성
	@Override
	public int insertGroup(Group group) {
	
		group.setgInfo(group.getgInfo().replace("\n", "<br>"));
		return gDao.insertGroup(group);
		
		
		
		
	}

	
//	클릭한 그룹 페이지로 이동하는 메소드
	@Override
	public Group goGroupPage(int gNo) {
		
		Group temp = gDao.goGroupPage(gNo);
		
		return temp;
	}

	@Override
	public Integer selectCode(String memberId, int gNo) {
		
		Map codeMap = new HashMap<>();
		codeMap.put("memberId", memberId);
		codeMap.put("gNo", gNo);
		
		return gDao.selectCode(codeMap);
	}

	@Override
	public int applyInsertGroup(String memberId, int gNo) {
		Map codeMap = new HashMap<>();
		codeMap.put("memberId", memberId);
		codeMap.put("gNo", gNo);
		return gDao.applyInsertGroup(codeMap);
	}

	@Override
	public ArrayList<GroupMember> groupMemberList(int groupNo) {
		return gDao.groupMemberList(groupNo);
	}
	
	@Override
	public int insertAlarm(String memberId, String host) {
		
		
		return gDao.insertAlarm(memberId,host);

	}

	// 모임 회원 등급 조정
	@Override
	public int updateLevel(HttpServletRequest request, GroupMember gMember) {
		
		int result = gDao.updateLevel(gMember);
		return 0;

	@Override
	public ArrayList<GroupMember> waitingGroupMemberList(int groupNo) {
		return gDao.waitingGroupMemberList(groupNo);

	}

	
	
}
