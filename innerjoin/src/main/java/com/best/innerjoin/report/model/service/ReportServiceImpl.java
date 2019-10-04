package com.best.innerjoin.report.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.best.innerjoin.report.model.dao.ReportDao;
import com.best.innerjoin.report.model.vo.GroupMemberReport;
import com.best.innerjoin.report.model.vo.Search;

@Service("rService")
public class ReportServiceImpl implements ReportService{
	
	@Autowired
	private ReportDao rDao;

	// 모임회원 신고 게시글 목록 조회
	@Override
	public ArrayList<GroupMemberReport> selectBList() {
		return rDao.selectBList();
	}

	// 모임 회원 신고 게시글 검색
	@Override
	public ArrayList<GroupMemberReport> searchBList(Search search) {

		return rDao.searchBList(search);
	}

}
