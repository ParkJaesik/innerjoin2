package com.best.innerjoin.event.model.dao;

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

	
}
