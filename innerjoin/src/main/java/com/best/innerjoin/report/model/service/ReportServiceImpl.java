package com.best.innerjoin.report.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.best.innerjoin.common.PageInfo;
import com.best.innerjoin.report.model.dao.ReportDao;
import com.best.innerjoin.report.model.vo.GroupMemberReport;
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
	public int insertReport(GroupMemberReport report, HttpServletRequest request) {

		report.setrContent(report.getrContent().replace("\n", "<br>"));
		
		int result = rDao.insertReport(report);
		
		return result;

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
