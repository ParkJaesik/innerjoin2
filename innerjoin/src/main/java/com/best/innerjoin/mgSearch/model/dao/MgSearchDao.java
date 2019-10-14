package com.best.innerjoin.mgSearch.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.best.innerjoin.mgSearch.model.vo.PageInfo;
import com.best.innerjoin.member.model.vo.Member;

@Repository
public class MgSearchDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 유저 수 조회
	 * @return
	 */
	public int getListCount() {
		
		return sqlSession.selectOne("mgSearchMapper.getListCount");
	}

	/** 유저 목록 조회
	 * @param pi
	 * @return
	 */
	public ArrayList<Member> selectList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return (ArrayList)sqlSession.selectList("mgSearchMapper.selectList", null, rowBounds);
	}
}
