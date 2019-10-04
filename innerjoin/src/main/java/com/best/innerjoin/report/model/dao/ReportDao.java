package com.best.innerjoin.report.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.best.innerjoin.report.model.vo.GroupMemberReport;
import com.best.innerjoin.report.model.vo.Search;

@Repository("rDao")
public class ReportDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<GroupMemberReport> selectBList() {
		
		return (ArrayList)sqlSession.selectList("reportMapper.selectbList");
	}

	public ArrayList<GroupMemberReport> searchBList(Search search) {
		return (ArrayList)sqlSession.selectList("reportMapper.searchBList", search);
	}

}
