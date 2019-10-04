package com.best.innerjoin.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.best.innerjoin.member.model.vo.Member;

@Repository
public class MemberDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
//	public Member loginMember(Member member) {
//		
//		return sqlSession.selectOne("memberMapper.loginMember",member);
//	}
	
	public Member loginMember(Member member) {
		Member loginUser = sqlSession.selectOne("memberMapper.loginMember",member);
		return loginUser;
	}


	// 회원가입
	public int insertMember(Member member) {
		
		return sqlSession.insert("memberMapper.insertMember",member);
	}

	// email 중복 체크
	public int checkIdDup(String id) {
		return sqlSession.selectOne("memberMapper.checkIdDup", id);
	}

	
	// 닉네임 중복 체크
	public int checkNameDup(String name) {
		return sqlSession.selectOne("memberMapper.checkNameDup", name);
	}


	// 내 모임 갯수
	public int groupCount(Member loginUser) {
		
		return sqlSession.selectOne("memberMapper.groupCount", loginUser);
	}

	// 내모임 목록 조회
	
	public ArrayList<Member> selectList(Member loginUser) {
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectList", loginUser);
	}

	
	
}
