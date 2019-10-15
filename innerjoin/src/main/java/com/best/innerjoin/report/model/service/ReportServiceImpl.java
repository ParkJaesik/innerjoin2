package com.best.innerjoin.report.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.best.innerjoin.common.PageInfo;
import com.best.innerjoin.group.model.vo.GroupMember;
import com.best.innerjoin.member.model.vo.Member;
import com.best.innerjoin.report.model.dao.ReportDao;
import com.best.innerjoin.report.model.vo.GroupMemberReport;
import com.best.innerjoin.report.model.vo.GroupReport;
import com.best.innerjoin.report.model.vo.MemberReport;
import com.best.innerjoin.report.model.vo.ReportPagination;
import com.best.innerjoin.report.model.vo.Search;

@Service("rService")
public class ReportServiceImpl implements ReportService{
	
	@Autowired
	private ReportDao rDao;

	// 모임회원 신고 게시글 목록 조회
	@Override
	public ArrayList<GroupMemberReport> selectBList(int currentPage) {
		
		int listCount = rDao.getListCount();
		
		PageInfo pi = ReportPagination.getPageInfo(currentPage, listCount);
		
		return rDao.selectBList(pi);
	}

	// 모임 회원 신고 게시글 검색
	@Override
	public ArrayList<GroupMemberReport> searchBList(Search search) {

		return rDao.searchBList(search);
	}

	// 신고 게시글 작성
	@Override
	public int insertReport(GroupMemberReport report) {

		
		
		report.setrContent(report.getrContent().replace("\n", "<br>"));
		
		int result = rDao.insertReport(report);
		
		return result;

	}

	
	// 신고 게시글 상세
	@Override
	public GroupMemberReport selectReport(int rNo) {
		
		return rDao.selectReport(rNo);
	}

	// 회원 신고 거절
	@Override
	public int deleteReport(int rNo) {
		
		return rDao.deleteReport(rNo);
	}

	//  회원 신고 횟수 카운트
	@Override
	public int updateReportCount(GroupMemberReport report) {
		
		
		return rDao.updateReportCount(report);
	}

	
	// 신고 받은 회원 목록 
	@Override
	public ArrayList<GroupMember> selectGroupMember(int responGNo, int currentPage) {
		
		int listCount = rDao.getGroupMemberListCount(responGNo);
		
		PageInfo pi = ReportPagination.getPageInfo(currentPage, listCount);
		
		return rDao.selectGroupMember(responGNo, pi);
	}


	// 신고된 회원 강퇴하기
	@Override
	public int deleteReptGroupMem(GroupMember groupMember) {
		return rDao.deleteReptGroupMem(groupMember);
	}
	

	@Override
	public int insertGroupReport(GroupReport gReport) {
		rDao.insertGroupReport(gReport);
		return rDao.updateGroupReptCount(gReport);
	}

	@Override
	public int insertMemberReport(MemberReport mReport) {
		rDao.insertMemberReport(mReport);
		return rDao.updateMemberReptCount(mReport);
	}


//	// 신고 당한 회원 리스트
//	@Override
//	public ArrayList<GroupMemberReport> selectMList(int currentPage) {
//		
//		int listCount = rDao.getListCount();
//		
//		PageInfo pi = ReportPagination.getPageInfo(currentPage, listCount);
//		
//		return rDao.selectMList(pi);
//	}

}
