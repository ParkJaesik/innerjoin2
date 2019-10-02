package com.best.innerjoin.report.controller;

import java.util.ArrayList;

import org.apache.catalina.LifecycleListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.best.innerjoin.report.model.service.ReportService;
import com.best.innerjoin.report.model.vo.GroupMemberReport;
import com.best.innerjoin.report.model.vo.Search;

@Controller
public class ReportController {
	
	@Autowired
	private ReportService rService;
	
	// 모임 회원 신고글 목록 조회
	@RequestMapping("rblist.ij")
	public ModelAndView boardList(ModelAndView mv) {
		
		ArrayList<GroupMemberReport> blist = rService.selectBList();
		
		if(blist != null) {
			mv.addObject("blist", blist).setViewName("report/gMemReportBoardListView");
		}else {
			mv.addObject("msg", "회원 신고 게시글 목록조회 실패").setViewName("common/errorPage");
		}
		return mv;
		
	}
	
	
	@RequestMapping("bsearch.ij")
	public ModelAndView boardSearch(Search search, ModelAndView mv) {
		
		ArrayList<GroupMemberReport> bSearchList = rService.searchBList(search);
		
		for(GroupMemberReport r:bSearchList) {
			
		}
		
		mv.addObject("list", bSearchList).addObject("search", search);
		return mv;
	}
	
	
	
	
	
	

}
