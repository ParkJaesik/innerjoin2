package com.best.innerjoin.mgSearch.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.best.innerjoin.group.model.vo.Group;
import com.best.innerjoin.member.model.vo.Member;
import com.best.innerjoin.mgSearch.model.dao.MgSearchDao;
import com.best.innerjoin.mgSearch.model.vo.MgSearch;
import com.best.innerjoin.mgSearch.model.vo.PageInfo;
import com.best.innerjoin.mgSearch.model.vo.Pagination;

@Service
public class MgSearchServiceImpl implements MgSearchService{

	@Autowired
	private MgSearchDao mgDao;

	// 유저 검색페이지 첫 화면
	@Override
	public ArrayList<Member> selectMList(int currentPage) {
		int listCount= mgDao.getMListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		return mgDao.selectMList(pi);
	}

	// 모임검색  첫 화면
	@Override
	public ArrayList<Group> selectGList(int currentPage) {
		int listCount = mgDao.getGListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		return mgDao.selectGList(pi);
	}

	// 모임 조건 검색
	@Override
	public ArrayList<Group> selectGsList(int currentPage, MgSearch mg) {
		int listCount = mgDao.getGsListCount(mg);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

		return mgDao.selectGsList(pi,mg);
	}

	// 유저 상세 검색
	@Override
	public ArrayList<Member> selectMsList(int currentPage, MgSearch mg) {
		int listCount = mgDao.getMsListCount(mg);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		return mgDao.selectMsList(pi,mg);
	}

}
