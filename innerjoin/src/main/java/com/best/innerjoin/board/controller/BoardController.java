package com.best.innerjoin.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.best.innerjoin.board.model.service.BoardService;
import com.best.innerjoin.board.model.vo.Board;
import com.best.innerjoin.common.Pagination;

@Controller
public class BoardController {

	@Autowired
	private BoardService bService;
	
	// 게시판 조회
	@RequestMapping("blist.ij")
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
	
	// 게시글 상세 조회
	@RequestMapping("bdetail.ij")
	public ModelAndView boardDetail(int boardNo, ModelAndView mv, Integer page) {
		int currentPage = page == null ? 1 : page;
		
		Board board = bService.boardDetail(boardNo);
		
		if (board != null) {
			mv.addObject("board", board).addObject("currentPage", currentPage).setViewName("group/groupBoardDetail");
			
		} else {
			mv.addObject("msg", "게시글 상세 조회 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 게시글 작성 화면 이동
	@RequestMapping("binsertView.ij")
	public String boardInsertView() {
		return "group/groupBoardInsert";
	}
	
	// 게시글 작성
	@RequestMapping(value="binsert.ij", method=RequestMethod.POST)
	public String boardInsert(Board board, HttpServletRequest request, MultipartFile uploadFile, Model model) {
		int result = bService.boardInsert(board, uploadFile, request);
		
		String path = null;
		
		if (result > 0) {
			path = "redirect:blist.ij";
			
		} else {
			model.addAttribute("msg", "게시글 작성 실패");
			path = "common/errorPage";
		}
		return path;
	}
	
	@RequestMapping("bmodifyView.ij")
	// 게시글 수정 화면 이동
	public ModelAndView boardModifyView(int boardNo, ModelAndView mv, Integer page) {
		int currentPage = page == null ? 1 : page;
		
		Board board = bService.boardDetail(boardNo);
		
		mv.addObject("board", board).addObject("currentPage", currentPage).setViewName("group/groupBoardModify");
		
		return mv;
	}
	
	@RequestMapping(value="bmodify.ij", method=RequestMethod.POST)
	// 게시글 수정
	public ModelAndView boardModify(Board board, ModelAndView mv, HttpServletRequest request, MultipartFile reloadFile, Integer page) {
		int result = bService.boardModify(board, reloadFile, request);
		
		if (result > 0) {
			mv.setViewName("redirect:bdetail.ij?boardNo="+board.getBoardNo()+"&page="+page);
			
		} else {
			mv.addObject("msg", "게시글 수정 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
}
