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
import com.best.innerjoin.group.model.vo.GroupCat;
import com.best.innerjoin.group.model.vo.GroupMember;
import com.best.innerjoin.member.model.vo.Member;

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
	
	// 클릭한 그룹 페이지로 이동하는 메소드
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
	public int insertAlarm(String memberId, String host,String msg) {
		return gDao.insertAlarm(memberId,host,msg);
	}

	// 모임 회원 등급 조정
	@Override
	public int updateLevel(HttpServletRequest request, GroupMember gMember) {
		int result = gDao.updateLevel(gMember);
		
		return result;
	}
	
	@Override
	public ArrayList<GroupMember> groupMemberList(int groupNo) {
		return gDao.groupMemberList(groupNo);
	}
	
	@Override
	public ArrayList<GroupMember> waitingGroupMemberList(int groupNo) {
		return gDao.waitingGroupMemberList(groupNo);
	}

	@Override
	public int insertGroupMemberAdmin(Member loginUser) {
		return gDao.insertGroupMemberAdmin(loginUser);
	}

	@Override
	public int acceptGroup(String memberId, int gNo) {
		Map codeMap = new HashMap<>();
		codeMap.put("memberId", memberId);
		codeMap.put("gNo", gNo);
		return gDao.acceptGroup(codeMap);
	}

	@Override
	public int rejectGroup(String memberId, int gNo) {
		Map codeMap = new HashMap<>();
		codeMap.put("memberId", memberId);
		codeMap.put("gNo", gNo);
		return gDao.rejectGroup(codeMap);
	}

	@Override
	public int updateGroupCount(int gNo) {
		return gDao.updateGroupCount(gNo);
	}

	@Override
	public String selectReceiverId(String reciverName) {
		return gDao.selectReceiverId(reciverName);
	}

	@Override
	public ArrayList<Group> getHostGroup(String memberName) {
		return gDao.getHostGroup(memberName);
	}

	@Override
	public int inviteGroupMember(Map<String, String> alarmMap) {
		return gDao.inviteGroupMember(alarmMap);
	}

	@Override
	public int withdraw(Map<String, String> map) {
		return gDao.withdraw(map);
	}

	@Override
	public int decreaseCount(String gNo) {
		return gDao.decreaseCount(gNo);
	}

	@Override
	public int selectIsGroupMember(String memberId, int gNo) {
		return gDao.selectIsGroupMember(memberId,gNo);
	}

	@Override
	public int rejoinApplyGroupMember(String memberId, int gNo) {
		return gDao.rejoinApplyGroupMember(memberId,gNo);
	}

	@Override
	public ArrayList<GroupCat> selectGroupCat() {
		return gDao.selectGroupCat();
	}

  @Override
	public int getGno() {
		return gDao.getGno();

	}
	
}
