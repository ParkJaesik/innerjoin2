package com.best.innerjoin.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.best.innerjoin.member.model.vo.Member;

@Repository
public class MemberDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	public Member loginMember(Member member) {
		
		return sqlSession.selectOne("memberMapper.loginMember",member);
	}

	
	
}
