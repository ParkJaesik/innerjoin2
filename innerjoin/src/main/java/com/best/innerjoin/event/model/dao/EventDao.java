package com.best.innerjoin.event.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.best.innerjoin.event.model.vo.Event;
import com.best.innerjoin.member.model.vo.Member;

@Repository("eDao")
public class EventDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insertEvent(Event event) {
		return sqlSession.insert("eventMapper.insertOne", event);
	}

	public int attendEvent(Map memberEvent) {
		return sqlSession.insert("eventMapper.attendOne", memberEvent);
	}

	public List<Integer> attendEventList(Map<String, String> dateMember) {
		return sqlSession.selectList("eventMapper.attendEventList", dateMember);
	}

	public ArrayList<Event> groupEventList(Map<String, String> dateGroup) {
		return (ArrayList)sqlSession.selectList("eventMapper.groupEventList", dateGroup);
	}

	public ArrayList<Member> selectMem(String eno) {
		return (ArrayList)sqlSession.selectOne("eventMapper.selectMem", eno);
	}

}
