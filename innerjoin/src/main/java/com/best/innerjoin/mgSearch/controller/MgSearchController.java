package com.best.innerjoin.mgSearch.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.best.innerjoin.group.model.vo.Group;
import com.best.innerjoin.member.model.vo.Member;
import com.best.innerjoin.mgSearch.model.service.MgSearchService;
import com.best.innerjoin.mgSearch.model.vo.MgSearch;
import com.best.innerjoin.mgSearch.model.vo.Pagination;

@Controller
public class MgSearchController {
	
	@Autowired
	private MgSearchService mgService;
	
	// 유저 검색 기본 페이지
	@RequestMapping("mgSearchForm.ij")
	public ModelAndView mgSearchForm(ModelAndView mv, Integer page) {
		
		int currentPage = page == null ? 1 : page;
		ArrayList<Member> list = mgService.selectMList(currentPage);
		System.out.println(list);
		if(list != null) {
			mv.addObject("list", list).addObject("pi", Pagination.getPageInfo()).setViewName("common/memberSearch");
		} else {
			mv.addObject("msg", "게시물 조회 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	// 유저 상세 검색
	@RequestMapping("memberSearch.ij")
	public ModelAndView memberSearch(ModelAndView mv, Integer page, MgSearch mg) {
		int currentPage = page == null ? 1 : page;
		ArrayList<Member> list = mgService.selectMsList(currentPage, mg);
		if(list != null) {
			mv.addObject("list", list).addObject("pi", Pagination.getPageInfo()).setViewName("common/memberSearch");
		} else {
			mv.addObject("msg", "게시물 조회 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	
	// 모임 검색 기본 페이지
	@RequestMapping("groupSearchForm.ij")
	public ModelAndView groupSearchForm(ModelAndView mv, Integer page) {
		int currentPage = page == null ? 1 : page;
		ArrayList<Group> gList = mgService.selectGList(currentPage);
	
		if(gList != null) {
			mv.addObject("gList", gList).addObject("pi", Pagination.getPageInfo()).setViewName("common/groupSearch");
		} else {
			mv.addObject("msg", "모임 목록 조회 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	
	// 모임 검색
	@RequestMapping("groupSearch.ij")
	public ModelAndView groupSearch(ModelAndView mv, Integer page, MgSearch mg) {
		int currentPage = page == null ? 1 : page;
		
		ArrayList<Group> gList = mgService.selectGsList(currentPage, mg);
		if(gList != null) {
			mv.addObject("gList", gList).addObject("pi", Pagination.getPageInfo()).setViewName("common/groupSearch");
		}else {
			mv.addObject("msg","검색 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	
}
