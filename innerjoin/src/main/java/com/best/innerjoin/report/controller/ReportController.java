package com.best.innerjoin.report.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.best.innerjoin.group.model.vo.Group;
import com.best.innerjoin.group.model.vo.GroupMember;
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
	
	
	
	// 회원 신고 게시글 폼
	@RequestMapping("rboardInsertForm.ij")
	public String rboardInsertForm(String memberId, String memberName, Model model) {
		
		
		
		model.addAttribute("memberId", memberId).addAttribute("memberName", memberName);
		
		System.out.println(memberId);
		
		
		return "report/gMemReportBoardInsert";
	}
	
	// 회원신고 게시글 작성
	@RequestMapping("rboard.ij")
	public String memberReport(GroupMemberReport report, Model model, HttpServletRequest request) {
		
		System.out.println(report);
		Group group = (Group)request.getSession().getAttribute("group");
		report.setReportGNo(group.getgNo());
		report.setResponGNo(group.getgNo());
		int result = rService.insertReport(report);
		
		if(result > 0) {
			return "redirect:rblist.ij";
		}else {
			model.addAttribute("msg", "신고글 작성 실패");
			return "common/errorPage";
		}
		
		
	}
	
	// 신고 게시글 상세 조회
	@RequestMapping("rdetail.ij")
	public ModelAndView reportDetail(int rNo, ModelAndView mv, Integer page) {
		
		int currentPage = page == null ? 1 : page;
		
		GroupMemberReport report = rService.selectReport(rNo);
		
		if(report != null) {
			mv.addObject("report", report).addObject("currentPage", currentPage).setViewName("report/gMemReportBoardDetail");
			
		}else {
			mv.addObject("msg", "신고글 상세 조회 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	
	// 신고글 거절
	@RequestMapping("breject.ij")
	public String reportReject(int rNo, Integer page, HttpServletRequest request, Model model) {
		
		GroupMemberReport report = rService.selectReport(rNo);
		
		int result = rService.deleteReport(rNo);
		
		
		if(result > 0) {
			return "redirect:rblist.ij";
		}else {
			model.addAttribute("msg", "게시글 삭제 실패!");
			return "common/errorPage";
		}
	}
	
	
	//  회원 신고 횟수 카운트
	@RequestMapping("gmrcount.ij")
	public String reportcountupdate(GroupMemberReport report, Model model, HttpServletRequest request, Integer page) {
		
		int currentPage = page == null ? 1 :page;
		
		System.out.println(report.toString());
		
		
		int result = rService.updateReportCount(report);
		System.out.println("result : " + result);
		if(result > 0) {
			ArrayList<GroupMember> gmList = rService.selectGroupMember(report.getResponGNo(), currentPage);
			 model.addAttribute("gmList", gmList).addAttribute("currentPage", currentPage);
			return "report/gMemReportListView";
			
		}else {
			model.addAttribute("msg", "회원 신고리스트 출력 실패!");
			return "common/errorPage";
		}
		
	}
	

	

	
	
	
	
	
//	// 신고된 회원 출력 페이지 검색 
//	@RequestMapping("gmrsearch.ij")
//	public ModelAndView gmReportSearch(Search search, ModelAndView mv) {
//		
//		ArrayList<GroupMemberReport> bSearchList = rService.searchBList(search);
//		
//		for(GroupMemberReport r:bSearchList) {
//			
//		}
//		
//		mv.addObject("blist", bSearchList).addObject("search", search).setViewName("report/gMemReportBoardListView");
//		return mv;
//	}
	
	
	
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
