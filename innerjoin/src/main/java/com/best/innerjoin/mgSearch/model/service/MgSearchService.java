package com.best.innerjoin.mgSearch.model.service;

import java.util.ArrayList;

import com.best.innerjoin.group.model.vo.Group;
import com.best.innerjoin.member.model.vo.Member;
import com.best.innerjoin.mgSearch.model.vo.MgSearch;

public interface MgSearchService  {

	/** 유저 검색페이지 접속시 처음 리스트
	 * @param currentPage
	 * @return
	 */
	ArrayList<Member> selectMList(int currentPage);

	ArrayList<Group> selectGList(int currentPage);

	/** 모임 검색 후 목록
	 * @param currentPage
	 * @param mg 
	 * @return
	 */
	ArrayList<Group> selectGsList(int currentPage, MgSearch mg);

	/** 유저 상세 검색
	 * @param currentPage
	 * @param mg
	 * @return
	 */
	ArrayList<Member> selectMsList(int currentPage, MgSearch mg);

}
