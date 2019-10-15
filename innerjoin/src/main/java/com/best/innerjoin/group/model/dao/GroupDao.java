package com.best.innerjoin.group.model.dao;


import java.util.ArrayList;

import java.util.HashMap;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.best.innerjoin.group.model.vo.Group;
import com.best.innerjoin.group.model.vo.GroupCat;
import com.best.innerjoin.group.model.vo.GroupMember;
import com.best.innerjoin.member.model.vo.Member;

@Repository("gDao")
public class GroupDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 모임 만들기
	public int insertGroup(Group group) {
		
		return sqlSession.insert("groupMapper.insertGroup", group);
	}
	
//	클릭한 그룹 페이지로 이동하는 메소드
	public Group goGroupPage(int gNo) {
		
		return sqlSession.selectOne("groupMapper.selectGroup", gNo);
	}

	public Integer selectCode(Map codeMap) {
		return sqlSession.selectOne("groupMapper.selectCode",codeMap);
	}

	public int applyInsertGroup(Map codeMap) {
		return sqlSession.insert("groupMapper.applyInsertGroup", codeMap);
	}

	public int insertAlarm(String memberId, String host, String msg) {
		Map<String,String> alarmMap = new HashMap<>();
		alarmMap.put("memberId", memberId);
		alarmMap.put("host", host);
		alarmMap.put("msg", msg);
		
		
		return sqlSession.insert("alarmMapper.insertAlarm", alarmMap);

	}
	
	// 회원 등급 조정
	public int updateLevel(GroupMember gMember) {
		
		return sqlSession.update("groupMapper.updateLevel", gMember);
	}
	
	// 그룹 멤버 목록 조회 DAO
	public ArrayList<GroupMember> groupMemberList(int groupNo) {
		return (ArrayList)sqlSession.selectList("groupMapper.groupMemberList", groupNo);
	}

	// 그룹 가입 대기 멤버 목록 조회 DAO
	public ArrayList<GroupMember> waitingGroupMemberList(int groupNo) {
		return (ArrayList)sqlSession.selectList("groupMapper.waitingGroupMemberList", groupNo);
	}

	public int insertGroupMemberAdmin(Member loginUser) {
		String memberId = loginUser.getMemberId();
		return sqlSession.insert("groupMapper.insertGroupMemberAdmin", memberId);
	}

	public int acceptGroup(Map codeMap) {
		return sqlSession.insert("groupMapper.acceptGroup",codeMap);
	}

	public int rejectGroup(Map codeMap) {
		return sqlSession.insert("groupMapper.rejectGroup",codeMap);
	}

	public int updateGroupCount(int gNo) {
		return sqlSession.update("groupMapper.updateGroupCount", gNo);
	}

	public String selectReceiverId(String reciverName) {
		return sqlSession.selectOne("memberMapper.selectReceiverId", reciverName);
		
	}

	public ArrayList<Group> getHostGroup(String memberName) {
		return (ArrayList)sqlSession.selectList("groupMapper.getHostGroup", memberName);
	}

	public int inviteGroupMember(Map<String, String> alarmMap) {
		return sqlSession.insert("groupMapper.inviteGroupMember",alarmMap);
	}

	public int withdraw(Map<String, String> map) {
		return sqlSession.update("groupMapper.withdrawGroup",map);
	}

	public int decreaseCount(String gNo) {
		return sqlSession.update("groupMapper.decreaseCount",gNo);
	}

	public int selectIsGroupMember(String memberId, int gNo) {
		Map<String,Object> map = new HashMap<>();
		map.put("memberId", memberId);
		map.put("gNo", gNo);
		
		return sqlSession.selectOne("groupMapper.selectIsGroupMember",map);
	}

	public int rejoinApplyGroupMember(String memberId, int gNo) {
		Map<String,Object> map = new HashMap<>();
		map.put("memberId", memberId);
		map.put("gNo", gNo);
		return sqlSession.update("groupMapper.rejoinApplyGroupMember",map);
	}

	public ArrayList<GroupCat> selectGroupCat() {
		return (ArrayList)sqlSession.selectList("groupMapper.selectGroupCat");
	}

}
