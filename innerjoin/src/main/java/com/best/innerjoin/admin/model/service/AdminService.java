package com.best.innerjoin.admin.model.service;

import java.util.ArrayList;

import com.best.innerjoin.group.model.vo.Group;
import com.best.innerjoin.member.model.vo.Member;
import com.best.innerjoin.report.model.vo.GroupReport;

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

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/** 그룹 신고 리스트 가져오기
	 * @param currentPage
	 * @return
	 */
	ArrayList<GroupReport> selectGroupReptList(int currentPage);

	/** 그룹 리스트 가져오기
	 * @param currentPage
	 * @return
	 */
	ArrayList<Group> selectGroupList(int currentPage);

}
