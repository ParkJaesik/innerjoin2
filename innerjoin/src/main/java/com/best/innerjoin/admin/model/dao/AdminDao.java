package com.best.innerjoin.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.best.innerjoin.common.PageInfo;
import com.best.innerjoin.member.model.vo.Member;
import com.best.innerjoin.report.model.vo.GroupReport;

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

}
