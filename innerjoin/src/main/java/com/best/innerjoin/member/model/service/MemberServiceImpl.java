package com.best.innerjoin.member.model.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.best.innerjoin.alarm.model.vo.Alarm;
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
	
	// 비번 암호화 저장 (회원가입)
	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.READ_COMMITTED, rollbackFor=Exception.class)
	public int insertMember(Member member) {
		String encPwd = bCryptPasswordEncoder.encode(member.getMemberPwd());
		member.setMemberPwd(encPwd);
		int result = mDao.insertMember(member);
		if(result>0) result = mDao.insertAddInfo(member);
		return result;
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

	// 마이페이지 -내 모임 목록
	@Override
	public ArrayList<Member> selectList(Member logingUser) {
		System.out.println("서비스" + logingUser);
		int groupCount = mDao.groupCount(logingUser);
		return mDao.selectList(logingUser);
	}
	
	// 마이페이지 - 초대 목록
	@Override
	public ArrayList<Member> selectInvList(Member loginUser) {
		/* int invCount = mDao.invCount(loginUser); */
		return mDao.selectInvList(loginUser);
	}
	
	// 마이페이지 - 신청목록
	@Override
	public ArrayList<Member> selectWaitList(Member loginUser) {

		return mDao.selectWaitList(loginUser);
	}

	// 탈퇴하기
	@Override
	public int deleteMember(Member loginUser) {
		
		return mDao.deleteMember(loginUser);
	}

	// 비밀번호 확인
	@Override
	public int checkPwd(String loginUserPwd, String memberPwd) {
		int result = 0;
		System.out.println(loginUserPwd);
		System.out.println(memberPwd);
		if(!bCryptPasswordEncoder.matches(memberPwd , loginUserPwd)) {
			System.out.println(result);
			result = 0;
		}else {
//			return mDao.checkPwd(memberId);
			result = 1;
		}
		return result;
		
	}

	// 초대 거절
	@Override
	public int deleteInv(Member loginUser, int gNo) {
		Map gMem = new HashMap<>();
		
		gMem.put("memberId", loginUser.getMemberId());
		gMem.put("gNo", gNo);
		
		return mDao.deleteInv(gMem);
	}

	// 초대 수락
	@Override
	public int updateInv(Member loginUser, int gNo) {
		Map gMem = new HashMap<>();
		
		gMem.put("memberId", loginUser.getMemberId());
		gMem.put("gNo", gNo);
		return mDao.updateInv(gMem);
	}

	// 모임 가입 신청 취소
	@Override
	public int deleteWait(Member loginUser, int gNo) {
		Map gMem = new HashMap<>();
		
		gMem.put("memberId", loginUser.getMemberId());
		gMem.put("gNo", gNo);
		return mDao.deleteWait(gMem);
	}

	

	
	@Override
	public String googleJoinedChk(String memberId) {
		return mDao.googleJoined(memberId);
	}

	@Override
	public Member googleLogin(Member member) {
		Member loginUser = null;
		int result = 0; 
		String loginWay = member.getLoginWay();
		if(loginWay == null || loginWay.equals("")) {
			// 가입되어있지 않으면 회원가입
			result = mDao.googleJoin(member);
		} 
		if(result > 0 || loginWay.equals("G"))
		loginUser = mDao.googleLogin(member.getMemberId());
		return loginUser;
	}

	


	// 회원정보 수정 
	@Override
	public int updateInfo(Member member) {
		String encPwd = bCryptPasswordEncoder.encode(member.getMemberPwd());
			
		member.setMemberPwd(encPwd);
		int result = mDao.updateInfo(member);
		if(result > 0) {
			result = mDao.updateAddInfo(member);
		}
		return result;
	}


	@Override
	public String getOriginFileName(String memberId) {
			
		return mDao.getOriginFileName(memberId);
	}

	// 프로필 사진 변경
	@Override
	public int updateProfile(Member member) {
		
		return mDao.updateProfile(member);
	}

	
	@Override
	public Member getMember(Member member) {
		return mDao.getMember(member);
	}
	

	// 프로필 자기소개, 공개여부 수정
	@Override
	public int updateProfileAdd(Member member) {
		return mDao.updateProfileAdd(member);
	}


	// 아이디로 값 얻어오기(비밀번호 찾기)
	@Override
	public Member selectMember(String memberId) {
		
		return mDao.selectMember(memberId);
	}

	//특정 멤버아이디로 멤버정보 가져오기
	@Override
	public Member selectMemberInfo(String memberId) {
		return mDao.selectMemberInfo(memberId);

	}

		
	

	
	

	
}
