package com.best.innerjoin.admin.model.service;

import java.util.ArrayList;

import com.best.innerjoin.member.model.vo.Member;

public interface AdminService {

	/** 회원가입 멤버 리스트 가져오기
	 * @return
	 */
	ArrayList<Member> selectMemList(int currentPage);

	/** 멤버 정보 모두 가져오기
	 * @param memberId
	 * @return
	 */
	Member selectMemDetail(String memberId);

}
