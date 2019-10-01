package com.best.innerjoin.group.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.best.innerjoin.group.model.vo.Group;

@Repository("gDao")
public class GroupDao {

	private SqlSessionTemplate sqlSession;
	public int insertGroup(Group group) {
		
		return sqlSession.insert("groupMapper.insertGroup", group);
	}

}
