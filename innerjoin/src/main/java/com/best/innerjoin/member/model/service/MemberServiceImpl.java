package com.best.innerjoin.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.best.innerjoin.member.model.dao.MemberDao;
import com.best.innerjoin.member.model.vo.Member;

@Service("mService")
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDao mDao;

	@Override
	public Member loginMember(Member member) {
		
		return mDao.loginMember(member);
	}
}
