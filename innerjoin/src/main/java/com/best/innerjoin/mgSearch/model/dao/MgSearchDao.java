package com.best.innerjoin.mgSearch.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.best.innerjoin.mgSearch.model.vo.MgSearch;
import com.best.innerjoin.mgSearch.model.vo.PageInfo;
import com.best.innerjoin.group.model.vo.Group;
import com.best.innerjoin.member.model.vo.Member;

@Repository
public class MgSearchDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 유저 수 조회
	 * @return
	 */
	public int getMListCount() {
		
		return sqlSession.selectOne("mgSearchMapper.getMListCount");
	}

	/** 유저 목록 조회
	 * @param pi
	 * @return
	 */
	public ArrayList<Member> selectMList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return (ArrayList)sqlSession.selectList("mgSearchMapper.selectMList", null, rowBounds);
	}

	
	/** 모임 수 조회
	 * @return
	 */
	public int getGListCount() {

		return sqlSession.selectOne("mgSearchMapper.getGListCount");
	}

	/** 모임 목록 조회
	 * @param pi
	 * @return
	 */
	public ArrayList<Group> selectGList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1 ) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		return (ArrayList)sqlSession.selectList("mgSearchMapper.selectGList", null, rowBounds);
	}

	/** 모임 조건 맞는 수 검색 
	 * @param mg
	 * @return
	 */
	public int getGsListCount(MgSearch mg) {
		
		return sqlSession.selectOne("mgSearchMapper.getGsListCount", mg);
	}

	/** 모임 조건 목록 조회
	 * @param pi
	 * @param mg
	 * @return
	 */
	public ArrayList<Group> selectGsList(PageInfo pi, MgSearch mg) {
		int offset = (pi.getCurrentPage() -1 ) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return (ArrayList)sqlSession.selectList("mgSearchMapper.selectGsList", mg, rowBounds);
	}

	/** 유저 상세검색 수
	 * @param mg
	 * @return
	 */
	public int getMsListCount(MgSearch mg) {
		
		return sqlSession.selectOne("mgSearchMapper.getMsListCount", mg);
	}

	/** 유저 상세 목록 조회
	 * @param pi
	 * @param mg
	 * @return
	 */
	public ArrayList<Member> selectMsList(PageInfo pi, MgSearch mg) {
		int offset = (pi.getCurrentPage() -1 ) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return (ArrayList)sqlSession.selectList("mgSearchMapper.selectMsList", mg, rowBounds);
	}
}
