package com.best.innerjoin.board.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.best.innerjoin.board.model.dao.BoardDao;
import com.best.innerjoin.board.model.vo.Board;
import com.best.innerjoin.board.model.vo.PageInfo;
import com.best.innerjoin.board.model.vo.Reply;
import com.best.innerjoin.common.Pagination;

@Service("bService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao bDao;

	@Override
	public ArrayList<Board> boardList(int currentPage) {
		// 전체 게시글 수 조회
		int listCount = bDao.boardListCount();
		
		// 게시글 목록 조회 (페이징 처리 적용)
		// 1) 페이지 정보 저장
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		// 2) 목록 조회 후 리턴
		return bDao.boardList(pi);
	}

	@Override
	public Board boardDetail(int boardNo) {
		// 조회수 증가
		bDao.addBoardCount(boardNo);
		
		// 게시글 상세 조회
		return bDao.boardDetail(boardNo);
	}

	@Override
	public int boardInsert(Board board, MultipartFile uploadFile, HttpServletRequest request) {
		board.setBoardContent(board.getBoardContent().replace("\n", "<br>"));
		
		int result = bDao.boardInsert(board);
		
		return result;
	}

	@Override
	public int boardModify(Board board) {
		board.setBoardContent(board.getBoardContent().replace("\n", "<br>"));
		
		// 파일 수정 영역
		
		int result = bDao.boardModify(board);
		
		// 파일 서버 저장 영역
		
		return result;
	}

	@Override
	public int boardDelete(int boardNo) {
		return bDao.boardDelete(boardNo);
	}

	@Override
	public ArrayList<Reply> replyList(int boardNo) {
		return bDao.replyList(boardNo);
	}

	@Override
	public int replyInsert(Reply reply) {
		reply.setReplyContent(reply.getReplyContent().replace("\n", "<br>"));
		
		return bDao.replyInsert(reply);
	}

	@Override
	public String idToName(String replyWriter) {
		return bDao.idToName(replyWriter);
	}
}
