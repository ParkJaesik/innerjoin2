package com.best.innerjoin.member.model.dao;


import java.util.ArrayList;
import java.util.HashMap;
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
	
	public int insertAdditional(Member member) {
		System.out.println(member.getMemberBirthday());
		return sqlSession.insert("memberMapper.insertAdditional",member);
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

	/** 회원 정보 수정
	 * @param member
	 * @return
	 */
	public int updateInfo(Member member) {

		return sqlSession.update("memberMapper.updateInfo", member);
	}
	
	/** 회원 가입 시 추가정보 
	 * @param member
	 * @return result
	 */
	public int updateAddInfo(Member member) {
		
		Map info = new HashMap<>();
		info.put("memberBirthday" ,member.getMemberBirthday());
		info.put("memberId", member.getMemberId());
		
		return sqlSession.update("memberMapper.updateAddInfo", info);
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
	
	/** 모입가입 신청 취소
	 * @param gMem
	 * @return result
	 */
	public int deleteWait(Map gMem) {

		return sqlSession.delete("memberMapper.deleteWait", gMem);
	}
	
	/** 회원 탈퇴
	 * @param loginUser
	 * @return result
	 */
	public int deleteMember(Member loginUser) {
		
		return sqlSession.update("memberMapper.deleteMember", loginUser);

	}


	/** 구글아이디로 가입이 되어 있는지 확인
	 * @param memberId
	 * @return result
	 */
	public String googleJoined(String memberId) {
		return sqlSession.selectOne("memberMapper.googleJoined", memberId);
	}

	/** 구글로 회원가입
	 * @param member
	 * @return result
	 */
	public int googleJoin(Member member) {
		return sqlSession.insert("memberMapper.googleJoin", member);
	}
	
	/** 구글아이디로 로그인
	 * @param member
	 * @return loginUser
	 */
	public Member googleLogin(String memberId) {
		return sqlSession.selectOne("memberMapper.googleLogin", memberId);
	}


	



	



	


	



	
	
}


