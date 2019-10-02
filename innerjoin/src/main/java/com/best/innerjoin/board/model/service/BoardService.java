package com.best.innerjoin.board.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.best.innerjoin.board.model.vo.Board;

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

}
