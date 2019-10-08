package com.best.innerjoin.report.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.best.innerjoin.common.PageInfo;
import com.best.innerjoin.report.model.vo.GroupMemberReport;
import com.best.innerjoin.report.model.vo.Search;

@Repository("rDao")
public class ReportDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	/** 전체 게시글 조회 DAO
	 * @return
	 */
	public int getListCount() {
		return sqlSession.selectOne("reportMapper.getListCount");
	}

	/** 모임 회원 신고 게시글 목록 조회 DAO
	 * 
	 * @return
	 */
	public ArrayList<GroupMemberReport> selectBList(PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return (ArrayList)sqlSession.selectList("reportMapper.selectbList", null, rowBounds);
	}

	
	
	/** 모임 회원 신고게시글 검색 DAO
	 * @param search
	 * @return
	 */
	public ArrayList<GroupMemberReport> searchBList(Search search) {
		return (ArrayList)sqlSession.selectList("reportMapper.searchbList", search);
	}

	/** 모임 회원 신고게시글 작성DAO
	 * @param report
	 * @return
	 */
	public int insertReport(GroupMemberReport report) {

		return sqlSession.insert("reportMapper.insertReport", report);
	}




}
