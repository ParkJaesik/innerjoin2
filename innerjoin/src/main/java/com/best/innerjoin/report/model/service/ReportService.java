package com.best.innerjoin.report.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.best.innerjoin.report.model.vo.GroupMemberReport;
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
	public abstract int insertReport(GroupMemberReport report, HttpServletRequest request);

	/** 회원 신고 게시글 상세
	 * @param rNo
	 * @return
	 */
	public abstract GroupMemberReport selectReport(int rNo);

//	/** 신고당한 회원 리스트 
//	 * @param currentPage
//	 * @return
//	 */
//	public abstract ArrayList<GroupMemberReport> selectMList(int currentPage);
	

}
