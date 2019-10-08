package com.best.innerjoin.admin.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("adDao")
public class AdminDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

}
