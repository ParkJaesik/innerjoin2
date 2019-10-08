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

	// 마이페이지 - 내 모임 목록
	public abstract ArrayList<Member> selectList(Member loginUser);

	/** 탈퇴하기
	 * @param loginUser
	 * @return result
	 */
	public abstract int deleteMember(Member loginUser);

	
	
}
