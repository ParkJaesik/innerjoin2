package com.best.innerjoin.member.model.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.best.innerjoin.member.model.dao.MemberDao;
import com.best.innerjoin.member.model.exception.MemberException;
import com.best.innerjoin.member.model.vo.Member;

@Service("mService")
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDao mDao;
	
	
//  암호화	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	
	// 로그인
	@Override
	public Member loginMember(Member member) {
		System.out.println(member);
		Member loginUser = mDao.loginMember(member);
		System.out.println(member.getMemberPwd());
		System.out.println(loginUser.getMemberPwd());
		if(!bCryptPasswordEncoder.matches(member.getMemberPwd(), loginUser.getMemberPwd())) {
			System.out.println(loginUser);
			loginUser = null;
		}
		
		return loginUser;
	}
	
	// 비번 암호화 저장
	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.READ_COMMITTED, rollbackFor=Exception.class)
	public int insertMember(Member member) {
		String encPwd = bCryptPasswordEncoder.encode(member.getMemberPwd());
		member.setMemberPwd(encPwd);
		return mDao.insertMember(member);
	}
	
	
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

	// 파일명 변경 메소드
	public String renameFile(MultipartFile file) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date()) + "." + originFileName.substring(originFileName.indexOf(".") + 1);
		
		return renameFileName;
	}
	
	// 파일 저장 메소드 
	public int saveFile(String renameFileName, MultipartFile uploadFile, HttpServletRequest reqesut) {
		// 파일 저장 경로 설정
		String root = reqesut.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\memUploadFiles";
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdir();
		}
		String filePath = folder + "\\" + renameFileName;
		
		int result = 0;
		try {
			uploadFile.transferTo(new File(filePath));
			result = 1;
		}catch (Exception e) {
			throw new MemberException("파일 전송 오류발생");  
		}
		return result;
	}

	// 내 모임 목록
	@Override
	public ArrayList<Member> selectList() {
		int groupCount = mDao.groupCount();
		return mDao.selectList();
	}
	
	
	

	
}
