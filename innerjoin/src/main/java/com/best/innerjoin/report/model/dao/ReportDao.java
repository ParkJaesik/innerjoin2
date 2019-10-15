package com.best.innerjoin.report.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.best.innerjoin.common.PageInfo;
import com.best.innerjoin.group.model.vo.GroupMember;
import com.best.innerjoin.report.model.vo.GroupMemberReport;
import com.best.innerjoin.report.model.vo.GroupReport;
import com.best.innerjoin.report.model.vo.MemberReport;
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

	
	/** 모임 회원 신고글 작성
	 * @param report
	 * @return
	 */
	public int insertReport(GroupMemberReport report) {

		return sqlSession.insert("reportMapper.insertReport", report);
	}


	/** 회원 신고게시글 상세
	 * @param rNo
	 * @return
	 */
	public GroupMemberReport selectReport(int rNo) {
		return sqlSession.selectOne("reportMapper.selectReport", rNo);
	}


	/** 회원 신고 처리
	 * @param rNo
	 * @return
	 */
	public int deleteReport(int rNo) {
		return sqlSession.update("reportMapper.deleteReport", rNo);
	}


	/** 회원 신고 횟수 카운트
	 * @param report
	 * @return
	 */
	public int updateReportCount(GroupMemberReport report) {
		deleteReport(report.getrNo());
		
		System.out.println("dao_report : " + report);
		return sqlSession.update("reportMapper.updateReportCount", report);
	}


	/** 신고 받은 회원 리스트
	 * @param responGNo
	 * @return
	 */
	public ArrayList<GroupMember> selectGroupMember(int responGNo, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return (ArrayList)sqlSession.selectList("reportMapper.selectGroupMember", responGNo , rowBounds);
	}
	
	



	/** 신고 받은 그룹회원 수
	 * @return
	 */
	public int getGroupMemberListCount(int responGNo) {
		return sqlSession.selectOne("reportMapper.selectReptMemberCount", responGNo);
	}
	
	
	
	/** 그룹 신고 DAO
	 * @param gReport
	 * @return
	 */
	public int insertGroupReport(GroupReport gReport) {
		return sqlSession.insert("reportMapper.insertGroupReport", gReport);
	}

	
	/** 신고된 회원 강퇴하기
	 * @param memberId
	 * @return
	 */
	public int deleteReptGroupMem(GroupMember groupMember) {
		
		return sqlSession.update("reportMapper.deleteReptGroupMem", groupMember);
	}
	

	/** 신고받은 그룹 신고카운트 증가
	 * @param gReport
	 * @return
	 */
	public int updateGroupReptCount(GroupReport gReport) {
		// TODO Auto-generated method stub
		return sqlSession.update("reportMapper.updateGroupReptCount", gReport);
	}


	/** 회원 신고 dao
	 * @param mReport
	 */
	public int insertMemberReport(MemberReport mReport) {
		return sqlSession.insert("reportMapper.insertMemberReport", mReport);
		
	}


	/** 신고받은 회원 신고받은  횟수 증가
	 * @param mReport
	 * @return
	 */
	public int updateMemberReptCount(MemberReport mReport) {
		// TODO Auto-generated method stub
		return sqlSession.update("reportMapper.updateMemberReptCount", mReport);
	}




	
//	/** 신고당한 회원 리스트
//	 * @param pi
//	 * @return
//	 */
//	public ArrayList<GroupMemberReport> selectMList(PageInfo pi) {
//		
//		int offset = (pi.getCurrentPage() -1 ) * pi.getLimit();
//		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
//		
//		return (ArrayList)sqlSession.selectList("reportMapper.selectMList", null, rowBounds);
//	}




}
