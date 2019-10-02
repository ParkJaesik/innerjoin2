package com.best.innerjoin.member.model.service;

import com.best.innerjoin.member.model.vo.Member;

public interface MemberService {

	public abstract Member loginMember(Member member);

	// 회원 가입
	public abstract int insertMember(Member member);

	// 이메일  중복 검사
	public abstract int checkIdDup(String id);

	// 닉네임 중복 검사
	public abstract int checkNameDup(String name);

}
