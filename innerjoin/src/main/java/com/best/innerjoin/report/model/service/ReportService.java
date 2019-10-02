package com.best.innerjoin.report.model.service;

import java.util.ArrayList;

import com.best.innerjoin.report.model.vo.GroupMemberReport;
import com.best.innerjoin.report.model.vo.Search;

public interface ReportService {

	/** 모임 회원 신고게시글 전체 조회
	 * @return
	 */
	ArrayList<GroupMemberReport> selectBList();

	/** 모임 회원 신고글 검색
	 * @param search
	 * @return
	 */
	ArrayList<GroupMemberReport> searchBList(Search search);

}
