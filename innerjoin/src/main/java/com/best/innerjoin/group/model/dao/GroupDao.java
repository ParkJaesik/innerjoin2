package com.best.innerjoin.group.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.best.innerjoin.group.model.vo.Group;
import com.best.innerjoin.group.model.vo.GroupMember;

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

	public ArrayList<GroupMember> groupMemberList(int groupNo) {
		return (ArrayList)sqlSession.selectList("groupMapper.groupMemberList", groupNo);
	}

}
