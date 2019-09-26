package com.best.innerjoin.board.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.best.innerjoin.board.model.vo.Board;

@Service
public interface BoardService {


	/** 게시판 목록  Service
	 * @param currentPage
	 * @return list
	 */
	public abstract ArrayList<Board> boardList(int currentPage);

}
