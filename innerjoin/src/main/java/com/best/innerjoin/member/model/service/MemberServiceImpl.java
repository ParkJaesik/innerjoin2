package com.best.innerjoin.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.best.innerjoin.member.model.dao.MemberDao;
import com.best.innerjoin.member.model.vo.Member;

@Service("mService")
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDao mDao;
	
	
//  암호화	
//	@Autowired
//	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@Override
	public Member loginMember(Member member) {
		
		return mDao.loginMember(member);
	}
	
	@Override
//	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.READ_COMMITTED, rollbackFor=Exception.class)
	public int insertMember(Member member) {
//		String encPwd = bCryptPasswordEncoder.encode(member.getMemberPwd());
//		
//		member.setMemberPwd(encPwd);
		
		return mDao.insertMember(member);
	}
}
