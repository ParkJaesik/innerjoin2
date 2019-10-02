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
	
//	@Override
//	public Member loginMember(Member member) {
//		Member loginUser = mDao.loginMember(member);
//		
//		if(!bCryptPasswordEncoder.matches(member.getMemberPwd(), loginUser.getMemberPwd())) {
//			loginUser = null;
//		}
//		return loginUser;
//	}
	
	
	@Override

	public int insertMember(Member member) {

		
		return mDao.insertMember(member);
	}
	
//	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.READ_COMMITTED, rollbackFor=Exception.class)
//	public int insertMember(Member member) {
//		String encPwd = bCryptPasswordEncoder.encode(member.getMemberPwd());
//		return mDao.insertMember(member);
//	}
	
	
	
	
	// email 중복 검사
	@Override
	public int checkIdDup(String id) {
		return mDao.checkIdDup(id);
	}

	// name 중복 검사
	@Override
	public int checkNameDup(String name) {
		return mDao.checkNameDup(name);
	}
}
