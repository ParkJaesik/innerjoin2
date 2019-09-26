package com.best.innerjoin.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.best.innerjoin.board.model.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	private BoardService bService;
}
