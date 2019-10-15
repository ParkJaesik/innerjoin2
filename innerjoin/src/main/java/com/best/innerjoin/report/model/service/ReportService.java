package com.best.innerjoin.report.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.best.innerjoin.group.model.vo.GroupMember;
import com.best.innerjoin.report.model.vo.GroupMemberReport;
import com.best.innerjoin.report.model.vo.GroupReport;
import com.best.innerjoin.report.model.vo.MemberReport;
import com.best.innerjoin.report.model.vo.Search;

public interface ReportService {

	/** 모임 회원 신고게시글 전체 조회
	 * @param currentPage 
	 * @return
	 */
	public abstract ArrayList<GroupMemberReport> selectBList(int currentPage);

	/** 모임 회원 신고글 검색
	 * @param search
	 * @return
	 */
	public abstract ArrayList<GroupMemberReport> searchBList(Search search);

	/** 모임 회원 신고 게시글 작성
	 * @param report
	 * @param request
	 * @return
	 */
	public abstract int insertReport(GroupMemberReport report);

	/** 회원 신고 게시글 상세
	 * @param rNo
	 * @return
	 */
	public abstract GroupMemberReport selectReport(int rNo);

	
	/** 회원 신고글 거절
	 * @param rNo
	 * @return
	 */
	public abstract int deleteReport(int rNo);

	/**  회원 신고 횟수 카운트 
	 * @param report
	 * @return
	 */
	public abstract int updateReportCount(GroupMemberReport report);

	/** 신고 받은 회원 목록 출력
	 * @param responGNo
	 * @param currentPage 
	 * @return
	 */
	public abstract ArrayList<GroupMember> selectGroupMember(int responGNo, int currentPage);



	/** 신고된 회원 강퇴시키기
	 * @param memberId
	 * @return
	 */
	public abstract int deleteReptGroupMem(String memberId);
	

	/** 그룹 신고 insert Service
	 * @param gReport
	 * @return
	 */
	public abstract int insertGroupReport(GroupReport gReport);

	/** 회원 신고 insert Service
	 * @param mReport
	 * @return
	 */
	public abstract int insertMemberReport(MemberReport mReport);



//	/** 신고당한 회원 리스트 
//	 * @param currentPage
//	 * @return
//	 */
//	public abstract ArrayList<GroupMemberReport> selectMList(int currentPage);
//	

}
