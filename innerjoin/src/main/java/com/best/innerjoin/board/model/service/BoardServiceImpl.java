package com.best.innerjoin.board.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.best.innerjoin.board.model.dao.BoardDao;

@Service("bService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao bDao;
}
