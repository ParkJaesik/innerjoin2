package com.best.innerjoin.member.model.dao;


import java.util.ArrayList;
import java.util.Map;

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
	
	/** 로그인
	 * @param member
	 * @return loginUser
	 */
	public Member loginMember(Member member) {
		Member loginUser = sqlSession.selectOne("memberMapper.loginMember",member);
		return loginUser;
	}


	
	/** 회원가입
	 * @param member
	 * @return
	 */
	public int insertMember(Member member) {
		
		return sqlSession.insert("memberMapper.insertMember",member);
	}

	/** email 중복체크
	 * @param id
	 * @return
	 */
	public int checkIdDup(String id) {
		return sqlSession.selectOne("memberMapper.checkIdDup", id);
	}

	
	/** 닉네임 중복체크
	 * @param name
	 * @return 
	 */
	public int checkNameDup(String name) {
		return sqlSession.selectOne("memberMapper.checkNameDup", name);
	}


	/** 내 모임 갯수
	 * @param loginUser
	 * @return 
	 */
	public int groupCount(Member loginUser) {
		
		return sqlSession.selectOne("memberMapper.groupCount", loginUser);
	}

	
	/** 내 모임 목록
	 * @param loginUser
	 * @return 
	 */
	public ArrayList<Member> selectList(Member loginUser) {
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectList", loginUser);
	}
	
	/** 초대받은 모임 목록
	 * @param loginUser
	 * @return
	 */
	public ArrayList<Member> selectInvList(Member loginUser) {
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectInvList", loginUser);
	}
	
	/** 신청 목록 
	 * @param loginUser
	 * @return 
	 */
	public ArrayList<Member> selectWaitList(Member loginUser) {
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectWaitList", loginUser);
	}
	
	/** 초대 거절
	 * @param loginUser
	 * @return result
	 */
	public int deleteInv(Map gMem) {
		
		return sqlSession.delete("memberMapper.deleteInv", gMem);
	}

	/** 초대 수락
	 * @param gMem
	 * @return
	 */
	public int updateInv(Map gMem) {

		return sqlSession.update("memberMapper.updateInv", gMem);
	}
	
	/** 회원 탈퇴
	 * @param loginUser
	 * @return result
	 */
	public int deleteMember(Member loginUser) {
		
		return sqlSession.update("memberMapper.deleteMember", loginUser);

	}



	



	



	


	



	
	
}


