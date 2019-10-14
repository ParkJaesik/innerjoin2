package com.best.innerjoin.member.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.best.innerjoin.alarm.model.vo.Alarm;
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
	
	
	/** 초대 거절
	 * @param loginUser
	 * @param gNo
	 * @return result
	 */
	public abstract int deleteInv(Member loginUser, int gNo);

	/** 초대 수락
	 * @param loginUser
	 * @param gNo
	 * @return result
	 */
	public abstract int updateInv(Member loginUser, int gNo);



	/** 구글회원가입 여부
	 * @param memberId
	 * @return login_way
	 */
	public abstract String googleJoinedChk(String memberId);

	/** 구글로그인
	 * @param member
	 * @return result
	 */
	public abstract Member googleLogin(Member member);



	/** 모임가입 신청  취소
	 * @param loginUser
	 * @param gNo
	 * @return result
	 */
	public abstract int deleteWait(Member loginUser, int gNo);


	/**  회원정보 수정 
	 * @param loginUser
	 * @return
	 */
	public abstract int updateInfo(Member member);



	
	/** 파일명 검사
	 * @param memberId
	 * @return
	 */
	public abstract String getOriginFileName(String memberId);

	
	/** 프로필 사진 변경
	 * @param member
	 * @return
	 */
	public abstract int updateProfile(Member member);

	/** 수정된 값 세팅하는 부분
	 * @param member
	 * @return
	 */
	public abstract Member getMember(Member member);

	/** 프로필 자기소개, 공개여부 수정
	 * @param member
	 * @return
	 */
	public abstract int updateProfileAdd(Member member);

	



	
	
}
