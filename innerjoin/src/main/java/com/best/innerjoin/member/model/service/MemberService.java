package com.best.innerjoin.member.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.best.innerjoin.member.model.vo.Member;

public interface MemberService {

	public abstract Member loginMember(Member member);

	// 회원 가입
	public abstract int insertMember(Member member);

	// 이메일  중복 검사
	public abstract int checkIdDup(String id);

	// 닉네임 중복 검사
	public abstract int checkNameDup(String name);

	
	/** 내 모임 목록
	 * @param loginUser
	 * @return 
	 */
	public abstract ArrayList<Member> selectList(Member loginUser);
	
	/** 초대 모임 목록
	 * @param loginUser
	 * @return 
	 */
	public abstract ArrayList<Member> selectInvList(Member loginUser);
	
	/** 신청 목록
	 * @param loginUser
	 * @return
	 */
	public abstract ArrayList<Member> selectWaitList(Member loginUser);
	
	/** 비밀번호 확인
	 * @param loginUserPwd
	 * @param memberPwd 
	 * @return result
	 */
	public abstract int checkPwd(String loginUserPwd, String memberPwd);

	/** 탈퇴하기
	 * @param loginUser
	 * @return result
	 */
	public abstract int deleteMember(Member loginUser);

	
	
	



	
	
}
