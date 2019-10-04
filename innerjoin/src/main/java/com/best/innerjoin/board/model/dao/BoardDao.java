package com.best.innerjoin.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.best.innerjoin.board.model.vo.Board;
import com.best.innerjoin.board.model.vo.PageInfo;
import com.best.innerjoin.board.model.vo.Reply;

@Repository("bDao")
public class BoardDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 전체 게시글 수 조회 DAO
	 * @return listCount
	 */
	public int boardListCount() {
		return sqlSession.selectOne("boardMapper.boardListCount");
	}

	/** 게시글 목록 조회 DAO
	 * @param pi
	 * @return list
	 */
	public ArrayList<Board> boardList(PageInfo pi) {
		// 페이징 처리가 적용된 목록 조회
		// -> Mybatis RowBounds 사용
		
		// offset : 몇 개의 게시글을 건너 뛰고 조회를 할 건지에 대한 계산
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.boardList", null, rowBounds);
	}

	/** 게시글 조회수 증가 DAO
	 * @param boardNo
	 */
	public void addBoardCount(int boardNo) {
		sqlSession.update("boardMapper.addBoardCount", boardNo);
	}

	/** 게시글 상세 조회 DAO
	 * @param boardNo
	 * @return board
	 */
	public Board boardDetail(int boardNo) {
		return sqlSession.selectOne("boardMapper.boardDetail", boardNo);
	}

	/** 게시글 등록 DAO
	 * @param board
	 * @return result
	 */
	public int boardInsert(Board board) {
		return sqlSession.insert("boardMapper.boardInsert", board);
	}

	/** 게시글 수정 DAO
	 * @param board
	 * @return result
	 */
	public int boardModify(Board board) {
		System.out.println(board);
		return sqlSession.update("boardMapper.boardModify", board);
	}

	/** 게시글 삭제 DAO
	 * @param boardNo
	 * @return result
	 */
	public int boardDelete(int boardNo) {
		return sqlSession.update("boardMapper.boardDelete", boardNo);
	}

	/** 댓글 조회 DAO
	 * @param boardNo
	 * @return rList
	 */
	public ArrayList<Reply> replyList(int boardNo) {
		return (ArrayList)sqlSession.selectList("boardMapper.replyList", boardNo);
	}

	/** 댓글 등록 DAO
	 * @param reply
	 * @return result
	 */
	public int replyInsert(Reply reply) {
		return sqlSession.insert("boardMapper.replyInsert", reply);
	}

	/** 아이디를 이름으로 변경하는 DAO
	 * @param replyWriter
	 * @return 
	 */
	public String idToName(String replyWriter) {
		return sqlSession.selectOne("memberMapper.idToName", replyWriter);
	}
}
