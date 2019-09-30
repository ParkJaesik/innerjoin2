package com.best.innerjoin.event.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.best.innerjoin.event.model.vo.Event;

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

	public List<Integer> attendEventsList(Map<String, String> monthMember) {
		return sqlSession.selectList("eventMapper.eventsList", monthMember);
	}

}
