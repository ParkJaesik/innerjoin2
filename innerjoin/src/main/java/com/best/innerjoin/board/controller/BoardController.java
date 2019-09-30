package com.best.innerjoin.board.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.best.innerjoin.board.model.service.BoardService;
import com.best.innerjoin.board.model.vo.Board;
import com.best.innerjoin.common.Pagination;

@Controller
public class BoardController {

	@Autowired
	private BoardService bService;
	
	@RequestMapping("boardList.best")
	public ModelAndView boardList(ModelAndView mv, Integer page) {
		int currentPage = page == null ? 1 : page;
		
		ArrayList<Board> list = bService.boardList(currentPage);
		
		if (list != null) {
			mv.addObject("list", list).addObject("pi", Pagination.getPageInfo()).setViewName("group/groupBoard");
				
		} else {
			mv.addObject("msg", "게시판을 불러오는데 실패하였습니다").setViewName("common/errorPage");
		}
		
		return mv;
	}
}
