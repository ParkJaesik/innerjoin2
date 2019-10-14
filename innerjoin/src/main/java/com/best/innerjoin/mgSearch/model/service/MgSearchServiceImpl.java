package com.best.innerjoin.mgSearch.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



import com.best.innerjoin.member.model.vo.Member;
import com.best.innerjoin.mgSearch.model.dao.MgSearchDao;
import com.best.innerjoin.mgSearch.model.vo.PageInfo;
import com.best.innerjoin.mgSearch.model.vo.Pagination;

@Service
public class MgSearchServiceImpl implements MgSearchService{

	@Autowired
	private MgSearchDao mgDao;

	// 유저 검색페이지 첫 화면
	@Override
	public ArrayList<Member> selectList(int currentPage) {
		int listCount= mgDao.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		return mgDao.selectList(pi);
	}
}
