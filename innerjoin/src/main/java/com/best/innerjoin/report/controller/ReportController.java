package com.best.innerjoin.report.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.best.innerjoin.report.model.service.ReportService;
import com.best.innerjoin.report.model.vo.GroupMemberReport;
import com.best.innerjoin.report.model.vo.ReportPagination;
import com.best.innerjoin.report.model.vo.Search;

@Controller
public class ReportController {
	
	@Autowired
	private ReportService rService;
	

	// 모임 회원 신고글 목록 조회
	@RequestMapping("rblist.ij")
	public ModelAndView boardList(ModelAndView mv, Integer page) {
		
		
		int currentPage = page == null ? 1 :page;
		
		
		ArrayList<GroupMemberReport> blist = rService.selectBList(currentPage);
		
		if(blist != null) {
			mv.addObject("blist", blist).addObject("pi", ReportPagination.getPageInfo()).setViewName("report/gMemReportBoardListView");
		}else {
			mv.addObject("msg", "회원 신고 게시글 목록조회 실패").setViewName("common/errorPage");
		}
		return mv;
		
	}
	
	// 검색
	@RequestMapping("bsearch.ij")
	public ModelAndView boardSearch(Search search, ModelAndView mv) {
		
		ArrayList<GroupMemberReport> bSearchList = rService.searchBList(search);
		
		for(GroupMemberReport r:bSearchList) {
			
		}
		
		mv.addObject("blist", bSearchList).addObject("search", search).setViewName("report/gMemReportBoardListView");
		return mv;
	}
	
	
	
	@RequestMapping("rboardInsertForm.ij")
	public String rboardInsertForm() {
		return "report/gMemReportBoardInsert";
	}
	
	// 회원신고 게시글 작성
	@RequestMapping("rboard.ij")
	public ModelAndView memberReport(GroupMemberReport report, ModelAndView mv, HttpServletRequest request) {
		
		int result = rService.insertReport(report, request);
		
		if(result > 0) {
			mv.addObject("report", report).setViewName("group/groupIndex");
		}else {
			mv.addObject("msg", "신고글 작성 실패").setViewName("common/errorPage");
		}
		return mv;
		
		
	}
	
	
//	// 신고당한 회원 리스트
//	@RequestMapping("rmlist.ij")
//	public ModelAndView memberList(ModelAndView mv, Integer page) {
//		
//		int currentPage = page == null ? 1 : page;
//		
//		ArrayList<GroupMemberReport> mlist = rService.selectMList(currentPage);
//		
//		
//		return mv;
//		
//	}
	


}
