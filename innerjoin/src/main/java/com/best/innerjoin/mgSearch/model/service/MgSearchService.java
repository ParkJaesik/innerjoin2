package com.best.innerjoin.mgSearch.model.service;

import java.util.ArrayList;

import com.best.innerjoin.member.model.vo.Member;

public interface MgSearchService  {

	/** 유저 검색페이지 접속시 처음 리스트
	 * @param currentPage
	 * @return
	 */
	ArrayList<Member> selectList(int currentPage);

}
