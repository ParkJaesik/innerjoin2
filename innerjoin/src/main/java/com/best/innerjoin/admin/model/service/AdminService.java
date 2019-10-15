package com.best.innerjoin.admin.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.best.innerjoin.group.model.vo.Group;
import com.best.innerjoin.member.model.vo.Member;
import com.best.innerjoin.report.model.vo.GroupReport;
import com.best.innerjoin.report.model.vo.MemberReport;

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
	
	/** 멤버가 가입, 개설한 모임 리스트 가져오기
	 * @param memberId
	 * @return
	 */
	Map<String, Map> memGroupInfo(String memberId);
	
	/** 해당 멤버 신고 내역 가져오기
	 * @param memberId
	 * @return mrList
	 */
	ArrayList<MemberReport> selectMrList(String memberId);
	
	/** 회원 등급 조정
	 * @param memberId
	 * @param statusCode
	 * @return
	 */
	int setMemberStatus(String memberId, int statusCode);

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
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

	/** 그룹 상세 정보 가져오기
	 * @param gNo
	 * @return
	 */
	Group selectGroupDetail(int gNo);

	/** 그룹 상태 바꿔 주기
	 * @param gNo
	 * @param gStatus 
	 * @return
	 */
	int updateGroupStatus(Integer groupReptNo,Group group);


	


}
