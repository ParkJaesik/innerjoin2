package com.best.innerjoin.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.best.innerjoin.board.model.service.BoardService;
import com.best.innerjoin.board.model.vo.Board;
import com.best.innerjoin.board.model.vo.Reply;
import com.best.innerjoin.common.Pagination;
import com.best.innerjoin.member.model.vo.Member;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

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
	
	// 게시글 수정 화면 이동
	@RequestMapping("bmodifyView.ij")
	public ModelAndView boardModifyView(int boardNo, ModelAndView mv, Integer page) {
		int currentPage = page == null ? 1 : page;
		
		Board board = bService.boardDetail(boardNo);
		
		mv.addObject("board", board).addObject("currentPage", currentPage).setViewName("group/groupBoardModify");
		
		return mv;
	}
	
	// 게시글 수정
	@RequestMapping(value="bmodify.ij", method=RequestMethod.POST)
	public ModelAndView boardModify(Board board, ModelAndView mv, HttpServletRequest request, MultipartFile reloadFile, Integer page) {
		int result = bService.boardModify(board);
		
		if (result > 0) {
			mv.setViewName("redirect:bdetail.ij?boardNo="+board.getBoardNo());
			
		} else {
			mv.addObject("msg", "게시글 수정 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	// 게시글 삭제
	@RequestMapping("bdelete.ij")
	public ModelAndView boardDelete(int boardNo, ModelAndView mv) {
		int result = bService.boardDelete(boardNo);
		
		if (result > 0) {
			mv.setViewName("redirect:blist.ij");
			
		} else {
			mv.addObject("msg", "게시글 삭제 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	// 댓글 조회
	@ResponseBody
	@RequestMapping(value="rlist.ij", produces="application/json; charset=UTF-8")
	public String replyList(int boardNo) {
		ArrayList<Reply> rList = bService.replyList(boardNo);
		
		for(Reply r : rList) {
			r.setReplyWriter(bService.idToName(r.getReplyWriter()));
		}
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm").create();
		
		return new Gson().toJson(rList);
	}
	
	// 댓글 등록
	@ResponseBody
	@RequestMapping("rinsert.ij")
	public String replyInsert(Reply reply, HttpSession session) {
		String replyWriter = ((Member)session.getAttribute("loginUser")).getMemberId();
		
		reply.setReplyWriter(replyWriter);
		
		int result = bService.replyInsert(reply);
		
		if (result > 0) {
			return "success";
			
		} else {
			return "fail";
		}
	}
	
}
