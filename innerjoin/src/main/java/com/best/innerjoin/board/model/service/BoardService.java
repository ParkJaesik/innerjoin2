package com.best.innerjoin.board.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.best.innerjoin.board.model.vo.Board;
import com.best.innerjoin.board.model.vo.Reply;

@Service
public interface BoardService {


	/** 게시판 목록  Service
	 * @param currentPage
	 * @return list
	 */
	public abstract ArrayList<Board> boardList(int currentPage);

	/** 게시글 상세 조회 Service
	 * @param boardNo
	 * @return board
	 */
	public abstract Board boardDetail(int boardNo);

	/** 게시글 작성 Service
	 * @param board
	 * @param uploadFile
	 * @param request
	 * @return result
	 */
	public abstract int boardInsert(Board board, MultipartFile uploadFile, HttpServletRequest request);

	/** 게시글 수정 Service
	 * @param board
	 * @param reloadFile
	 * @param request
	 * @return result
	 */
	public abstract int boardModify(Board board);

	/** 게시글 삭제 Service
	 * @param boardNo
	 * @return result
	 */
	public abstract int boardDelete(int boardNo);

	/** 댓글 조회 Service
	 * @param boardNo
	 * @return rList
	 */
	public abstract ArrayList<Reply> replyList(int boardNo);

	/** 댓글 등록 Service
	 * @param reply
	 * @return result
	 */
	public abstract int replyInsert(Reply reply);

	/** 아이디를 이름으로 변경하는 Service
	 * @param replyWriter
	 * @return 
	 */
	public abstract String idToName(String replyWriter);

}
