package com.best.innerjoin.admin.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.best.innerjoin.common.PageInfo;
import com.best.innerjoin.group.model.vo.Group;
import com.best.innerjoin.group.model.vo.GroupMember;
import com.best.innerjoin.member.model.vo.Member;
import com.best.innerjoin.report.model.vo.GroupReport;
import com.best.innerjoin.report.model.vo.MemberReport;

@Repository("adDao")
public class AdminDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int getMemListCount() {
		return sqlSession.selectOne("adminMapper.memListCount");
	}

	public ArrayList<Member> selectMemList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());

		return (ArrayList)sqlSession.selectList("adminMapper.selectMemList", null, rowBounds);
	}

	public Member selectMemBasic(String memberId) {
		return sqlSession.selectOne("adminMapper.selectMemBasic", memberId);
	}

	public Member selectMemDetail(String memberId) {
		return sqlSession.selectOne("adminMapper.selectMemDetail", memberId);
	}

	/** 회원이 가입, 개설한 모임 리스트 조회 DAO
	 * @param memberId
	 * @return
	 */
	public ArrayList<GroupMember> selectMemGroupList(String memberId) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectMemGroupList", memberId);
	}
	
	/** 회원이 가입한 그룹 상세 정보 리스트
	 * @param memberId
	 * @return gList
	 */
	public ArrayList<Group> selectJoinGroupList(String memberId) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectJoinGroupList", memberId);
	}
	
	/** 회원이 받은 신고 리스트
	 * @param memberId
	 * @return mrList
	 */
	public ArrayList<MemberReport> selectMrList(String memberId) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectMrList", memberId);
	}
	
	/** 회원 등급 조정
	 * @param memStatus
	 * @return result
	 */
	public int setMemberStatus(Map<String, String> memStatus) {
		return sqlSession.update("adminMapper.setMemberStatus", memStatus);
	}
	
	/** 회원 신고 처리 상태 바꿔주기
	 * @param reptNoList
	 * @return
	 */
	public int processReport(String reptNoList) {
		return sqlSession.update("adminMapper.processReport", reptNoList);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/** 그룹 신고 개수 구하는 DAO
	 * @return
	 */
	public int getGroupReptListCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminMapper.getGroupReptListCount");
	}

	/** 그룹 신고 리스트 DAO
	 * @param pi
	 * @return
	 */
	public ArrayList<GroupReport> selectGroupReptList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());

		return (ArrayList)sqlSession.selectList("adminMapper.selectGroupReptList", null, rowBounds);
	}

	/** 그룹 개수 DAO
	 * @return
	 */
	public int getGroupListCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminMapper.getGroupListCount");
	}

	/** 그룹 목록 리스트 DAO
	 * @param pi
	 * @return
	 */
	public ArrayList<Group> selectGroupList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());

		return (ArrayList)sqlSession.selectList("adminMapper.selectGroupList", null, rowBounds);
	}

	/** 그룹 상세 정보 DAO
	 * @param gNo
	 * @return
	 */
	public Group selectGroupDetail(int gNo) {
		return sqlSession.selectOne("adminMapper.selectGroupDetail", gNo);
	}

	/** 그룹 상태 업데이트
	 * @param gNo
	 * @param gStatus
	 * @return
	 */
	public int updateGroupStatus(Group group) {
		// TODO Auto-generated method stub
		return sqlSession.update("adminMapper.updateGroupStatus", group);
	}
 
	/** 신고 상태 처리 해주기
	 * @param groupReptNo
	 * @return
	 */
	public int updateReportStatus(Integer groupReptNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("adminMapper.updateReportStatus", groupReptNo);
	}









}
